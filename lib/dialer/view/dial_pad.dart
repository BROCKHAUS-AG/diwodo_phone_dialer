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
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addOne(),
                    child: Text('1')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addTwo(),
                    child: Text('2')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addThree(),
                    child: Text('3')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addFour(),
                    child: Text('4')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addFive(),
                    child: Text('5')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addSix(),
                    child: Text('6')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addSeven(),
                    child: Text('7')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addEight(),
                    child: Text('8')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addNine(),
                    child: Text('9')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addPlus(),
                    child: Text('+')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addZero(),
                    child: Text('0')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addHashtag(),
                    child: Text('#')),
              ],
            ),
          ],
        );
      },
    );
  }
}
