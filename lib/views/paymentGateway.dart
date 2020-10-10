import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/paymentSuccess.dart';
import 'package:upi_pay/upi_pay.dart';
import 'package:toast/toast.dart';

class PaymentGateway extends StatefulWidget {
  final double amount;
  PaymentGateway({Key key, this.amount}) : super(key: key);

  @override
  _PaymentGatewayState createState() => _PaymentGatewayState(amount: amount);
}

class _PaymentGatewayState extends State<PaymentGateway> {
  final double amount;
  int attempt = 0;
  _PaymentGatewayState({this.amount});

  // ignore: unused_field
  String _upiAddrError;

  final _upiAddressController = TextEditingController();
  final _amountController = TextEditingController();

  // ignore: unused_field
  bool _isUpiEditable = false;
  Future<List<ApplicationMeta>> _appsFuture;

  @override
  void initState() {
    super.initState();

    _amountController.text = (amount + 1).toStringAsFixed(2);
    _upiAddressController.text = "8950558003@ybl";
    _appsFuture = UpiPay.getInstalledUpiApplications();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _upiAddressController.dispose();
    super.dispose();
  }

  // void _generateAmount() {
  //   setState(() {
  //     _amountController.text = (amount + 1).toStringAsFixed(2);
  //   });
  // }

  void delay() {
    // Timer _timer = new Timer(const Duration(milliseconds: 800), () {
    //   Navigator.pop(context);
    //   setState(() {});
    // });
  }

//  Future<void> showAlert(){
//    return showDialog<void>(
//      context: context,
//      barrierDismissible: false, // user must tap button!
//      builder: (BuildContext context) {
//        return AlertDialog(
//          title: Text('Payment Failed'),
//          content: SingleChildScrollView(
//            child: ListBody(
//              children: <Widget>[
//                Text('Something Went Wrong.'),
//                Text('Please try again'),
//              ],
//            ),
//          ),
//
//          actions: <Widget>[
//            FlatButton(
//              child: Text('Approve'),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }
  void showToast() {
    Toast.show('Payment try again', context,
        duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
  }

  Future<void> _onTap(ApplicationMeta app) async {
    final err = _validateUpiAddress(_upiAddressController.text);
    if (err != null) {
      setState(() {
        _upiAddrError = err;
      });
      return;
    }
    setState(() {
      _upiAddrError = null;
    });

    final transactionRef =
        Random.secure().nextInt(1 << 32).toString(); //-------------
    print("Starting transaction with id $transactionRef");

    final a = await UpiPay.initiateTransaction(
      amount: _amountController.text,
      app: app.upiApplication,
      receiverName: 'Rahul',
      receiverUpiAddress: _upiAddressController.text, //-----------
      transactionRef: transactionRef,
      merchantCode: '7372',
    );
    print(a);
    print("a.status: ${a.status.toString()}");
    print("a.raw_responce: ${a.rawResponse}");

    switch (a.status) {
      case UpiTransactionStatus.success:
        {
          print('great');
          for (int i = 0; i < 4; i++) {
            Navigator.pop(context);
          }
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PaymentSuccess()));
        }
        break;
      case UpiTransactionStatus.failure:
        {
          attempt++;
          if (attempt > 5) {
            print("try again later");
          } else {
            showToast();

            print("check for raw response or reason of failure");
          }
        }
        break;
      default:
        {
          print("This is something else");
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('UPI Pay'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 128, bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Pay Using',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  FutureBuilder<List<ApplicationMeta>>(
                    future: _appsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Container();
                      }

                      return GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1.6,
                        physics: NeverScrollableScrollPhysics(),
                        children: snapshot.data
                            .map((it) => Material(
                                  key: ObjectKey(it.upiApplication),
                                  color: Colors.grey[200],
                                  child: InkWell(
                                    onTap: () => _onTap(it),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.memory(
                                          it.icon,
                                          width: 64,
                                          height: 64,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 4),
                                          child: Text(
                                            it.upiApplication.getAppName(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

String _validateUpiAddress(String value) {
  if (value.isEmpty) {
    return 'UPI Address is required.';
  }

  if (!UpiPay.checkIfUpiAddressIsValid(value)) {
    return 'UPI Address is invalid.';
  }

  return null;
}
