part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

/// Состояние, отображающее значение счетчика.
/// Если значение будет кратно 5, то будет передано еще и сообщение
class CounterValueState extends CounterState {
  final int value;
  final String? message;

  CounterValueState(this.value, [this.message]);

  @override
  List<Object?> get props => [value, message];
}

/// Состояние, показывающее процесс загрузки счетчика
class CounterLoadingState extends CounterState {
  @override
  List<Object?> get props => [];
}
