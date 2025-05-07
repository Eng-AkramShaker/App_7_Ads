import 'package:app_7/presentation/screens/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_7/core/constants/ColorManager.dart';

class ContainerOtp extends StatefulWidget {
  const ContainerOtp({super.key});

  @override
  State<ContainerOtp> createState() => _ContainerOtpState();
}

class _ContainerOtpState extends State<ContainerOtp> {
  @override
  Widget build(BuildContext context) {
    final crlHome = Provider.of<Controller_Home>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _textFieldOTP(first: true, last: false),
              _textFieldOTP(first: false, last: false),
              _textFieldOTP(first: false, last: false),
              _textFieldOTP(first: false, last: false),
              _textFieldOTP(first: false, last: false),
              _textFieldOTP(first: false, last: true),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                //
                setState(() {
                  crlHome.verif_Id = '';
                });
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(ColorManager.b_69),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                  'Send',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _textFieldOTP({bool? first, last}) {
    return SizedBox(
      height: 55,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black12), borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: ColorManager.b_69), borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
