import '../../../../core/usecases/usecase.dart';
import '../../data/repositories/i_date_repository.dart';
import '../entities/now_date_entity.dart';

class GetNowDateUseCase implements UseCase<NoParams, NowDate> {
  final IDateRepository iDateRepository;

  GetNowDateUseCase(this.iDateRepository);
  @override
  NowDate call(NoParams params) {
    return iDateRepository.getNowDate();
  }
}
