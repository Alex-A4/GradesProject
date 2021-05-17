import 'package:flutter/material.dart';
import 'package:grades_app/grade-14/bloc/ui/counter_screen.dart';

const kRoot = '/';
const kBlocPath = '/bloc';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: kRoot,
    routes: {
      kRoot: (_) => GradesRoot(),
      kBlocPath: (_) => CounterScreen(),
    },
  ));
}

/// Корневой виджет, с помощью которого можно перейти на экраны с заданиями
/// разных грейдов.
class GradesRoot extends StatelessWidget {
  const GradesRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Выберите грейд')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(kBlocPath),
              child: Text('Счетчик на блоке, 14 грейд'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Нативный виджет, 14 грейд'),
            ),
          ],
        ),
      ),
    );
  }
}
