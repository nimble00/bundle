import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/controllers/authservice.dart';
import 'package:countdown/countdown.dart';

class PartnerLoginPage extends StatefulWidget {
  @override
  _PartnerLoginPageState createState() => _PartnerLoginPageState();
}

class _PartnerLoginPageState extends State<PartnerLoginPage> {
  final formKey = new GlobalKey<FormState>();
  String phoneNo, verificationId, smsCode;
  String otpWaitTimeLabel = "";
  bool _isResendEnable = false;
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            // newUser ?
            Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 25.0, right: 25.0),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.amber.shade500, width: 5.0),
//                                  color: Colors.greenAccent, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 5.0),
//                                  BorderSide(color: Colors.red, width: 5.0),
                            ),
                            border: OutlineInputBorder(),
                            hintText: 'Phone Number',
                            prefixIcon:
                                const Icon(Icons.phone, color: Colors.grey),
                            prefixText: ' ',
                          ),
                          onChanged: (val) {
                            if (mounted) {
                              setState(() {
                                this.phoneNo = '+91 ' + val;
                              });
                            }
                          },
                        )),
                    codeSent
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, bottom: 15.0),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration:
                                  InputDecoration(hintText: 'Enter OTP'),
                              onChanged: (val) {
                                if (mounted) {
                                  setState(() {
                                    this.smsCode = val;
                                  });
                                }
                              },
                            ))
                        : Container(
                            width: 0.0,
                            height: 0.0,
                          ),
                    codeSent
                        ? Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 3.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.timer,
                                        color: Colors.amber.shade500),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    otpWaitTimeLabel,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber.shade500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )

                        /*
                        Text(
                            otpWaitTimeLabel,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )*/
                        : Container(
                            width: 0.0,
                            height: 10.0,
                          ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, left: 125.0, right: 125.0),
                        child: RaisedButton(
                            elevation: 8.0,
                            child: Center(
                                child:
                                    codeSent ? Text('Login') : Text('Verify')),
                            color: Colors.amber.shade500,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              codeSent
                                  ? AuthService()
                                      .signInWithOTP(smsCode, verificationId)
                                  : verifyPhone(phoneNo);
                            })),
                    codeSent
                        ? Padding(
                            padding: EdgeInsets.only(left: 75.0, right: 75.0),
                            child: RaisedButton(
                                elevation: 8.0,
                                child: Center(
                                  child: Text('Resend OTP'),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {
                                  if (_isResendEnable) {
                                    verifyPhone(phoneNo);
                                  }
                                }))
                        : Container(
                            width: 0.0,
                            height: 0.0,
                          ),
                  ],
                ))
        // : ExistCheck(),
        );
  }

  Future<void> verifyPhone(phoneNo) async {
    startTimer();

    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
      // setState(() {
      //   this.otpMatched = true;
      // });
    };

    final PhoneVerificationFailed verificationfailed =
        (Exception authException) {
      print('${authException.toString()}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      if (mounted) {
        setState(() {
          this.codeSent = true;
        });
      }
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 30),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }

  void startTimer() {
    if (mounted) {
      setState(() {
        _isResendEnable = false;
      });
    }

    var sub = CountDown(Duration(seconds: 30)) // ignore: cancel_subscriptions
        .stream
        .listen(null);
    sub.onData((Duration d) {
      if (mounted) {
        setState(() {
          int sec = d.inSeconds % 60;
          otpWaitTimeLabel = d.inMinutes.toString() + ":" + sec.toString();
        });
      }
    });

    sub.onDone(() {
      if (mounted) {
        setState(() {
          _isResendEnable = true;
        });
      }
    });
  }
}
