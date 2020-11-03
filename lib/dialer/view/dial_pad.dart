import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/dialer/cubit/dialer_cubit.dart';

class DialPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DialerCubit, String>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    onPressed: () => context.bloc<DialerCubit>().addOne(),
                    child: Text('1')),
                RaisedButton(
                    onPressed: () => context.bloc<DialerCubit>().addTwo(),
                    child: Text('2')),
                RaisedButton(
                    onPressed: () => context.bloc<DialerCubit>().addThree(),
                    child: Text('3')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    onPressed: () => context.bloc<DialerCubit>().addFour(),
                    child: Text('4')),
                RaisedButton(
                    onPressed: () => context.bloc<DialerCubit>().addFive(),
                    child: Text('5')),
                RaisedButton(
                    onPressed: () => context.bloc<DialerCubit>().addSix(),
                    child: Text('6')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    onPressed: () => context.bloc<DialerCubit>().addSeven(),
                    child: Text('7')),
                RaisedButton(
                    onPressed: () => context.bloc<DialerCubit>().addEight(),
                    child: Text('8')),
                RaisedButton(
                    onPressed: () => context.bloc<DialerCubit>().addNine(),
                    child: Text('9')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    onPressed: () => context.bloc<DialerCubit>().addPlus(),
                    child: Text('+')),
                RaisedButton(
                    onPressed: () => context.bloc<DialerCubit>().addZero(),
                    child: Text('0')),
                RaisedButton(
                    onPressed: () => context.bloc<DialerCubit>().addHashtag(),
                    child: Text('#')),
              ],
            ),
          ],
        );
      },
    );
  }
}
