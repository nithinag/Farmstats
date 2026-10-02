import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dashboard_models.dart';

final dashboardMockDataSourceProvider = Provider<IDashboardDataSource>((ref) {
  return DashboardMockDataSourceImpl();
});

abstract class IDashboardDataSource {
  Future<DashboardDataModel> getMockDashboardData();
}

class DashboardMockDataSourceImpl implements IDashboardDataSource {
  @override
  Future<DashboardDataModel> getMockDashboardData() async {
    // Simulate network or database latency
    await Future.delayed(const Duration(milliseconds: 800));

    const String mockJson = '''
    {
      "summary": {
        "active_batches": 4,
        "todays_tasks": 7,
        "net_income": 150000.50
      },
      "metrics": [
        {
          "title": "Total Income",
          "value": "200,000",
          "icon_type": "income"
        },
        {
          "title": "Total Expenses",
          "value": "49,999.50",
          "icon_type": "expense"
        }
      ],
      "quick_actions": [
        {
          "id": "q1",
          "label": "Add Batch",
          "icon_type": "batch"
        },
        {
          "id": "q2",
          "label": "Add Expense",
          "icon_type": "expense"
        },
        {
          "id": "q3",
          "label": "Add Income",
          "icon_type": "income"
        },
        {
          "id": "q4",
          "label": "Reports",
          "icon_type": "report"
        }
      ],
      "recent_activities": [
        {
          "id": "a1",
          "title": "Cocoon Sales",
          "subtitle": "Income from Batch A",
          "timestamp": "2026-07-29T08:00:00Z",
          "activity_type": "income"
        },
        {
          "id": "a2",
          "title": "Mulberry Leaves",
          "subtitle": "Expense for Batch B",
          "timestamp": "2026-07-28T14:30:00Z",
          "activity_type": "expense"
        }
      ],
      "chart_summary": {
        "income_data_points": [100.0, 150.0, 200.0, 180.0, 250.0],
        "expense_data_points": [50.0, 60.0, 45.0, 80.0, 55.0],
        "labels": ["Mon", "Tue", "Wed", "Thu", "Fri"]
      }
    }
    ''';

    final Map<String, dynamic> data = json.decode(mockJson);
    return DashboardDataModel.fromJson(data);
  }
}
