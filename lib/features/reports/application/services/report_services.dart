import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/report_entities.dart';
import '../../../expenses/domain/entities/expense_entities.dart';
import '../../../income/domain/entities/income_entities.dart';
import '../../../../core/utils/logger.dart';

class DateRangeService {
  static (DateTime, DateTime) getDateRangeForFilter(TimeFilter filter, {DateTime? customStart, DateTime? customEnd}) {
    final now = DateTime.now();
    
    switch (filter) {
      case TimeFilter.daily:
        return (
          DateTime(now.year, now.month, now.day),
          DateTime(now.year, now.month, now.day, 23, 59, 59, 999)
        );
      case TimeFilter.weekly:
        final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        return (
          DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day),
          DateTime(now.year, now.month, now.day, 23, 59, 59, 999)
        );
      case TimeFilter.monthly:
        return (
          DateTime(now.year, now.month, 1),
          DateTime(now.year, now.month + 1, 0, 23, 59, 59, 999)
        );
      case TimeFilter.quarterly:
        final currentQuarter = ((now.month - 1) / 3).floor() + 1;
        final startMonth = (currentQuarter - 1) * 3 + 1;
        return (
          DateTime(now.year, startMonth, 1),
          DateTime(now.year, startMonth + 3, 0, 23, 59, 59, 999)
        );
      case TimeFilter.yearly:
        return (
          DateTime(now.year, 1, 1),
          DateTime(now.year, 12, 31, 23, 59, 59, 999)
        );
      case TimeFilter.custom:
        return (
          customStart ?? DateTime(2000), 
          customEnd ?? now
        );
    }
  }
}

class ExportService {
  static Future<String> exportFinancialReportToCsv({
    required List<Expense> expenses,
    required List<Income> incomes,
  }) async {
    // 1. Request Permission
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        // For Android 11+ fallback to manage external storage
        status = await Permission.manageExternalStorage.request();
        if (!status.isGranted) {
          throw Exception("Storage permission is required to save the CSV.");
        }
      }
    }

    // 2. Generate CSV Data
    final rows = <List<dynamic>>[];
    
    // Header
    rows.add(['Type', 'Date', 'Category', 'Description/Buyer', 'Batch ID', 'Amount (₹)']);
    
    // Incomes
    for (var inc in incomes) {
      rows.add([
        'Income',
        DateFormat('yyyy-MM-dd').format(inc.saleDate),
        inc.category.name,
        inc.buyer.name,
        inc.batchId,
        inc.netAmount,
      ]);
    }
    
    // Expenses
    for (var exp in expenses) {
      rows.add([
        'Expense',
        DateFormat('yyyy-MM-dd').format(exp.date),
        exp.category.name,
        exp.description,
        exp.batchId ?? '',
        exp.amount,
      ]);
    }

    final String csvStr = Csv().encode(rows);

    // 3. Save to File
    Directory? directory;
    if (Platform.isAndroid) {
      directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    if (directory == null) throw Exception("Could not find directory to save file");

    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    final file = File('${directory.path}/FarmStats_Report_$timestamp.csv');
    
    await file.writeAsString(csvStr);
    AppLogger.i('CSV saved to: ${file.path}');
    return file.path;
  }
}
