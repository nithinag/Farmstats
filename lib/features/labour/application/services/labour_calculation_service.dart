import '../../domain/entities/labour_entities.dart';
import '../../../expenses/domain/entities/expense_entities.dart';
import '../../presentation/theme/labour_theme.dart';

/// Single shared domain-level calculation service for Labour & Wages
class LabourCalculationService {
  /// Rounds monetary amounts to 2 decimal places to avoid floating point inaccuracies
  static double roundMoney(double amount) {
    return (amount * 100.0).roundToDouble() / 100.0;
  }

  /// Calculates total paid wages for a given calendar month
  static double calculateMonthlyPaid(List<Expense> labourExpenses, DateTime month) {
    final monthExpenses = labourExpenses.where((e) {
      return e.date.year == month.year && e.date.month == month.month;
    });

    double total = 0.0;
    for (final e in monthExpenses) {
      final info = WageLogInfo.parse(e.description);
      final isPending = info.status.toLowerCase() == 'pending' ||
          info.status.toLowerCase() == 'unpaid' ||
          e.paymentMethod == 'Pending';
      if (!isPending) {
        total += e.amount;
      }
    }
    return roundMoney(total);
  }

  /// Calculates total pending dues across all unpaid wage liabilities and distinct workers
  static ({double totalPending, int pendingWorkersCount, Set<String> workerIds}) calculatePendingDues(
    List<Expense> labourExpenses,
    List<LabourWorker> activeWorkers,
  ) {
    double total = 0.0;
    final workerIdsWithPending = <String>{};

    for (final e in labourExpenses) {
      final info = WageLogInfo.parse(e.description);
      final isPending = info.status.toLowerCase() == 'pending' ||
          info.status.toLowerCase() == 'unpaid' ||
          info.status.toLowerCase() == 'overdue' ||
          e.paymentMethod == 'Pending';

      if (isPending) {
        total += e.amount;
        // Match worker
        for (final w in activeWorkers) {
          if (info.workerName.toLowerCase().trim() == w.fullName.toLowerCase().trim() ||
              e.description.toLowerCase().contains(w.fullName.toLowerCase())) {
            workerIdsWithPending.add(w.id);
            break;
          }
        }
      }
    }

    return (
      totalPending: roundMoney(total),
      pendingWorkersCount: workerIdsWithPending.length,
      workerIds: workerIdsWithPending,
    );
  }

  /// Calculates period summary (paid, pending, total) for a specific worker
  static ({
    double paid,
    int paidCount,
    double pending,
    int pendingCount,
    double total,
    int totalCount,
  }) calculateWorkerPeriodSummary(
    List<Expense> labourExpenses,
    String workerName,
    DateTime month,
  ) {
    final workerLower = workerName.toLowerCase().trim();
    final monthExpenses = labourExpenses.where((e) {
      if (e.date.year != month.year || e.date.month != month.month) return false;
      final info = WageLogInfo.parse(e.description);
      return info.workerName.toLowerCase().trim() == workerLower ||
          e.description.toLowerCase().contains(workerLower);
    }).toList();

    double paidSum = 0.0;
    int paidCount = 0;
    double pendingSum = 0.0;
    int pendingCount = 0;

    for (final e in monthExpenses) {
      final info = WageLogInfo.parse(e.description);
      final isPending = info.status.toLowerCase() == 'pending' ||
          info.status.toLowerCase() == 'unpaid' ||
          info.status.toLowerCase() == 'overdue' ||
          e.paymentMethod == 'Pending';

      if (isPending) {
        pendingSum += e.amount;
        pendingCount++;
      } else {
        paidSum += e.amount;
        paidCount++;
      }
    }

    return (
      paid: roundMoney(paidSum),
      paidCount: paidCount,
      pending: roundMoney(pendingSum),
      pendingCount: pendingCount,
      total: roundMoney(paidSum + pendingSum),
      totalCount: monthExpenses.length,
    );
  }

  /// Calculates all-time total earned and distinct workdays for a specific worker
  static ({double totalEarned, int totalDays}) calculateWorkerAllTime(
    List<Expense> labourExpenses,
    String workerName,
  ) {
    final workerLower = workerName.toLowerCase().trim();
    final workerExpenses = labourExpenses.where((e) {
      final info = WageLogInfo.parse(e.description);
      return info.workerName.toLowerCase().trim() == workerLower ||
          e.description.toLowerCase().contains(workerLower);
    }).toList();

    double totalEarned = 0.0;
    final distinctDates = <String>{};

    for (final e in workerExpenses) {
      totalEarned += e.amount;
      final dateKey = '${e.date.year}-${e.date.month.toString().padLeft(2, '0')}-${e.date.day.toString().padLeft(2, '0')}';
      distinctDates.add(dateKey);
    }

    return (
      totalEarned: roundMoney(totalEarned),
      totalDays: distinctDates.length,
    );
  }

  /// Calculates total labour cost attributed to a batch
  static double calculateBatchLabourCost(List<Expense> labourExpenses, String batchId) {
    double total = 0.0;
    for (final e in labourExpenses) {
      if (e.batchId == batchId) {
        total += e.amount;
      }
    }
    return roundMoney(total);
  }
}
