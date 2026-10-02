import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/income_entities.dart';
import '../../domain/repositories/i_income_repository.dart';
import '../datasources/i_income_datasource.dart';
import '../mappers/income_mapper.dart';

class IncomeRepositoryImpl implements IIncomeRepository {
  final IIncomeDataSource _dataSource;

  IncomeRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<Income>>> getIncomes() async {
    try {
      final models = await _dataSource.getIncomes();
      final entities = models.map(IncomeMapper.fromModel).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure('Failed to load incomes: $e'));
    }
  }

  @override
  Future<Either<Failure, Income>> getIncomeById(String id) async {
    try {
      final model = await _dataSource.getIncomeById(id);
      if (model != null) {
        return Right(IncomeMapper.fromModel(model));
      }
      return const Left(Failure('Income not found'));
    } catch (e) {
      return Left(Failure('Failed to load income: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> addIncome(Income income) async {
    try {
      final model = IncomeMapper.toModel(income);
      await _dataSource.addIncome(model);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to add income: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateIncome(Income income) async {
    try {
      final model = IncomeMapper.toModel(income);
      await _dataSource.updateIncome(model);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to update income: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteIncome(String id) async {
    try {
      await _dataSource.deleteIncome(id);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to delete income: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Income>>> searchIncomes(String query) async {
    try {
      final models = await _dataSource.getIncomes();
      final filtered = models.where((e) {
        return e.buyer.name.toLowerCase().contains(query.toLowerCase()) ||
               e.category.name.toLowerCase().contains(query.toLowerCase()) ||
               (e.batchId?.toLowerCase().contains(query.toLowerCase()) ?? false);
      }).toList();
      return Right(filtered.map(IncomeMapper.fromModel).toList());
    } catch (e) {
      return Left(Failure('Failed to search incomes: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Income>>> filterIncomes(IncomeFilter filter) async {
    try {
      final models = await _dataSource.getIncomes();
      final entities = models.map(IncomeMapper.fromModel).toList();
      
      final filtered = entities.where((e) {
        if (filter.startDate != null && e.saleDate.isBefore(filter.startDate!)) return false;
        if (filter.endDate != null && e.saleDate.isAfter(filter.endDate!)) return false;
        if (filter.buyerIds != null && filter.buyerIds!.isNotEmpty && !filter.buyerIds!.contains(e.buyer.id)) return false;
        if (filter.batchId != null && e.batchId != filter.batchId) return false;
        if (filter.paymentStatus != null && e.paymentStatus != filter.paymentStatus) return false;
        if (filter.minAmount != null && e.netAmount < filter.minAmount!) return false;
        if (filter.maxAmount != null && e.netAmount > filter.maxAmount!) return false;
        return true;
      }).toList();

      return Right(filtered);
    } catch (e) {
      return Left(Failure('Failed to filter incomes: $e'));
    }
  }
}
