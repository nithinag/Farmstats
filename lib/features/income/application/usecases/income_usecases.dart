import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/income_entities.dart';
import '../../domain/repositories/i_income_repository.dart';
import '../services/income_validation_service.dart';

class GetIncomesUseCase {
  final IIncomeRepository _repository;
  GetIncomesUseCase(this._repository);

  Future<Either<Failure, List<Income>>> execute() => _repository.getIncomes();
}

class AddIncomeUseCase {
  final IIncomeRepository _repository;
  AddIncomeUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(Income income) async {
    final errors = IncomeValidationService.validate(
      quantity: income.quantity,
      rate: income.rate,
      buyerId: income.buyer.id,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    return _repository.addIncome(income);
  }
}

class UpdateIncomeUseCase {
  final IIncomeRepository _repository;
  UpdateIncomeUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(Income income) async {
    final errors = IncomeValidationService.validate(
      quantity: income.quantity,
      rate: income.rate,
      buyerId: income.buyer.id,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    return _repository.updateIncome(income);
  }
}

class DeleteIncomeUseCase {
  final IIncomeRepository _repository;
  DeleteIncomeUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(String id) => _repository.deleteIncome(id);
}
