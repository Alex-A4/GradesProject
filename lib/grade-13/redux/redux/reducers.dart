import 'package:grades_app/grade-13/redux/redux/actions.dart';
import 'package:grades_app/grade-13/redux/redux/counter.dart';

/// Редусер, который позволяет обработать синхронные действия
Counter counterReducers(Counter counter, dynamic action) {
  if (action is CounterAddAction) {
    return Counter(counter.value + 1);
  } else if (action is CounterLoadingAction) {
    return Counter(counter.value, true);
  }

  return counter;
}
