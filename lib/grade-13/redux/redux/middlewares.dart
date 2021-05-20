import 'package:grades_app/grade-13/redux/redux/actions.dart';
import 'package:grades_app/grade-13/redux/redux/counter.dart';
import 'package:redux/redux.dart';

/// Мидлварь, которая позволяет обработать действие с задержкой
void counterMiddleware(
  Store<Counter> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is CounterDelayedAddAction) {
    store.dispatch(CounterLoadingAction());
    Future.delayed(Duration(seconds: 1), () {
      store.dispatch(CounterAddAction());
    });
  }
  next(action);
}
