import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/expense_entities.dart';

abstract class IExpenseRepository {
  Future<Either<Failure, List<Expense>>> getExpenses();
  Future<Either<Failure, Expense>> getExpenseById(String id);
  Future<Either<Failure, Unit>> addExpense(Expense expense);
  Future<Either<Failure, Unit>> updateExpense(Expense expense);
  Future<Either<Failure, Unit>> deleteExpense(String id);
  Future<Either<Failure, List<Expense>>> searchExpenses(String query);
  Future<Either<Failure, List<Expense>>> filterExpenses(ExpenseFilter filter);
}
