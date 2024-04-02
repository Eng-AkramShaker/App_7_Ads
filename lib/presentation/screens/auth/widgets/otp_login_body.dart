import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todotask/presentation/screens/home/screens/home_screen.dart';
import 'package:todotask/utils/controller/auth_service.dart';

class OtpLoginBody extends StatelessWidget {
  OtpLoginBody({super.key});
  final _formKey1 = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneContoller = TextEditingController();
  final TextEditingController _otpContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            AuthService.sentOtp(
                phone: _phoneContoller.text,
                errorStep: () =>
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "Error in sending OTP",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    )),
                nextStep: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text("OTP Verification"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Enter 6 digit OTP"),
                                const SizedBox(
                                  height: 12,
                                ),
                                Form(
                                  key: _formKey1,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _otpContoller,
                                    decoration: InputDecoration(
                                        labelText: "Enter you phone number",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(32))),
                                    validator: (value) {
                                      if (value!.length != 6) {
                                        return "Invalid OTP";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    if (_formKey1.currentState!.validate()) {
                                      AuthService.loginWithOtp(
                                              otp: _otpContoller.text)
                                          .then((value) {
                                        if (value == "Success") {
                                          Navigator.pop(context);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Home()));
                                        } else {
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                              value,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            backgroundColor: Colors.red,
                                          ));
                                        }
                                      });
                                    }
                                  },
                                  child: const Text("Submit"))
                            ],
                          ));
                });
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow, foregroundColor: Colors.black),
        child: const Text("Send OTP"),
      ),
    );
  }
}
