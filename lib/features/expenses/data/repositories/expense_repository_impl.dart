import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/expense_entities.dart';
import '../../domain/repositories/i_expense_repository.dart';
import '../datasources/expense_mock_datasource.dart';
import '../mappers/expense_mapper.dart';

class ExpenseRepositoryImpl implements IExpenseRepository {
  final IExpenseDataSource _dataSource;

  ExpenseRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<Expense>>> getExpenses() async {
    try {
      final models = await _dataSource.getExpenses();
      final entities = models.map(ExpenseMapper.fromModel).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure('Failed to load expenses: $e'));
    }
  }

  @override
  Future<Either<Failure, Expense>> getExpenseById(String id) async {
    try {
      final model = await _dataSource.getExpenseById(id);
      if (model != null) {
        return Right(ExpenseMapper.fromModel(model));
      }
      return const Left(Failure('Expense not found'));
    } catch (e) {
      return Left(Failure('Failed to load expense: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> addExpense(Expense expense) async {
    try {
      final model = ExpenseMapper.toModel(expense);
      await _dataSource.addExpense(model);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to add expense: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateExpense(Expense expense) async {
    try {
      final model = ExpenseMapper.toModel(expense);
      await _dataSource.updateExpense(model);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to update expense: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteExpense(String id) async {
    try {
      await _dataSource.deleteExpense(id);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to delete expense: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Expense>>> searchExpenses(String query) async {
    try {
      final models = await _dataSource.getExpenses();
      final filtered = models.where((e) {
        return e.description.toLowerCase().contains(query.toLowerCase()) ||
               e.category.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      return Right(filtered.map(ExpenseMapper.fromModel).toList());
    } catch (e) {
      return Left(Failure('Failed to search expenses: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Expense>>> filterExpenses(ExpenseFilter filter) async {
    try {
      final models = await _dataSource.getExpenses();
      final entities = models.map(ExpenseMapper.fromModel).toList();
      
      final filtered = entities.where((e) {
        if (filter.startDate != null && e.date.isBefore(filter.startDate!)) return false;
        if (filter.endDate != null && e.date.isAfter(filter.endDate!)) return false;
        if (filter.categoryIds != null && filter.categoryIds!.isNotEmpty && !filter.categoryIds!.contains(e.category.id)) return false;
        if (filter.batchId != null && e.batchId != filter.batchId) return false;
        if (filter.paymentMethod != null && e.paymentMethod != filter.paymentMethod) return false;
        if (filter.minAmount != null && e.amount < filter.minAmount!) return false;
        if (filter.maxAmount != null && e.amount > filter.maxAmount!) return false;
        return true;
      }).toList();

      return Right(filtered);
    } catch (e) {
      return Left(Failure('Failed to filter expenses: $e'));
    }
  }
}
