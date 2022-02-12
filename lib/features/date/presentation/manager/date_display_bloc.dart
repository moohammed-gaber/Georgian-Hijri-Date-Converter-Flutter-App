import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_date/features/date/domain/entities/now_date_entity.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/use_cases/get_now_date_use_case.dart';

part 'date_display_event.dart';

part 'date_display_state.dart';

class DateDisplayBloc extends Bloc<DateDisplayEvent, DateDisplayState> {
  final GetNowDateUseCase getNowDateUseCase;

  DateDisplayBloc({this.getNowDateUseCase}) : super(DateDisplayInitial()) {
    on<DateDisplayEvent>((event, emit) {
      final nowDate = getNowDateUseCase.call(NoParams());
      emit(DateDisplayLoadSuccess(nowDate));
    });
  }
}
