import 'dart:convert';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../data/database/app_database.dart';
import 'file_storage_service.dart';

class ExportService {
  final AppDatabase db;

  ExportService(this.db);

  Future<String?> exportDatabaseToJson() async {
    final Map<String, dynamic> backupData = {};

    backupData['expenses'] = (await db.select(db.expensesTable).get()).map((e) => e.toJson()).toList();
    backupData['expense_categories'] = (await db.select(db.expenseCategoriesTable).get()).map((e) => e.toJson()).toList();
    
    backupData['incomes'] = (await db.select(db.incomesTable).get()).map((e) => e.toJson()).toList();
    backupData['income_categories'] = (await db.select(db.incomeCategoriesTable).get()).map((e) => e.toJson()).toList();
    backupData['buyers'] = (await db.select(db.buyersTable).get()).map((e) => e.toJson()).toList();
    
    backupData['batches'] = (await db.select(db.batchesTable).get()).map((e) => e.toJson()).toList();
    backupData['batch_timelines'] = (await db.select(db.batchTimelinesTable).get()).map((e) => e.toJson()).toList();
    
    backupData['inventory_items'] = (await db.select(db.inventoryItemsTable).get()).map((e) => e.toJson()).toList();
    backupData['inventory_categories'] = (await db.select(db.inventoryCategoriesTable).get()).map((e) => e.toJson()).toList();
    backupData['inventory_transactions'] = (await db.select(db.inventoryTransactionsTable).get()).map((e) => e.toJson()).toList();
    
    backupData['workers'] = (await db.select(db.workersTable).get()).map((e) => e.toJson()).toList();
    backupData['attendance'] = (await db.select(db.attendanceTable).get()).map((e) => e.toJson()).toList();
    backupData['assignments'] = (await db.select(db.assignmentsTable).get()).map((e) => e.toJson()).toList();
    
    backupData['feeding_logs'] = (await db.select(db.feedingLogsTable).get()).map((e) => e.toJson()).toList();
    backupData['environmental_logs'] = (await db.select(db.environmentalLogsTable).get()).map((e) => e.toJson()).toList();
    backupData['mortality_logs'] = (await db.select(db.mortalityLogsTable).get()).map((e) => e.toJson()).toList();
    
    backupData['harvests'] = (await db.select(db.harvestsTable).get()).map((e) => e.toJson()).toList();
    backupData['notifications'] = (await db.select(db.notificationsTable).get()).map((e) => e.toJson()).toList();

    final jsonString = jsonEncode(backupData);
    final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
    final file = await FileStorageService.saveFile(ExportType.json, 'farmstats_full_backup_$timestamp.json', jsonString);
    
    return file?.path;
  }

  Future<String?> exportExpensesToCsv() async {
    final expenses = await db.expenseDao.getAllExpenses();
    final List<List<dynamic>> rows = [];
    
    rows.add(['ID', 'Date', 'Amount', 'Category', 'Payment Method', 'Description', 'Batch ID']);
    
    for (var exp in expenses) {
      rows.add([
        exp.expense.id,
        exp.expense.date.toIso8601String(),
        exp.expense.amount,
        exp.category.name,
        exp.expense.paymentMethod,
        exp.expense.description,
        exp.expense.batchId ?? ''
      ]);
    }
    
    final csvString = rows.map((row) => row.map((e) => '"${e.toString().replaceAll('"', '""')}"').join(',')).join('\n');
    final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
    final file = await FileStorageService.saveFile(ExportType.csv, 'expenses_$timestamp.csv', csvString);
    return file?.path;
  }

  Future<String?> generatePdfReport() async {
    final pdf = pw.Document();
    
    // Fetch some basic data for the report
    final expenses = await db.expenseDao.getAllExpenses();
    final incomes = await db.incomeDao.getAllIncomes();
    
    final double totalExpense = expenses.fold(0.0, (sum, item) => sum + item.expense.amount);
    final double totalIncome = incomes.fold(0.0, (sum, item) => sum + item.income.netAmount);
    final double profit = totalIncome - totalExpense;

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Header(level: 0, child: pw.Text('FARMSTATS System Report', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold))),
            pw.Paragraph(text: 'Date: ${DateTime.now().toIso8601String().split('T').first}'),
            pw.SizedBox(height: 20),
            pw.Text('Financial Summary', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.Divider(),
            pw.TableHelper.fromTextArray(
              context: context,
              data: <List<String>>[
                <String>['Category', 'Amount (INR)'],
                <String>['Total Income', totalIncome.toStringAsFixed(2)],
                <String>['Total Expenses', totalExpense.toStringAsFixed(2)],
                <String>['Net Profit/Loss', profit.toStringAsFixed(2)],
              ],
            ),
            pw.SizedBox(height: 40),
            pw.Text('Note: This is an automatically generated system audit report.'),
          ];
        },
      ),
    );

    final bytes = await pdf.save();
    final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
    final file = await FileStorageService.saveFile(ExportType.pdf, 'farmstats_report_$timestamp.pdf', '', isBytes: true, bytes: bytes);
    
    return file?.path;
  }
}
