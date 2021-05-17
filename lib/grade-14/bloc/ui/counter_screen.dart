import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grades_app/grade-14/bloc/bloc/counter_bloc.dart';

/// Экран счетчика, который обновляется автоматически при изменении состояний
/// блока.
@immutable
class CounterScreen extends StatefulWidget {
  const CounterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final bloc = CounterBloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Счетчик')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: BlocConsumer<CounterBloc, CounterState>(
                bloc: bloc,
                listener: (context, state) {
                  if (state is CounterValueState && state.message != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message!)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CounterLoadingState) {
                    return CircularProgressIndicator();
                  }
                  state = state as CounterValueState;
                  return Text('Счетчик равен: ${state.value}');
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => bloc.add(CounterAsyncEvent()),
                  child: Text('Добавить с задержкой'),
                ),
                ElevatedButton(
                  onPressed: () => bloc.add(CounterBasicEvent()),
                  child: Text('Добавить без задержки'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
