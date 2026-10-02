import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../features/expenses/domain/entities/expense_entities.dart';
import '../features/expenses/presentation/screens/expense_list_screen.dart';
import '../features/expenses/presentation/screens/expense_form_screen.dart';
import '../features/expenses/presentation/screens/expense_details_screen.dart';
import '../features/income/domain/entities/income_entities.dart';
import '../features/income/presentation/screens/income_list_screen.dart';
import '../features/income/presentation/screens/income_form_screen.dart';
import '../features/income/presentation/screens/income_details_screen.dart';
import '../features/inventory/domain/entities/inventory_entities.dart';
import '../features/inventory/presentation/screens/inventory_list_screen.dart';
import '../features/inventory/presentation/screens/inventory_form_screen.dart';
import '../features/inventory/presentation/screens/inventory_details_screen.dart';
import '../features/labour/domain/entities/labour_entities.dart';
import '../features/labour/presentation/screens/worker_list_screen.dart';
import '../features/labour/presentation/screens/worker_form_screen.dart';
import '../features/labour/presentation/screens/worker_details_screen.dart';
import '../features/labour/presentation/screens/attendance_screen.dart';
import '../features/feeding/presentation/screens/todays_feedings_screen.dart';
import '../features/feeding/presentation/screens/feeding_form_screen.dart';
import '../features/feeding/presentation/screens/health_tracking_screen.dart';
import '../features/harvest/domain/entities/harvest_entities.dart';
import '../features/harvest/presentation/screens/harvest_list_screen.dart';
import '../features/harvest/presentation/screens/harvest_form_screen.dart';
import '../features/harvest/presentation/screens/harvest_details_screen.dart';
import '../features/harvest/presentation/screens/cocoon_sale_wizard_screen.dart';
import '../features/reports/presentation/screens/reports_dashboard_screen.dart';
import '../features/reports/presentation/screens/financial_report_screen.dart';
import '../features/notifications/presentation/screens/notification_center_screen.dart';
import '../features/backup/presentation/screens/backup_dashboard_screen.dart';
import '../features/batches/domain/entities/batch_entities.dart';
import '../features/batches/presentation/screens/batch_list_screen.dart';
import '../features/batches/presentation/screens/batch_form_screen.dart';
import '../features/batches/presentation/screens/batch_details_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../features/settings/presentation/screens/farm_profile_screen.dart';
import '../features/settings/presentation/screens/preferences_screen.dart';
import '../features/settings/presentation/screens/about_screen.dart';
import '../features/onboarding/presentation/screens/welcome_screen.dart';
import '../shared/widgets/navigation_shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/dashboard',
  routes: [
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    // Unified Cocoon Sale Wizard
    GoRoute(
      path: '/cocoon-sale',
      builder: (context, state) {
        final batchId = state.extra as String?;
        return CocoonSaleWizardScreen(initialBatchId: batchId);
      },
    ),
    // Full-screen operational routes
    GoRoute(
      path: '/inventory',
      builder: (context, state) => const InventoryListScreen(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const InventoryFormScreen(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final item = state.extra as InventoryItem;
            return InventoryDetailsScreen(item: item);
          },
          routes: [
            GoRoute(
              path: 'edit',
              builder: (context, state) {
                final item = state.extra as InventoryItem;
                return InventoryFormScreen(item: item);
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/labour',
      builder: (context, state) => const WorkerListScreen(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const WorkerFormScreen(),
        ),
        GoRoute(
          path: 'attendance',
          builder: (context, state) => const AttendanceScreen(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final worker = state.extra as LabourWorker;
            return WorkerDetailsScreen(worker: worker);
          },
          routes: [
            GoRoute(
              path: 'edit',
              builder: (context, state) {
                final worker = state.extra as LabourWorker;
                return WorkerFormScreen(worker: worker);
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/feeding',
      builder: (context, state) => const TodaysFeedingsScreen(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) {
            final batchId = state.extra as String?;
            return FeedingFormScreen(initialBatchId: batchId);
          },
        ),
        GoRoute(
          path: 'health',
          builder: (context, state) => const HealthTrackingScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/harvest',
      builder: (context, state) => const HarvestListScreen(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const HarvestFormScreen(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final harvest = state.extra as HarvestRecord;
            return HarvestDetailsScreen(harvest: harvest);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/income',
      builder: (context, state) => const IncomeListScreen(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) {
            final batchId = state.extra as String?;
            return IncomeFormScreen(initialBatchId: batchId);
          },
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final income = state.extra as Income;
            return IncomeDetailsScreen(income: income);
          },
          routes: [
            GoRoute(
              path: 'edit',
              builder: (context, state) {
                final income = state.extra as Income;
                return IncomeFormScreen(income: income);
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationCenterScreen(),
    ),

    // Stateful Shell Route for Bottom Nav Tabs
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationShell(navigationShell: navigationShell);
      },
      branches: [
        // Branch 0: Dashboard (Home)
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/dashboard',
              builder: (context, state) => const DashboardScreen(),
            ),
          ],
        ),
        // Branch 1: Batches
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/batch',
              builder: (context, state) => const BatchListScreen(),
              routes: [
                GoRoute(
                  path: 'add',
                  builder: (context, state) => const BatchFormScreen(),
                ),
                GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    final batch = state.extra as Batch;
                    return BatchDetailsScreen(batch: batch);
                  },
                  routes: [
                    GoRoute(
                      path: 'edit',
                      builder: (context, state) {
                        final batch = state.extra as Batch;
                        return BatchFormScreen(batch: batch);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // Branch 2: Expenses
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/expenses',
              builder: (context, state) => const ExpenseListScreen(),
              routes: [
                GoRoute(
                  path: 'add',
                  builder: (context, state) {
                    final batchId = state.extra as String?;
                    return ExpenseFormScreen(initialBatchId: batchId);
                  },
                ),
                GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    final expense = state.extra as Expense;
                    return ExpenseDetailsScreen(expense: expense);
                  },
                  routes: [
                    GoRoute(
                      path: 'edit',
                      builder: (context, state) {
                        final expense = state.extra as Expense;
                        return ExpenseFormScreen(expense: expense);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // Branch 3: Reports & Analytics
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/reports',
              builder: (context, state) => const ReportsDashboardScreen(),
              routes: [
                GoRoute(
                  path: 'financial',
                  builder: (context, state) => const FinancialReportScreen(),
                ),
              ],
            ),
          ],
        ),
        // Branch 4: Settings & Farm Configuration
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsScreen(),
              routes: [
                GoRoute(
                  path: 'profile',
                  builder: (context, state) => const FarmProfileScreen(),
                ),
                GoRoute(
                  path: 'preferences',
                  builder: (context, state) => const PreferencesScreen(),
                ),
                GoRoute(
                  path: 'about',
                  builder: (context, state) => const AboutScreen(),
                ),
                GoRoute(
                  path: 'backup',
                  builder: (context, state) => const BackupDashboardScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
