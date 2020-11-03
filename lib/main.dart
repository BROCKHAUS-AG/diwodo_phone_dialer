import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:live_coding/app.dart';
import 'package:live_coding/dialer/dialer_observer.dart';

void main() {
  Bloc.observer = new DialerObserver();
  runApp(App());
}
