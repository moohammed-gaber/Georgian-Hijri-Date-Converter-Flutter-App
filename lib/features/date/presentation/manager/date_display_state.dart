part of 'date_display_bloc.dart';

abstract class DateDisplayState extends Equatable {
  const DateDisplayState();
}

class DateDisplayInitial extends DateDisplayState {
  @override
  List<Object> get props => [];
}

class DateDisplayLoadSuccess extends DateDisplayState {
  final NowDate nowDate;

  DateDisplayLoadSuccess(this.nowDate);

  @override
  List<Object> get props => [nowDate];
}
