import 'package:flutter/material.dart';
import 'package:grades_app/main.dart';

/// Экран, позволяющий открыть под-экраны для просмотра нативного рендеринга в
/// двух режимах.
@immutable
class NativeWidgetScreen extends StatelessWidget {
  const NativeWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Нативный рендеринг')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(kNativeHybrid),
              child: Text('Гибридный режим'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(kNativeVirtual),
              child: Text('Виртуальный дисплей'),
            ),
          ],
        ),
      ),
    );
  }
}
