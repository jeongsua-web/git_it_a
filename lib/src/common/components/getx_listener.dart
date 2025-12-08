import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef ListenerCallback<T> = void Function(T previousValue, T currentValue);

class GetxListener<T extends GetxController> extends StatefulWidget {
  final T controller;
  final Rx<dynamic> observable;
  final ListenerCallback<dynamic> listener;
  final Widget child;

  const GetxListener({
    super.key,
    required this.controller,
    required this.observable,
    required this.listener,
    required this.child,
  });

  @override
  State<GetxListener<T>> createState() => _GetxListenerState<T>();
}

class _GetxListenerState<T extends GetxController>
    extends State<GetxListener<T>> {
  late dynamic _previousValue;

  @override
  void initState() {
    super.initState();
    _previousValue = widget.observable.value;
    
    // 옵저버블 변경 감지
    widget.observable.listen((newValue) {
      widget.listener(_previousValue, newValue);
      _previousValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
