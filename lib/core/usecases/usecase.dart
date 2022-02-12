import 'package:equatable/equatable.dart';

abstract class UseCase<Input, Output> {
  Output call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
