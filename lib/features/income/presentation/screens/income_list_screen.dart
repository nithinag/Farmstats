import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../shared/widgets/feedback_views.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/color_scheme.dart';
import '../widgets/income_card.dart';
import '../../application/providers/income_notifier.dart';
import '../../application/providers/income_state.dart';
import '../../domain/entities/income_entities.dart';

enum IncomeSortOption {
  dateDesc('Newest First', Icons.calendar_today),
  dateAsc('Oldest First', Icons.history),
  amountDesc('Highest Amount', Icons.arrow_downward),
  amountAsc('Lowest Amount', Icons.arrow_upward),
  buyerAsc('Buyer A-Z', Icons.sort_by_alpha);

  final String label;
  final IconData icon;
  const IncomeSortOption(this.label, this.icon);
}

class IncomeListScreen extends ConsumerStatefulWidget {
  const IncomeListScreen({super.key});

  @override
  ConsumerState<IncomeListScreen> createState() => _IncomeListScreenState();
}

class _IncomeListScreenState extends ConsumerState<IncomeListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedFilter = 'All';
  IncomeSortOption _sortOption = IncomeSortOption.dateDesc;
  final List<String> _filters = ['All', 'This Month', 'Cocoon Sales', 'Paid', 'Pending'];

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
                        'Sort Revenue',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() => _sortOption = IncomeSortOption.dateDesc);
                          Navigator.pop(context);
                        },
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ...IncomeSortOption.values.map((option) {
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
    final state = ref.watch(incomeNotifierProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Revenue'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Badge(
              isLabelVisible: _sortOption != IncomeSortOption.dateDesc,
              child: const Icon(Icons.sort),
            ),
            tooltip: 'Sort Options',
            onPressed: _showSortBottomSheet,
          ),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'add_income_fab',
        onPressed: () => context.push('/income/add'),
        backgroundColor: AppColorScheme.primaryLight,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add Revenue', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: switch (state) {
        IncomeStateInitial() => const DashboardSkeletonLoader(),
        IncomeStateLoading() => const DashboardSkeletonLoader(),
        IncomeStateError(message: final m) => ErrorView(
            error: m,
            onRetry: () => ref.read(incomeNotifierProvider.notifier).loadIncomes(),
          ),
        IncomeStateData(incomes: final incomes) => Column(
            children: [
              // Search Bar & Sort Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
                child: TextField(
                  controller: _searchController,
                  onChanged: (val) => setState(() => _searchQuery = val.trim().toLowerCase()),
                  decoration: InputDecoration(
                    hintText: 'Search revenue by buyer or grade...',
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
                  onRefresh: () => ref.read(incomeNotifierProvider.notifier).loadIncomes(),
                  child: _buildFilteredList(incomes),
                ),
              ),
            ],
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }

  Widget _buildFilteredList(List<Income> incomes) {
    if (incomes.isEmpty) {
      return const EmptyStateView(
        title: 'No Revenue Yet',
        message: 'Click the "Add Revenue" button below to record your first sale.',
        icon: Icons.monetization_on,
      );
    }

    // Apply search and category filters
    final filtered = incomes.where((income) {
      final matchesSearch = income.buyer.name.toLowerCase().contains(_searchQuery) ||
          income.category.name.toLowerCase().contains(_searchQuery) ||
          income.cocoonGrade.toLowerCase().contains(_searchQuery);
      
      var matchesFilter = true;
      if (_selectedFilter == 'This Month') {
        final now = DateTime.now();
        matchesFilter = income.saleDate.month == now.month && income.saleDate.year == now.year;
      } else if (_selectedFilter == 'Cocoon Sales') {
        matchesFilter = income.category.name.toLowerCase().contains('cocoon') ||
            income.buyer.name.toLowerCase().contains('cocoon');
      } else if (_selectedFilter == 'Paid') {
        matchesFilter = income.paymentStatus.toLowerCase() == 'paid';
      } else if (_selectedFilter == 'Pending') {
        matchesFilter = income.paymentStatus.toLowerCase() != 'paid';
      }

      return matchesSearch && matchesFilter;
    }).toList();

    // Apply Sorting
    switch (_sortOption) {
      case IncomeSortOption.dateDesc:
        filtered.sort((a, b) => b.saleDate.compareTo(a.saleDate));
        break;
      case IncomeSortOption.dateAsc:
        filtered.sort((a, b) => a.saleDate.compareTo(b.saleDate));
        break;
      case IncomeSortOption.amountDesc:
        filtered.sort((a, b) => b.netAmount.compareTo(a.netAmount));
        break;
      case IncomeSortOption.amountAsc:
        filtered.sort((a, b) => a.netAmount.compareTo(b.netAmount));
        break;
      case IncomeSortOption.buyerAsc:
        filtered.sort((a, b) => a.buyer.name.compareTo(b.buyer.name));
        break;
    }

    if (filtered.isEmpty) {
      return const EmptyStateView(
        title: 'No Matching Revenue',
        message: 'Try adjusting your search keywords or filter selection.',
        icon: Icons.monetization_on,
      );
    }

    // Group by month and year
    final Map<String, List<Income>> grouped = {};
    final Map<String, double> monthTotals = {};

    for (final income in filtered) {
      final key = DateFormat('MMMM yyyy').format(income.saleDate);
      if (!grouped.containsKey(key)) {
        grouped[key] = [];
        monthTotals[key] = 0.0;
      }
      grouped[key]!.add(income);
      monthTotals[key] = monthTotals[key]! + income.netAmount;
    }

    final currencyFormatter = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    return CustomScrollView(
      slivers: grouped.entries.map((final entry) {
        final totalStr = currencyFormatter.format(monthTotals[entry.key] ?? 0.0);

        return SliverMainAxisGroup(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _IncomeStickyHeaderDelegate(
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
                    final income = entry.value[index];
                    return IncomeCard(
                      income: income,
                      onTap: () => context.push('/income/${income.id}', extra: income),
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

class _IncomeStickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final String totalAmount;
  final int itemCount;

  _IncomeStickyHeaderDelegate({
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
                  color: const Color(0xFF2E7D32),
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
  bool shouldRebuild(covariant _IncomeStickyHeaderDelegate oldDelegate) =>
      title != oldDelegate.title ||
      totalAmount != oldDelegate.totalAmount ||
      itemCount != oldDelegate.itemCount;
}

