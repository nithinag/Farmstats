import 'package:flutter_test/flutter_test.dart';
import 'package:farmstats/features/settings/domain/entities/settings_entities.dart';
import 'package:farmstats/features/settings/data/models/settings_models.dart';
import 'package:farmstats/features/settings/data/mappers/settings_mapper.dart';

void main() {
  group('Profile Photo & Farm Configuration Persistence Tests', () {
    test('FarmProfile entity includes photoPath and farmType with safe defaults', () {
      const profile = FarmProfile();
      expect(profile.photoPath, isEmpty);
      expect(profile.farmType, equals('Sericulture'));
      expect(profile.email, isEmpty);
      expect(profile.gstNumber, isEmpty);
    });

    test('SettingsMapper correctly maps photoPath and farmType between Entity and Model', () {
      const entity = FarmProfile(
        farmName: 'Green Meadows',
        ownerName: 'Nithin Nagabushanam',
        address: 'Chittoor, AP',
        phone: '+919876543210',
        email: 'farmer@example.com',
        gstNumber: 'GSTIN12345678',
        farmArea: 3.5,
        numRearingHouses: 2,
        defaultMulberryVariety: 'V1',
        farmType: 'Sericulture',
        photoPath: '/data/user/0/com.farmstats/app_flutter/profile_photos/farmer.jpg',
      );

      final model = SettingsMapper.toProfileModel(entity);
      expect(model.farmName, equals('Green Meadows'));
      expect(model.farmType, equals('Sericulture'));
      expect(model.photoPath, equals('/data/user/0/com.farmstats/app_flutter/profile_photos/farmer.jpg'));
      expect(model.email, equals('farmer@example.com')); // Preserved
      expect(model.gstNumber, equals('GSTIN12345678')); // Preserved

      final mappedBack = SettingsMapper.fromProfileModel(model);
      expect(mappedBack.farmName, equals(entity.farmName));
      expect(mappedBack.farmType, equals(entity.farmType));
      expect(mappedBack.photoPath, equals(entity.photoPath));
      expect(mappedBack.email, equals(entity.email));
      expect(mappedBack.gstNumber, equals(entity.gstNumber));
    });

    test('FarmProfileModel JSON serialization handles backward compatibility', () {
      // JSON from an older version without farmType or photoPath
      final oldJson = {
        'farmName': 'Legacy Farm',
        'ownerName': 'Old Owner',
        'address': 'Kolar',
        'phone': '9876543210',
        'email': 'old@farm.in',
        'gstNumber': 'OLD123',
        'farmArea': 2.0,
        'numRearingHouses': 1,
        'defaultMulberryVariety': 'S36',
      };

      final model = FarmProfileModel.fromJson(oldJson);
      expect(model.farmName, equals('Legacy Farm'));
      expect(model.farmType, equals('Sericulture')); // Safe default
      expect(model.photoPath, equals('')); // Safe default

      final json = model.toJson();
      expect(json['farmType'], equals('Sericulture'));
      expect(json['photoPath'], equals(''));
    });

    test('Profile updates preserve existing email and GST data when omitted in UI', () {
      const existing = FarmProfile(
        farmName: 'Original Farm',
        ownerName: 'Owner',
        email: 'saved@legacy.com',
        gstNumber: 'GST999',
        phone: '9999999999',
      );

      // Simulating edit profile save without modifying email and GST
      final updated = existing.copyWith(
        farmName: 'Updated Farm Name',
        ownerName: 'Updated Owner Name',
        photoPath: '/new/path/to/profile.jpg',
      );

      expect(updated.farmName, equals('Updated Farm Name'));
      expect(updated.photoPath, equals('/new/path/to/profile.jpg'));
      expect(updated.email, equals('saved@legacy.com')); // Preserved
      expect(updated.gstNumber, equals('GST999')); // Preserved
    });
  });
}
