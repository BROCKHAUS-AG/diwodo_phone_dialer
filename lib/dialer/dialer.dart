import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/dialer/cubit/dialer_cubit.dart';
import 'package:live_coding/dialer/view/view.dart';

class Dialer extends StatelessWidget {
  const Dialer(): super();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => DialerCubit(), child: DialerView(),);
  }
}
