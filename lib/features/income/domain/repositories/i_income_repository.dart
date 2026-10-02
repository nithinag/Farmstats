import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/income_entities.dart';

abstract class IIncomeRepository {
  Future<Either<Failure, List<Income>>> getIncomes();
  Future<Either<Failure, Income>> getIncomeById(String id);
  Future<Either<Failure, Unit>> addIncome(Income income);
  Future<Either<Failure, Unit>> updateIncome(Income income);
  Future<Either<Failure, Unit>> deleteIncome(String id);
  Future<Either<Failure, List<Income>>> searchIncomes(String query);
  Future<Either<Failure, List<Income>>> filterIncomes(IncomeFilter filter);
}
