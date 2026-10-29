import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme/labour_theme.dart';
import '../../domain/entities/labour_entities.dart';
import '../../application/services/worker_photo_service.dart';
import '../../../batches/domain/entities/batch_entities.dart';

/// Worker Avatar supporting persistent local photo or initials with pastel background
class WorkerAvatar extends StatefulWidget {
  final LabourWorker? worker;
  final String name;
  final String? initialPhotoPath;
  final double size;
  final Color? fallbackBgColor;

  const WorkerAvatar({
    super.key,
    this.worker,
    this.name = 'Worker',
    this.initialPhotoPath,
    this.size = 44.0,
    this.fallbackBgColor,
  });

  @override
  State<WorkerAvatar> createState() => _WorkerAvatarState();
}

class _WorkerAvatarState extends State<WorkerAvatar> {
  String? _photoPath;

  @override
  void initState() {
    super.initState();
    _photoPath = widget.initialPhotoPath;
    _loadPhoto();
  }

  @override
  void didUpdateWidget(WorkerAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialPhotoPath != widget.initialPhotoPath ||
        oldWidget.worker?.id != widget.worker?.id) {
      _photoPath = widget.initialPhotoPath;
      _loadPhoto();
    }
  }

  Future<void> _loadPhoto() async {
    if (widget.initialPhotoPath != null) return;
    if (widget.worker != null) {
      final path = await WorkerPhotoService.getPhotoPath(widget.worker!.id);
      if (mounted && path != null) {
        setState(() => _photoPath = path);
      }
    }
  }

  Color _getInitialsBg(String name) {
    if (widget.fallbackBgColor != null) return widget.fallbackBgColor!;
    final firstChar = name.isNotEmpty ? name[0].toUpperCase() : 'W';
    switch (firstChar) {
      case 'R':
        return const Color(0xFFD1FAE5); // soft emerald
      case 'S':
        return const Color(0xFFFFE4E6); // soft rose/coral
      case 'K':
        return const Color(0xFFDBEAFE); // soft blue
      case 'N':
        return const Color(0xFFEAF1E8); // soft sage
      default:
        return const Color(0xFFF4E9DB); // soft earth
    }
  }

  Color _getInitialsTextColor(String name) {
    final firstChar = name.isNotEmpty ? name[0].toUpperCase() : 'W';
    switch (firstChar) {
      case 'R':
        return const Color(0xFF047857);
      case 'S':
        return const Color(0xFFBE123C);
      case 'K':
        return const Color(0xFF1D4ED8);
      case 'N':
        return LabourColors.forestGreen;
      default:
        return LabourColors.earthBrown;
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayName = widget.worker?.fullName ?? widget.name;
    final initials = displayName.trim().isNotEmpty ? displayName.trim()[0].toUpperCase() : 'W';

    if (_photoPath != null && File(_photoPath!).existsSync()) {
      return Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: LabourColors.border, width: 1),
          image: DecorationImage(
            image: FileImage(File(_photoPath!)),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    final bgColor = _getInitialsBg(displayName);
    final textColor = _getInitialsTextColor(displayName);

    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        border: Border.all(color: LabourColors.border.withValues(alpha: 0.5), width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          color: textColor,
          fontSize: widget.size * 0.42,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// Component 3: Select Work Type Modal Bottom Sheet
class SelectWorkTypeSheet extends StatefulWidget {
  final String selectedTask;
  final ValueChanged<String> onSelected;

  const SelectWorkTypeSheet({
    super.key,
    required this.selectedTask,
    required this.onSelected,
  });

  static Future<String?> show(BuildContext context, String currentTask) {
    return showModalBottomSheet<String>(
      context: context,
      backgroundColor: LabourColors.cardSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SelectWorkTypeSheet(
        selectedTask: currentTask,
        onSelected: (task) => Navigator.pop(ctx, task),
      ),
    );
  }

  @override
  State<SelectWorkTypeSheet> createState() => _SelectWorkTypeSheetState();
}

class _SelectWorkTypeSheetState extends State<SelectWorkTypeSheet> {
  late String _current;

  @override
  void initState() {
    super.initState();
    _current = widget.selectedTask;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: LabourColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Work Type',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: LabourColors.primaryText,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded, size: 20, color: LabourColors.secondaryText),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ...LabourWorkType.sericultureTypes.map((type) {
              final isSelected = _current.toLowerCase().trim() == type.title.toLowerCase().trim();
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: isSelected ? LabourColors.softGreenSurface : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? LabourColors.forestGreen : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  leading: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: type.bgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Icon(type.icon, color: type.iconColor, size: 20),
                  ),
                  title: Text(
                    type.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: LabourColors.primaryText,
                    ),
                  ),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle_rounded, color: LabourColors.forestGreen, size: 22)
                      : null,
                  onTap: () => setState(() => _current = type.title),
                ),
              );
            }),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => widget.onSelected(_current),
                style: ElevatedButton.styleFrom(
                  backgroundColor: LabourColors.forestGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Done', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Component 2: Shift Selector Modal Bottom Sheet
class SelectShiftSheet extends StatefulWidget {
  final FarmShift selectedShift;
  final ValueChanged<FarmShift> onSelected;

  const SelectShiftSheet({
    super.key,
    required this.selectedShift,
    required this.onSelected,
  });

  static Future<FarmShift?> show(BuildContext context, FarmShift currentShift) {
    return showModalBottomSheet<FarmShift>(
      context: context,
      backgroundColor: LabourColors.cardSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SelectShiftSheet(
        selectedShift: currentShift,
        onSelected: (shift) => Navigator.pop(ctx, shift),
      ),
    );
  }

  @override
  State<SelectShiftSheet> createState() => _SelectShiftSheetState();
}

class _SelectShiftSheetState extends State<SelectShiftSheet> {
  late FarmShift _current;

  @override
  void initState() {
    super.initState();
    _current = widget.selectedShift;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: LabourColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Shift',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: LabourColors.primaryText,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded, size: 20, color: LabourColors.secondaryText),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ...FarmShift.defaultShifts.map((shift) {
              final isSelected = _current.id == shift.id;
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: isSelected ? LabourColors.softGreenSurface : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected ? LabourColors.forestGreen : LabourColors.border,
                    width: isSelected ? 1.5 : 1.0,
                  ),
                ),
                child: InkWell(
                  onTap: () => setState(() => _current = shift),
                  borderRadius: BorderRadius.circular(14),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: shift.bgColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Icon(shift.icon, color: shift.iconColor, size: 22),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shift.name,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                                  color: LabourColors.primaryText,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                shift.timeRange,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: LabourColors.secondaryText,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                shift.description,
                                style: const TextStyle(
                                  fontSize: 12,
                                  height: 1.3,
                                  color: LabourColors.secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          isSelected ? Icons.check_circle_rounded : Icons.radio_button_unchecked,
                          color: isSelected ? LabourColors.forestGreen : LabourColors.secondaryText,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => widget.onSelected(_current),
                style: ElevatedButton.styleFrom(
                  backgroundColor: LabourColors.forestGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Done', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Component 8: Worker Search Modal Bottom Sheet
class WorkerPickerSheet extends StatefulWidget {
  final List<LabourWorker> workers;
  final LabourWorker? selectedWorker;
  final ValueChanged<LabourWorker> onSelected;

  const WorkerPickerSheet({
    super.key,
    required this.workers,
    this.selectedWorker,
    required this.onSelected,
  });

  static Future<LabourWorker?> show(
    BuildContext context, {
    required List<LabourWorker> workers,
    LabourWorker? currentWorker,
  }) {
    return showModalBottomSheet<LabourWorker>(
      context: context,
      isScrollControlled: true,
      backgroundColor: LabourColors.cardSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.65,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (_, scrollController) => WorkerPickerSheet(
          workers: workers,
          selectedWorker: currentWorker,
          onSelected: (worker) => Navigator.pop(ctx, worker),
        ),
      ),
    );
  }

  @override
  State<WorkerPickerSheet> createState() => _WorkerPickerSheetState();
}

class _WorkerPickerSheetState extends State<WorkerPickerSheet> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = widget.workers.where((w) {
      if (_query.isEmpty) return true;
      final q = _query.toLowerCase();
      return w.fullName.toLowerCase().contains(q) || w.phoneNumber.contains(q);
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: LabourColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Worker',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: LabourColors.primaryText,
              ),
            ),
            const SizedBox(height: 14),
            // Search Input
            Container(
              decoration: BoxDecoration(
                color: LabourColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: LabourColors.border),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (val) => setState(() => _query = val.trim()),
                decoration: const InputDecoration(
                  hintText: 'Search worker name or phone...',
                  hintStyle: TextStyle(fontSize: 13, color: LabourColors.mutedText),
                  prefixIcon: Icon(Icons.search, color: LabourColors.secondaryText, size: 20),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Text(
                        _query.isEmpty ? 'No workers available' : 'No workers match "$_query"',
                        style: const TextStyle(fontSize: 13, color: LabourColors.secondaryText),
                      ),
                    )
                  : ListView.separated(
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => const Divider(height: 1, color: LabourColors.borderLight),
                      itemBuilder: (ctx, index) {
                        final worker = filtered[index];
                        final isSelected = widget.selectedWorker?.id == worker.id;
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          leading: WorkerAvatar(worker: worker, size: 42),
                          title: Text(
                            worker.fullName,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                              color: LabourColors.primaryText,
                            ),
                          ),
                          subtitle: Text(
                            worker.phoneNumber,
                            style: const TextStyle(fontSize: 13, color: LabourColors.secondaryText),
                          ),
                          trailing: isSelected
                              ? const Icon(Icons.check_circle_rounded, color: LabourColors.forestGreen, size: 22)
                              : null,
                          onTap: () => widget.onSelected(worker),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Component 5: Filter Wage Logs Modal Bottom Sheet (Image Reference)
class FilterWageLogsSheet extends StatefulWidget {
  final DateTime selectedMonth;
  final List<Batch> batches;
  final String? selectedBatchId;
  final List<LabourWorker> workers;
  final String? selectedWorkerId;
  final String? selectedWorkType;
  final String selectedStatus; // 'All', 'Paid', 'Pending'
  final Function(DateTime month, String? batchId, String? workerId, String? workType, String status) onApply;

  const FilterWageLogsSheet({
    super.key,
    required this.selectedMonth,
    this.batches = const [],
    this.selectedBatchId,
    this.workers = const [],
    this.selectedWorkerId,
    this.selectedWorkType,
    this.selectedStatus = 'All',
    required this.onApply,
  });

  static Future<void> show(
    BuildContext context, {
    required DateTime initialMonth,
    List<Batch> batches = const [],
    String? currentBatchId,
    List<LabourWorker> workers = const [],
    String? currentWorkerId,
    String? currentWorkType,
    String currentStatus = 'All',
    required Function(DateTime month, String? batchId, String? workerId, String? workType, String status) onApply,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: LabourColors.cardSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => FilterWageLogsSheet(
        selectedMonth: initialMonth,
        batches: batches,
        selectedBatchId: currentBatchId,
        workers: workers,
        selectedWorkerId: currentWorkerId,
        selectedWorkType: currentWorkType,
        selectedStatus: currentStatus,
        onApply: onApply,
      ),
    );
  }

  @override
  State<FilterWageLogsSheet> createState() => _FilterWageLogsSheetState();
}

class _FilterWageLogsSheetState extends State<FilterWageLogsSheet> {
  late DateTime _month;
  String? _batchId;
  String? _workerId;
  String? _workType;
  late String _status;

  @override
  void initState() {
    super.initState();
    _month = widget.selectedMonth;
    _batchId = widget.selectedBatchId;
    _workerId = widget.selectedWorkerId;
    _workType = widget.selectedWorkType;
    _status = widget.selectedStatus;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: LabourColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter Wage Logs',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: LabourColors.primaryText,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded, size: 20, color: LabourColors.secondaryText),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // Month Label & Dropdown
            const Text(
              'Month',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: LabourColors.secondaryText,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: LabourColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: LabourColors.border),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: _month.month,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded, color: LabourColors.secondaryText),
                  items: List.generate(12, (i) {
                    final m = i + 1;
                    final date = DateTime(_month.year, m);
                    return DropdownMenuItem(
                      value: m,
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today_outlined, size: 16, color: LabourColors.forestGreen),
                          const SizedBox(width: 10),
                          Text(
                            DateFormat('MMMM yyyy').format(date),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: LabourColors.primaryText,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  onChanged: (newMonth) {
                    if (newMonth != null) {
                      setState(() => _month = DateTime(_month.year, newMonth));
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Batch Label & Dropdown
            const Text(
              'Batch',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: LabourColors.secondaryText,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: LabourColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: LabourColors.border),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String?>(
                  value: _batchId,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded, color: LabourColors.secondaryText),
                  items: [
                    const DropdownMenuItem(
                      value: null,
                      child: Row(
                        children: [
                          Icon(Icons.groups_outlined, size: 18, color: LabourColors.secondaryText),
                          SizedBox(width: 10),
                          Text('All Batches', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: LabourColors.primaryText)),
                        ],
                      ),
                    ),
                    ...widget.batches.map(
                      (b) => DropdownMenuItem(
                        value: b.id,
                        child: Row(
                          children: [
                            const Icon(Icons.layers_outlined, size: 18, color: LabourColors.forestGreen),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                b.batchName,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: LabourColors.primaryText),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  onChanged: (newBatch) => setState(() => _batchId = newBatch),
                ),
              ),
            ),

            // Optional Worker row if workers provided
            if (widget.workers.isNotEmpty) ...[
              const SizedBox(height: 14),
              const Text(
                'Worker',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: LabourColors.secondaryText,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                decoration: BoxDecoration(
                  color: LabourColors.background,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: LabourColors.border),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String?>(
                    value: _workerId,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded, color: LabourColors.secondaryText),
                    items: [
                      const DropdownMenuItem(
                        value: null,
                        child: Text('All Workers', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                      ...widget.workers.map(
                        (w) => DropdownMenuItem(
                          value: w.id,
                          child: Text(w.fullName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                    onChanged: (newId) => setState(() => _workerId = newId),
                  ),
                ),
              ),
            ],

            const SizedBox(height: 24),
            // Action Buttons: Reset & Apply
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _month = DateTime.now();
                        _batchId = null;
                        _workerId = null;
                        _workType = null;
                        _status = 'All';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: LabourColors.border),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Reset', style: TextStyle(color: LabourColors.secondaryText, fontWeight: FontWeight.w700, fontSize: 14)),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onApply(_month, _batchId, _workerId, _workType, _status);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LabourColors.forestGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    child: const Text('Apply', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Component 10: Delete Worker Confirmation Dialog
class DeleteWorkerDialog extends StatelessWidget {
  final String workerName;
  final VoidCallback onConfirm;

  const DeleteWorkerDialog({
    super.key,
    required this.workerName,
    required this.onConfirm,
  });

  static Future<bool?> show(BuildContext context, {required String workerName, required VoidCallback onConfirm}) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => DeleteWorkerDialog(workerName: workerName, onConfirm: onConfirm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: LabourColors.cardSurface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: LabourColors.softRedSurface,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.delete_outline_rounded, color: LabourColors.error, size: 28),
            ),
            const SizedBox(height: 18),
            const Text(
              'Delete Worker?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: LabourColors.primaryText,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'This will remove the worker from your list.\nWage logs will still be kept.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: LabourColors.secondaryText,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: LabourColors.border),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Cancel', style: TextStyle(color: LabourColors.secondaryText, fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                      onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LabourColors.forestGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    child: const Text('Delete', style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Component 11: Feedback Messages (Custom Toast / Banner)
void showLabourSuccessFeedback(BuildContext context, {required String title, required String subtitle}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
      duration: const Duration(seconds: 3),
      content: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: LabourColors.cardSurface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: LabourColors.forestGreen.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: LabourColors.softGreenSurface,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_rounded, color: LabourColors.forestGreen, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: LabourColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: LabourColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded, size: 18, color: LabourColors.secondaryText),
              onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    ),
  );
}

void showLabourErrorFeedback(BuildContext context, {required String title, required String subtitle}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
      duration: const Duration(seconds: 4),
      content: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFFEF2F2),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: LabourColors.error.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: LabourColors.softRedSurface,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close_rounded, color: LabourColors.error, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: LabourColors.error,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: LabourColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded, size: 18, color: LabourColors.secondaryText),
              onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    ),
  );
}

/// Component 4: Modal Action Sheet when tapping a Wage Log item (Wage Log Options)
Future<void> showWageLogActionSheet({
  required BuildContext context,
  required String taskTitle,
  required String workerName,
  LabourWorker? worker,
  String? shiftName,
  required String formattedDate,
  required double amount,
  required String status,
  VoidCallback? onEdit,
  VoidCallback? onMarkPaid,
  VoidCallback? onMarkPending,
  required VoidCallback onToggleStatus,
  required VoidCallback onDelete,
}) {
  final isPaid = status.toLowerCase() == 'paid';
  final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');
  final displayShift = shiftName ?? 'Day Shift';

  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: LabourColors.cardSurface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (ctx) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: LabourColors.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Wage Log Options',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: LabourColors.primaryText,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded, size: 20, color: LabourColors.secondaryText),
                    onPressed: () => Navigator.pop(ctx),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Header Summary Card (Worker Avatar, Name, Task, Date & Shift)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: LabourColors.background,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: LabourColors.border),
                ),
                child: Row(
                  children: [
                    WorkerAvatar(worker: worker, name: workerName, size: 46),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            workerName,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: LabourColors.primaryText,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            taskTitle,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: LabourColors.secondaryText,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '$formattedDate • $displayShift',
                            style: const TextStyle(
                              fontSize: 11,
                              color: LabourColors.secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          currency.format(amount),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: LabourColors.primaryText,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: isPaid ? LabourColors.softGreenSurface : LabourColors.softAmberSurface,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: isPaid ? LabourColors.forestGreen : const Color(0xFFD97706),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // CONTEXTUAL ACTIONS:
              // Action 1: Edit Wage Log (neutral/dark text with an edit icon)
              InkWell(
                onTap: () {
                  Navigator.pop(ctx);
                  onEdit?.call();
                },
                borderRadius: BorderRadius.circular(10),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Row(
                    children: [
                      Icon(Icons.edit_outlined, size: 20, color: LabourColors.primaryText),
                      SizedBox(width: 14),
                      Text(
                        'Edit Wage Log',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: LabourColors.primaryText),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1, color: LabourColors.borderLight),

              // Contextual Action 2: If Pending -> Mark as Paid (forest-green text and confirmation icon)
              if (!isPaid) ...[
                InkWell(
                  onTap: () async {
                    Navigator.pop(ctx);
                    final confirmed = await ConfirmMarkPaidDialog.show(
                      context,
                      workerName: workerName,
                      amount: amount,
                      formattedDate: formattedDate,
                      shiftName: displayShift,
                      onConfirm: () {},
                    );
                    if (confirmed == true) {
                      if (onMarkPaid != null) {
                        onMarkPaid();
                      } else {
                        onToggleStatus();
                      }
                    }
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle_outline_rounded, size: 20, color: LabourColors.forestGreen),
                        SizedBox(width: 14),
                        Text(
                          'Mark as Paid',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: LabourColors.forestGreen),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1, color: LabourColors.borderLight),
              ],

              // Contextual Action 3: If Paid -> Mark as Pending (amber/orange text with a clock icon)
              if (isPaid) ...[
                InkWell(
                  onTap: () async {
                    Navigator.pop(ctx);
                    final confirmed = await ConfirmMarkPendingDialog.show(
                      context,
                      workerName: workerName,
                      amount: amount,
                      formattedDate: formattedDate,
                      shiftName: displayShift,
                      onConfirm: () {},
                    );
                    if (confirmed == true) {
                      if (onMarkPending != null) {
                        onMarkPending();
                      } else {
                        onToggleStatus();
                      }
                    }
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: Row(
                      children: [
                        Icon(Icons.access_time_rounded, size: 20, color: Color(0xFFD97706)),
                        SizedBox(width: 14),
                        Text(
                          'Mark as Pending',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFFD97706)),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1, color: LabourColors.borderLight),
              ],

              // Action 4: Delete Wage Log (red text and delete icon)
              InkWell(
                onTap: () {
                  Navigator.pop(ctx);
                  onDelete();
                },
                borderRadius: BorderRadius.circular(10),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline_rounded, size: 20, color: LabourColors.error),
                      SizedBox(width: 14),
                      Text(
                        'Delete Wage Log',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: LabourColors.error),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Bottom Full-Width Cancel button (dismisses the sheet)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(ctx),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: const BorderSide(color: LabourColors.border),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: LabourColors.secondaryText),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// Confirmation Dialog when marking a Wage Log as Paid
class ConfirmMarkPaidDialog extends StatelessWidget {
  final String workerName;
  final double amount;
  final String formattedDate;
  final String shiftName;
  final VoidCallback onConfirm;

  const ConfirmMarkPaidDialog({
    super.key,
    required this.workerName,
    required this.amount,
    required this.formattedDate,
    required this.shiftName,
    required this.onConfirm,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String workerName,
    required double amount,
    required String formattedDate,
    required String shiftName,
    required VoidCallback onConfirm,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => ConfirmMarkPaidDialog(
        workerName: workerName,
        amount: amount,
        formattedDate: formattedDate,
        shiftName: shiftName,
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: LabourColors.cardSurface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: LabourColors.softGreenSurface,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.check_circle_rounded, color: LabourColors.forestGreen, size: 32),
            ),
            const SizedBox(height: 16),
            const Text(
              'Mark as Paid?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: LabourColors.primaryText,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'This will mark the wage as paid.',
              style: TextStyle(
                fontSize: 13,
                color: LabourColors.secondaryText,
              ),
            ),
            const SizedBox(height: 18),

            // Information Card
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: LabourColors.background,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: LabourColors.border),
              ),
              child: Column(
                children: [
                  _buildDialogRow('Worker', workerName),
                  const Divider(height: 16, color: LabourColors.borderLight),
                  _buildDialogRow('Amount', currency.format(amount), isBold: true),
                  const Divider(height: 16, color: LabourColors.borderLight),
                  _buildDialogRow('Work Date', formattedDate),
                  const Divider(height: 16, color: LabourColors.borderLight),
                  _buildDialogRow('Shift', shiftName),
                ],
              ),
            ),
            const SizedBox(height: 22),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      side: const BorderSide(color: LabourColors.border),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Cancel', style: TextStyle(color: LabourColors.secondaryText, fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                      onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LabourColors.forestGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    child: const Text('Mark as Paid', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: LabourColors.secondaryText),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isBold ? FontWeight.w800 : FontWeight.w600,
            color: LabourColors.primaryText,
          ),
        ),
      ],
    );
  }
}

/// Confirmation Dialog when reverting a Wage Log to Pending
class ConfirmMarkPendingDialog extends StatelessWidget {
  final String workerName;
  final double amount;
  final String formattedDate;
  final String shiftName;
  final VoidCallback onConfirm;

  const ConfirmMarkPendingDialog({
    super.key,
    required this.workerName,
    required this.amount,
    required this.formattedDate,
    required this.shiftName,
    required this.onConfirm,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String workerName,
    required double amount,
    required String formattedDate,
    required String shiftName,
    required VoidCallback onConfirm,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => ConfirmMarkPendingDialog(
        workerName: workerName,
        amount: amount,
        formattedDate: formattedDate,
        shiftName: shiftName,
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: LabourColors.cardSurface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: LabourColors.softAmberSurface,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.access_time_rounded, color: Color(0xFFD97706), size: 30),
            ),
            const SizedBox(height: 16),
            const Text(
              'Mark as Pending?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: LabourColors.primaryText,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'This will revert the payment to pending dues.',
              style: TextStyle(
                fontSize: 13,
                color: LabourColors.secondaryText,
              ),
            ),
            const SizedBox(height: 18),

            // Information Card
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: LabourColors.background,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: LabourColors.border),
              ),
              child: Column(
                children: [
                  _buildDialogRow('Worker', workerName),
                  const Divider(height: 16, color: LabourColors.borderLight),
                  _buildDialogRow('Amount', currency.format(amount), isBold: true),
                  const Divider(height: 16, color: LabourColors.borderLight),
                  _buildDialogRow('Work Date', formattedDate),
                  const Divider(height: 16, color: LabourColors.borderLight),
                  _buildDialogRow('Shift', shiftName),
                ],
              ),
            ),
            const SizedBox(height: 22),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      side: const BorderSide(color: LabourColors.border),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Cancel', style: TextStyle(color: LabourColors.secondaryText, fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                      onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD97706),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    child: const Text('Mark as Pending', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: LabourColors.secondaryText),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isBold ? FontWeight.w800 : FontWeight.w600,
            color: LabourColors.primaryText,
          ),
        ),
      ],
    );
  }
}

/// Delete Wage Log Confirmation Dialog
class DeleteWageLogDialog extends StatelessWidget {
  final String taskTitle;
  final String workerName;
  final String? formattedDate;
  final String? shiftName;
  final double amount;
  final VoidCallback onConfirm;

  const DeleteWageLogDialog({
    super.key,
    required this.taskTitle,
    required this.workerName,
    this.formattedDate,
    this.shiftName,
    required this.amount,
    required this.onConfirm,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String taskTitle,
    required String workerName,
    String? formattedDate,
    String? shiftName,
    required double amount,
    required VoidCallback onConfirm,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => DeleteWageLogDialog(
        taskTitle: taskTitle,
        workerName: workerName,
        formattedDate: formattedDate,
        shiftName: shiftName,
        amount: amount,
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: LabourColors.cardSurface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: LabourColors.softRedSurface,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.delete_outline_rounded, color: LabourColors.error, size: 30),
            ),
            const SizedBox(height: 16),
            const Text(
              'Delete Wage Log?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: LabourColors.primaryText,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'This will permanently delete this wage log.\nThis action cannot be undone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: LabourColors.secondaryText,
              ),
            ),
            const SizedBox(height: 18),

            // Information Card
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: LabourColors.background,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: LabourColors.border),
              ),
              child: Column(
                children: [
                  _buildDialogRow('Worker', workerName),
                  const Divider(height: 16, color: LabourColors.borderLight),
                  _buildDialogRow('Work Type', taskTitle),
                  if (formattedDate != null) ...[
                    const Divider(height: 16, color: LabourColors.borderLight),
                    _buildDialogRow('Work Date', formattedDate!),
                  ],
                  if (shiftName != null) ...[
                    const Divider(height: 16, color: LabourColors.borderLight),
                    _buildDialogRow('Shift', shiftName!),
                  ],
                  const Divider(height: 16, color: LabourColors.borderLight),
                  _buildDialogRow('Amount', currency.format(amount), isBold: true),
                ],
              ),
            ),
            const SizedBox(height: 22),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      side: const BorderSide(color: LabourColors.border),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Cancel', style: TextStyle(color: LabourColors.secondaryText, fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                      onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LabourColors.error,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    child: const Text('Delete', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: LabourColors.secondaryText),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isBold ? FontWeight.w800 : FontWeight.w600,
            color: LabourColors.primaryText,
          ),
        ),
      ],
    );
  }
}
