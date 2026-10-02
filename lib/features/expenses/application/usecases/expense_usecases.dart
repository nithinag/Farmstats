import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/expense_entities.dart';
import '../../domain/repositories/i_expense_repository.dart';

class GetExpensesUseCase {
  final IExpenseRepository _repository;
  GetExpensesUseCase(this._repository);

  Future<Either<Failure, List<Expense>>> execute() {
    return _repository.getExpenses();
  }
}

class GetExpenseUseCase {
  final IExpenseRepository _repository;
  GetExpenseUseCase(this._repository);

  Future<Either<Failure, Expense>> execute(String id) {
    return _repository.getExpenseById(id);
  }
}

class AddExpenseUseCase {
  final IExpenseRepository _repository;
  AddExpenseUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(Expense expense) {
    return _repository.addExpense(expense);
  }
}

class UpdateExpenseUseCase {
  final IExpenseRepository _repository;
  UpdateExpenseUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(Expense expense) {
    return _repository.updateExpense(expense);
  }
}

class DeleteExpenseUseCase {
  final IExpenseRepository _repository;
  DeleteExpenseUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(String id) {
    return _repository.deleteExpense(id);
  }
}

class SearchExpensesUseCase {
  final IExpenseRepository _repository;
  SearchExpensesUseCase(this._repository);

  Future<Either<Failure, List<Expense>>> execute(String query) {
    return _repository.searchExpenses(query);
  }
}

class FilterExpensesUseCase {
  final IExpenseRepository _repository;
  FilterExpensesUseCase(this._repository);

  Future<Either<Failure, List<Expense>>> execute(ExpenseFilter filter) {
    return _repository.filterExpenses(filter);
  }
}
