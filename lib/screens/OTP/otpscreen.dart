import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/ui_helper.dart';

class OtpScreen extends StatelessWidget {
  String phoneNumber;
  OtpScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: UiHelper.CustomeText(
          text: 'Verifying your number',
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
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'You’ve tried to register +91 $phoneNumber \n ',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const TextSpan(
                    text:
                        'recently. Wait before requesting an sms or a call. \n',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const TextSpan(
                    text: 'with your code.',
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.black,
                    ),
                  ),
                  const TextSpan(
                    text: 'Wrong number?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF00A884),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
