import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';

part 'counter_state.dart';

/// Блок для типичного счетчика, у которого имеется два события.
/// 1) Событие для выполнения c задержкой
/// 2) Событие для моментального выполнения
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  static const fiveValue = 'Число кратно 5';

  CounterBloc() : super(CounterValueState(0));

  int currentValue = 0;

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is CounterBasicEvent) {
      currentValue++;
      yield dataState;
    }

    if (event is CounterAsyncEvent) {
      yield CounterLoadingState();
      await Future.delayed(Duration(seconds: 1));
      currentValue++;
      yield dataState;
    }
  }

  CounterValueState get dataState => CounterValueState(
        currentValue,
        currentValue % 5 == 0 && currentValue != 0 ? fiveValue : null,
      );
}
