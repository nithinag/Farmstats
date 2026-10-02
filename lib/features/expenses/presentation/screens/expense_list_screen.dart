import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../shared/widgets/feedback_views.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/color_scheme.dart';
import '../widgets/expense_card.dart';
import '../../application/providers/expense_notifier.dart';
import '../../application/providers/expense_state.dart';
import '../../domain/entities/expense_entities.dart';

enum ExpenseSortOption {
  dateDesc('Newest First', Icons.calendar_today),
  dateAsc('Oldest First', Icons.history),
  amountDesc('Highest Amount', Icons.arrow_downward),
  amountAsc('Lowest Amount', Icons.arrow_upward),
  categoryAsc('Category A-Z', Icons.sort_by_alpha);

  final String label;
  final IconData icon;
  const ExpenseSortOption(this.label, this.icon);
}

class ExpenseListScreen extends ConsumerStatefulWidget {
  const ExpenseListScreen({super.key});

  @override
  ConsumerState<ExpenseListScreen> createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends ConsumerState<ExpenseListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedFilter = 'All';
  ExpenseSortOption _sortOption = ExpenseSortOption.dateDesc;
  final List<String> _filters = ['All', 'This Month', 'DFLs', 'Labour', 'Feed', 'Medicine'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.xs),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sort Expenses',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() => _sortOption = ExpenseSortOption.dateDesc);
                          Navigator.pop(context);
                        },
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ...ExpenseSortOption.values.map((option) {
                  final isSelected = _sortOption == option;
                  return ListTile(
                    leading: Icon(
                      option.icon,
                      color: isSelected
                          ? AppColorScheme.primaryLight
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    title: Text(
                      option.label,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? AppColorScheme.primaryLight : null,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.check_circle, color: AppColorScheme.primaryLight)
                        : null,
                    onTap: () {
                      setState(() => _sortOption = option);
                      Navigator.pop(context);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(expenseNotifierProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Badge(
              isLabelVisible: _sortOption != ExpenseSortOption.dateDesc,
              child: const Icon(Icons.sort),
            ),
            tooltip: 'Sort Options',
            onPressed: _showSortBottomSheet,
          ),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'add_expense_fab',
        onPressed: () => context.push('/expenses/add'),
        backgroundColor: AppColorScheme.primaryLight,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add Expense', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: switch (state) {
        ExpenseStateInitial() => const DashboardSkeletonLoader(),
        ExpenseStateLoading() => const DashboardSkeletonLoader(),
        ExpenseStateError(message: final m) => ErrorView(
            error: m,
            onRetry: () => ref.read(expenseNotifierProvider.notifier).loadExpenses(),
          ),
        ExpenseStateData(expenses: final expenses) => Column(
            children: [
              // Search Bar & Sort Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
                child: TextField(
                  controller: _searchController,
                  onChanged: (val) => setState(() => _searchQuery = val.trim().toLowerCase()),
                  decoration: InputDecoration(
                    hintText: 'Search expenses by name or category...',
                    prefixIcon: const Icon(Icons.search, size: 20),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, size: 18),
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _searchQuery = '');
                            },
                          )
                        : null,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: AppSpacing.md),
                  ),
                ),
              ),
              // Filter Chips Row
              SizedBox(
                height: 46,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 4),
                  itemCount: _filters.length,
                  itemBuilder: (context, index) {
                    final filter = _filters[index];
                    final isSelected = _selectedFilter == filter;
                    return Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.sm),
                      child: ChoiceChip(
                        label: Text(filter),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() => _selectedFilter = filter);
                          }
                        },
                        selectedColor: isDark
                            ? AppColorScheme.primaryContainer.withValues(alpha: 0.3)
                            : AppColorScheme.primaryContainer.withValues(alpha: 0.6),
                        labelStyle: TextStyle(
                          color: isSelected
                              ? (isDark ? Colors.white : AppColorScheme.primaryLight)
                              : Theme.of(context).colorScheme.onSurface,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          fontSize: 12,
                        ),
                        side: BorderSide(
                          color: isSelected
                              ? AppColorScheme.primaryLight
                              : (isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight),
                          width: 1,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              // List items
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => ref.read(expenseNotifierProvider.notifier).loadExpenses(),
                  child: _buildFilteredList(expenses),
                ),
              ),
            ],
          ),
      },
    );
  }

  Widget _buildFilteredList(List<Expense> expenses) {
    if (expenses.isEmpty) {
      return const EmptyStateView(
        title: 'No Expenses Yet',
        message: 'Click the "Add Expense" button below to log your first cost.',
        icon: Icons.receipt_long,
      );
    }

    // Apply search and category filters
    final filtered = expenses.where((expense) {
      final matchesSearch = expense.description.toLowerCase().contains(_searchQuery) ||
          expense.category.name.toLowerCase().contains(_searchQuery);
      
      var matchesFilter = true;
      if (_selectedFilter == 'This Month') {
        final now = DateTime.now();
        matchesFilter = expense.date.month == now.month && expense.date.year == now.year;
      } else if (_selectedFilter == 'DFLs') {
        matchesFilter = expense.category.name.toLowerCase().contains('dfl') ||
            expense.description.toLowerCase().contains('dfl');
      } else if (_selectedFilter == 'Labour') {
        matchesFilter = expense.category.name.toLowerCase().contains('labour') ||
            expense.description.toLowerCase().contains('labour');
      } else if (_selectedFilter == 'Feed') {
        matchesFilter = expense.category.name.toLowerCase().contains('feed') ||
            expense.category.name.toLowerCase().contains('mulberry') ||
            expense.description.toLowerCase().contains('leaf');
      } else if (_selectedFilter == 'Medicine') {
        matchesFilter = expense.category.name.toLowerCase().contains('med') ||
            expense.description.toLowerCase().contains('chemical') ||
            expense.description.toLowerCase().contains('spray');
      }

      return matchesSearch && matchesFilter;
    }).toList();

    // Apply Sorting
    switch (_sortOption) {
      case ExpenseSortOption.dateDesc:
        filtered.sort((a, b) => b.date.compareTo(a.date));
        break;
      case ExpenseSortOption.dateAsc:
        filtered.sort((a, b) => a.date.compareTo(b.date));
        break;
      case ExpenseSortOption.amountDesc:
        filtered.sort((a, b) => b.amount.compareTo(a.amount));
        break;
      case ExpenseSortOption.amountAsc:
        filtered.sort((a, b) => a.amount.compareTo(b.amount));
        break;
      case ExpenseSortOption.categoryAsc:
        filtered.sort((a, b) => a.category.name.compareTo(b.category.name));
        break;
    }

    if (filtered.isEmpty) {
      return const EmptyStateView(
        title: 'No Matching Expenses',
        message: 'Try adjusting your search keywords or filter selection.',
        icon: Icons.receipt_long,
      );
    }

    // Group by month and year
    final Map<String, List<Expense>> grouped = {};
    final Map<String, double> monthTotals = {};

    for (final expense in filtered) {
      final key = DateFormat('MMMM yyyy').format(expense.date);
      if (!grouped.containsKey(key)) {
        grouped[key] = [];
        monthTotals[key] = 0.0;
      }
      grouped[key]!.add(expense);
      monthTotals[key] = monthTotals[key]! + expense.amount;
    }

    final currencyFormatter = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    return CustomScrollView(
      slivers: grouped.entries.map((final entry) {
        final totalStr = currencyFormatter.format(monthTotals[entry.key] ?? 0.0);

        return SliverMainAxisGroup(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _ExpenseStickyHeaderDelegate(
                title: entry.key,
                totalAmount: totalStr,
                itemCount: entry.value.length,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final expense = entry.value[index];
                    return ExpenseCard(
                      expense: expense,
                      onTap: () => context.push('/expenses/${expense.id}', extra: expense),
                    );
                  },
                  childCount: entry.value.length,
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class _ExpenseStickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final String totalAmount;
  final int itemCount;

  _ExpenseStickyHeaderDelegate({
    required this.title,
    required this.totalAmount,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.96),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 6),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[800] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$itemCount',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          Text(
            totalAmount,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFC62828),
                ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 38.0;

  @override
  double get minExtent => 38.0;

  @override
  bool shouldRebuild(covariant _ExpenseStickyHeaderDelegate oldDelegate) =>
      title != oldDelegate.title ||
      totalAmount != oldDelegate.totalAmount ||
      itemCount != oldDelegate.itemCount;
}

