import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/ui_helper.dart';
import '../OTP/otpscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedCountry = 'India';

  List<String> countries = [
    'India',
    'America',
    'Australia',
    'Russia',
    'Japan',
  ];

  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: UiHelper.CustomeText(
          text: 'Enter your phone number',
          height: 24,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF00A884),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'WhatsApp will need to verify your phone \n ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'number. Carrier charges may apply. \n',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: ' What’s my number?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF00A884),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: mq * 0.1),
            Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 60.0),
              child: DropdownButtonFormField(
                items: countries.map((String country) {
                  return DropdownMenuItem(
                    value: country,
                    child: Text(country.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value!;
                  });
                },
                value: selectedCountry,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF00A884),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF00A884),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: mq * 0.020),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: mq * 0.045,
                  child: const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '+91',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF00A884),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF00A884),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF00A884),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: mq * 0.010),
                SizedBox(
                  width: 246,
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF00A884),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF00A884),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: UiHelper.CustomButoon(
        callback: () {
          login(phoneController.text.toString());
        },
        buttonName: 'Next',
      ),
    );
  }

  login(String phoneNumber) {
    if (phoneNumber == "") {
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFF004511),
          content: Text('Enter Phone Number'),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OtpScreen(
            phoneNumber: phoneNumber,
          ),
        ),
      );
    }
  }
}
