import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

/// Отображение нативного виджета в режиме виртуального дисплея.
/// Могут быть проблемы с UX.
@immutable
class NativeWidgetVirtualDisplay extends StatelessWidget {
  final String viewType = 'native-widget';
  final Map<String, dynamic> creationParams = <String, dynamic>{
    'text': 'NativeView',
  };

  NativeWidgetVirtualDisplay({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Виртуальный дисплей')),
      body: Center(
        child: AndroidView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      ),
    );
  }
}
