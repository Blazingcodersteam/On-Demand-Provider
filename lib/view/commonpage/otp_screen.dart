import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../Commonpage/export.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

import '/Controller/logincontroller.dart';


class Otpscreen extends StatefulWidget {
  @override
  OtpscreenState createState() => OtpscreenState();
}

class OtpscreenState extends State<Otpscreen> {
  int _otpCodeLength = 6;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  // static FirebaseAuth _auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final intRegex = RegExp(r'\d+', multiLine: true);
  TextEditingController textEditingController =
      new TextEditingController(text: "");
  LoginController logincontroller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    logincontroller.smsCodeController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    SmsVerification.stopListening();
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color:  ThemeText.appcolor),
      borderRadius: BorderRadius.circular(5.0),
    );
  }

  /// get signature code
  _getSignatureCode() async {
    String? signature = await SmsVerification.getAppSignature();
    print("signature $signature");
  }

  /// listen sms
  _startListeningSms() {
    SmsVerification.startListeningSms().then((message) {
      setState(() {
        _otpCode = SmsVerification.getCode(message, intRegex);
        textEditingController.text = _otpCode;
        _onOtpCallBack(_otpCode, true);
      });
    });
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        _verifyOtpCode();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }

  _verifyOtpCode() {
    FocusScope.of(context).requestFocus(FocusNode());
    Timer(const Duration(milliseconds: 4000), () {
      setState(() {
        _isLoadingButton = false;
        _enableButton = false;
      });

      _scaffoldKey.currentState?.showSnackBar(
          SnackBar(content: Text("Verification OTP Code $_otpCode Success")));
    });
  }

  var login = Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.verifyLoginButton.toString();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return  Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              // elevation:10,
              // backgroundColor: const Color(0xff00D6C7),
              automaticallyImplyLeading: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(0),
                ),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 30,
                    ),
                  );
                },
              ),

              title: Text(
                Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.otpTitle.toString(),
                style: ThemeText.appbar,
              ),
            ),
            body: (logincontroller.loginResponseStatus.isFalse)?Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.phoneNumberVerification.toString(),
                              style: ThemeText.heading,
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text.rich(TextSpan(
                        text: 'Please Enter the code send to : ',
                        style: ThemeText.subconten,
                        children: <InlineSpan>[
                          TextSpan(
                            text: (logincontroller.phoneNumberController.text != null)
                                ? logincontroller.phoneNumberController.text.toString()
                                : 'Not updated',
                            style: ThemeText.text,
                          )
                        ])),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFieldPin(
                        textController: logincontroller.smsCodeController,
                        autoFocus: true,
                        codeLength: _otpCodeLength,
                        alignment: MainAxisAlignment.center,
                        defaultBoxSize: 46.0,
                        margin: 5,
                        selectedBoxSize: 46.0,
                        textStyle: const TextStyle(fontSize: 16),
                        defaultDecoration: _pinPutDecoration.copyWith(
                            border: Border.all(
                                color: Color(0xffE2D9FA).withOpacity(0.6))),
                        selectedDecoration: _pinPutDecoration,
                        onChange: (code) {
                          _onOtpCallBack(code, false);
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (states) {
                              return ThemeText.appcolor ;
                            },
                          ),
                        ),
                        child: Text(
                          login.toUpperCase(),
                          style:
                          const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          // Get.toNamed(AppRoutes.home);

                          setState(() {
                            String otp = logincontroller.smsCodeController.text.trim();
                            print(otp);
                            if (otp.isNotEmpty) {
                              logincontroller.signInWithPhoneNumber(
                                  otp); // Call the function in the previous screen
                            } else {
                              // Handle empty OTP
                              Get.snackbar(
                                "Otp Status",
                                "Enter the Otp",
                                // showProgressIndicator: true,
                                //icon: Icon(Icons.person, color: Colors.white),
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.redAccent,
                                borderRadius: 20,
                                margin: const EdgeInsets.all(15),
                                colorText: Colors.white,
                                duration: const Duration(seconds: 3),
                                isDismissible: true,
                                dismissDirection: DismissDirection.horizontal,
                                forwardAnimationCurve: Curves.easeOutCubic,
                              );
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Did not recive the code ? ",style: ThemeText.subconten ,),

                        const SizedBox(width: 5,),
                        InkWell(
                          onTap:(){
                            logincontroller.smsCodeController.clear();
                            logincontroller.verifyPhoneNumber();
                          },
                          child:   Text("Resend",style: ThemeText.retry,),
                        )

                      ],
                    )

                  ],
                ),
              ),
            ): Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: ThemeText.appcolor,
                rightDotColor: ThemeText.basiccolor,
                size: 70,
              ),
            ),
          );
        });




  }

  Widget _setUpButtonChild() {
    if (_isLoadingButton) {
      return Container(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        "Verify",
        style: TextStyle(color: Colors.white),
      );
    }
  }
}
