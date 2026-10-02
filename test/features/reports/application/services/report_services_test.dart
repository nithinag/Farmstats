import 'package:flutter_test/flutter_test.dart';
import 'package:farmstats/features/reports/application/services/report_services.dart';
import 'package:farmstats/features/reports/domain/entities/report_entities.dart';

void main() {
  group('DateRangeService Tests', () {
    test('getDateRangeForFilter - daily', () {
      final (start, end) = DateRangeService.getDateRangeForFilter(TimeFilter.daily);
      final now = DateTime.now();
      
      expect(start.year, now.year);
      expect(start.month, now.month);
      expect(start.day, now.day);
      expect(start.hour, 0);
      
      expect(end.day, now.day);
      expect(end.hour, 23);
      expect(end.minute, 59);
    });

    test('getDateRangeForFilter - custom', () {
      final customStart = DateTime(2023, 1, 1);
      final customEnd = DateTime(2023, 12, 31);
      final (start, end) = DateRangeService.getDateRangeForFilter(
        TimeFilter.custom, 
        customStart: customStart, 
        customEnd: customEnd
      );
      
      expect(start, customStart);
      expect(end, customEnd);
    });
  });
}
