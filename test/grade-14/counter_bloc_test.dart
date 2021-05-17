import 'package:flutter_test/flutter_test.dart';
import 'package:grades_app/grade-14/bloc/bloc/counter_bloc.dart';

void main() {
  late CounterBloc bloc;
  setUp(() {
    bloc = CounterBloc();
  });

  group('CounterBasicEvent', () {
    test('Должен корректно добавить значение к счетчику', () async {
      // arrange

      // act
      bloc.add(CounterBasicEvent());

      // assert
      await expectLater(
        bloc.stream,
        emitsInOrder([CounterValueState(1)]),
      );
      expect(bloc.currentValue, 1);
    });

    test(
      'Должен корректно добавить значение к счетчику и показать сообщение',
      () async {
        // arrange
        bloc.currentValue = 4;

        // act
        bloc.add(CounterBasicEvent());

        // assert
        await expectLater(
          bloc.stream,
          emitsInOrder([CounterValueState(5, CounterBloc.fiveValue)]),
        );
        expect(bloc.currentValue, 5);
      },
    );
  });

  group('CounterAsyncEvent', () {
    test('Должен корректно добавить значение к счетчику', () async {
      // arrange

      // act
      bloc.add(CounterAsyncEvent());

      // assert
      await expectLater(
        bloc.stream,
        emitsInOrder([CounterLoadingState(), CounterValueState(1)]),
      );
      expect(bloc.currentValue, 1);
    });

    test(
      'Должен корректно добавить значение к счетчику и показать сообщение',
      () async {
        // arrange
        bloc.currentValue = 4;

        // act
        bloc.add(CounterAsyncEvent());

        // assert
        await expectLater(
          bloc.stream,
          emitsInOrder([
            CounterLoadingState(),
            CounterValueState(5, CounterBloc.fiveValue),
          ]),
        );
        expect(bloc.currentValue, 5);
      },
    );
  });
}
