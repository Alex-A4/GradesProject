part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

/// Событие, которое позволяет добавить значение к счетчику сразу
class CounterBasicEvent extends CounterEvent {
  @override
  List<Object?> get props => [];
}

/// Событие, которое позволяет добавить к счетчику значение после задержки
class CounterAsyncEvent extends CounterEvent {
  @override
  List<Object?> get props => [];
}
