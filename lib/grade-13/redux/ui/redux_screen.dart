import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:grades_app/grade-13/redux/redux/actions.dart';
import 'package:grades_app/grade-13/redux/redux/middlewares.dart';
import 'package:grades_app/grade-13/redux/redux/reducers.dart';
import 'package:redux/redux.dart';
import 'package:grades_app/grade-13/redux/redux/counter.dart';

/// Экран, демонстрирующий пример использования redux'a
@immutable
class ReduxScreen extends StatefulWidget {
  const ReduxScreen({Key? key}) : super(key: key);

  @override
  State<ReduxScreen> createState() => _ReduxScreenState();
}

class _ReduxScreenState extends State<ReduxScreen> {
  final store = Store<Counter>(
    counterReducers,
    initialState: Counter(0),
    middleware: [counterMiddleware],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Пример Redux'a")),
      body: StoreProvider<Counter>(
        store: store,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Builder(
                  builder: (context) {
                    return StoreConnector<Counter, Counter>(
                      converter: (store) {
                        final value = store.state.value;
                        if (value % 5 == 0 && value != 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Число кратно 5')),
                          );
                        }
                        return store.state;
                      },
                      builder: (context, state) {
                        if (state.isLoading) {
                          return CircularProgressIndicator();
                        }
                        return Text('Счетчик равен: ${state.value}');
                      },
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => store.dispatch(CounterDelayedAddAction()),
                    child: Text('Добавить с задержкой'),
                  ),
                  ElevatedButton(
                    onPressed: () => store.dispatch(CounterAddAction()),
                    child: Text('Добавить без задержки'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
