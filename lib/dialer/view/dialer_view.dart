import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:live_coding/dialer/cubit/dialer_cubit.dart';
import 'package:live_coding/dialer/view/view.dart';

class DialerView extends StatefulWidget {
  @override
  _DialerViewState createState() => _DialerViewState();
}

class _DialerViewState extends State<DialerView> {
  String _normalizedNumber;

  _normalizePhoneNumber(String number) async {
    if (await PhoneNumberUtil.isValidPhoneNumber(
        phoneNumber: number, isoCode: 'DE')) {
      await PhoneNumberUtil.normalizePhoneNumber(
              phoneNumber: number, isoCode: 'DE')
          .then((value) => {
                setState(() {
                  _normalizedNumber = value;
                })
              });
    } else {
      setState(() {
        _normalizedNumber = number;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('diwodo Phone Dialer'),
      ),
      body: Center(
        child: BlocBuilder<DialerCubit, String>(
          buildWhen: (prevState, state) {
            if (prevState != state) {
              _normalizePhoneNumber(state);
            }
            return prevState != state;
          },
          builder: (context, state) {
            _callNumber() async {
              if (await PhoneNumberUtil.isValidPhoneNumber(
                  phoneNumber: state, isoCode: 'DE')) {
                await FlutterPhoneDirectCaller.callNumber(state);
              } else {
                print('no valid number');
                final snackbar =
                    SnackBar(content: Text('Keine gültige Telefonnummer!'));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            }

            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          _normalizedNumber != null ? _normalizedNumber : '',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            context.bloc<DialerCubit>().deleteLastDigit(),
                        icon: Icon(Icons.backspace_rounded),
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                DialPad(),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: () => _callNumber(),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => OtherScreen())),
      ),
    );
  }
}
