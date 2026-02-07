import 'package:cached_network_image/cached_network_image.dart';

import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '/Controller/logincontroller.dart';
import '../commonpage/export.dart';
import '../routes/approutes.dart';
import 'package:animate_do/animate_do.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController logincontroller = Get.put(LoginController());
  Settingscontroller settingscontroller = Get.put(Settingscontroller());

  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   logincontroller.otp_status = false.obs;
  //   // logincontroller.update();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    height: Get.height * 0.3,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: ThemeText.basiccolor,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Get.theme.focusColor.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5)),
                      ],
                    ),
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.title.toString(),
                              style: ThemeText.maintitle),

                          const SizedBox(height: 10),
                          Text(
                            Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.subTitle.toString().tr,
                            style: ThemeText.bodydata,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          // Text("Fill the following credentials to login your account", style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.primaryColor))),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(width: 3, color: ThemeText.appcolor),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(const Radius.circular(5)),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                        imageUrl:Get.put(Settingscontroller()).settingsdata.value.data!.logoUrl.toString()+Get.put(Settingscontroller()).settingsdata.value.data!.siteLogo.toString(),
                        placeholder: (context, url) => Center(
                          child: LoadingAnimationWidget.twistingDots(
                            leftDotColor: ThemeText.appcolor,
                            rightDotColor: ThemeText.basiccolor,
                            size: 70,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            LoadingAnimationWidget.flickr(
                          leftDotColor: ThemeText.appcolor,
                          rightDotColor: ThemeText.basiccolor,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.logIn.toString(),
                        style: ThemeText.heading,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<LoginController>(builder: (context) {
                if (logincontroller.loginResponseStatus.isFalse) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: logincontroller.formkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 5),
                            child: Container(
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: 3.0, vertical: 3.0),

                              decoration: BoxDecoration(
                                // color:ThemeText.basiccolor, // Set your desired color here
                                borderRadius: BorderRadius.circular(
                                    5), // Set your desired border radius here
                              ),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    //set border radius more than 50% of height and width to make circle
                                  ),
                                  shadowColor: ThemeText.basiccolor,
                                  elevation: 7,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0.0, horizontal: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              (logincontroller
                                                      .otp_status.isFalse)
                                                  ?  Text(
                                                Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.phoneNumbeEmail.toString(),
                                                      style: TextStyle(
                                                        color:
                                                            ThemeText.headingcolor,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    )
                                                  :  Text(
                                                Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.phoneNumber.toString(),
                                                      style: TextStyle(
                                                        color:
                                                        ThemeText.headingcolor,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    )
                                            ],
                                          ),
                                        ),
                                        TextFormField(
                                            controller: logincontroller
                                                .phoneNumberController,
                                            autocorrect: true,
                                            keyboardType: (logincontroller
                                                    .otp_status.isFalse)
                                                ? TextInputType.emailAddress
                                                : TextInputType.phone,
                                            validator: (value) {
                                              // Check if this field is empty
                                              if (logincontroller
                                                  .otp_status.isFalse) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'This field is required.';
                                                } else if (!RegExp(r'^\d{10}$')
                                                        .hasMatch(value) &&
                                                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                                        .hasMatch(value)) {
                                                  return 'Enter Valid Email or Phone Number';
                                                }
                                                if (value.contains(' ')) {
                                                  return 'Email/Phone number cannot contain spaces';
                                                }
                                                return null;
                                              } else {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'This field is required.';
                                                } else if (!RegExp(r'^\d{10}$')
                                                    .hasMatch(value)) {
                                                  return 'Enter Valid  Phone Number';
                                                }
                                                return null;
                                              }
                                            },
                                            style: const TextStyle(
                                                color: Color(0xffADA4A5),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                            cursorColor: ThemeText.appcolor,
                                            decoration: (logincontroller
                                                    .otp_status.isFalse)
                                                ? Common.common(
                                                Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.phoneNumbeEmail.toString(),
                                                    IconlyLight.call)
                                                : Common.common(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.phoneNumber.toString(),
                                                    IconlyLight.call)),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (logincontroller.otp_status == false.obs)
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 5),
                              child: Container(
                                // padding: const EdgeInsets.symmetric(
                                //     horizontal: 3.0, vertical: 3.0),

                                decoration: BoxDecoration(
                                  // color:ThemeText.basiccolor, // Set your desired color here
                                  borderRadius: BorderRadius.circular(
                                      5), // Set your desired border radius here
                                ),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      //set border radius more than 50% of height and width to make circle
                                    ),
                                    shadowColor: ThemeText.basiccolor,
                                    elevation: 7,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 15.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children:  [
                                                Text(
                                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.password.toString(),
                                                  style: TextStyle(
                                                    color: ThemeText.headingcolor,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          TextFormField(
                                            controller: logincontroller
                                                .passwordcontroller,
                                            autocorrect: true,
                                            obscureText:
                                                logincontroller.isObscure,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'This field is required';
                                              }
                                              if (value.length < 8) {
                                                return 'Password must be at least 8 characters long';
                                              }

                                              if (!RegExp(
                                                      r'^(?=.*[0-9])(?=.*[A-Z]).*$')
                                                  .hasMatch(value)) {
                                                return 'Password must contain at least one digit and one uppercase letter';
                                              }
                                              if (value.contains(' ')) {
                                                return 'Password cannot contain spaces';
                                              }
                                              return null;
                                            },
                                            style: const TextStyle(
                                                color: Color(0xffADA4A5),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                            cursorColor: ThemeText.appcolor,
                                            decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                IconlyLight.password,
                                                color: Color(0xffADA4A5),
                                                size: 23,
                                              ),
                                              fillColor: Colors.white,
                                              filled: true,
                                              errorStyle: const TextStyle(
                                                fontSize: 12.0,
                                              ),
                                              hintText: "Password",
                                              suffixIcon: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0, top: 4),
                                                child: IconButton(
                                                  icon: Icon(
                                                    logincontroller.isObscure
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color:
                                                        const Color(0xffADA4A5),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      logincontroller
                                                              .isObscure =
                                                          !logincontroller
                                                              .isObscure;
                                                    });
                                                  },
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                  //color: Color(0xffDBE2EC),
                                                  color: Colors.white,
                                                  width: 1.0,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                  //color: Color(0xffDBE2EC),
                                                  color: Colors.white,
                                                  width: 1.0,
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                  // color: Color(0xffDBE2EC),
                                                  color: Colors.white,
                                                  width: 1.0,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                  // color: Color(0xffDBE2EC),
                                                  color: Colors.white,
                                                  width: 1.0,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                  // color: Color(0xffDBE2EC),
                                                  color: Colors.white,
                                                  width: 1.0,
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 2,
                                                      bottom: 11,
                                                      top: 20,
                                                      right: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.forgotpassword);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.forgotPassword.toString(),
                                      style: ThemeText.textdata,
                                    ),
                                  ],
                                ),
                              )),
                          if (logincontroller.otp_status == false.obs)
                            BounceInDown(
                              duration: const Duration(seconds: 1),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (states) {
                                        return ThemeText.appcolor;
                                      },
                                    ),
                                  ),
                                  child: Text(
                                    Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.loginButton.toString().toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  onPressed: () {
                                    if (logincontroller.formkey.currentState!
                                        .validate()) {
                                      logincontroller.login({
                                        "user_name": logincontroller
                                            .phoneNumberController.text,
                                        "password": logincontroller
                                            .passwordcontroller.text,
                                      }, "providers_login");

                                      //  logincontroller.verifyPhoneNumber().whenComplete(() => Get.toNamed(AppRoutes.otp_screen));
                                    }
                                  },
                                ),
                              ),
                            )
                          else
                            BounceInDown(
                              duration: const Duration(seconds: 1),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (states) {
                                        return ThemeText.appcolor;
                                      },
                                    ),
                                  ),
                                  child: Text(
                                    Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.verifyOtpButton.toString().toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  onPressed: () {
                                    if (logincontroller.formkey.currentState!
                                        .validate()) {
                                      logincontroller
                                          .verifyPhoneNumber()
                                          .whenComplete(() => Get.toNamed(
                                              AppRoutes.otp_screen));
                                    }
                                  },
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (logincontroller.otp_status == false.obs)
                            InkWell(
                                onTap: () {
                                  logincontroller.otp_status = true.obs;
                                  logincontroller.phoneNumberController.clear();
                                  logincontroller.passwordcontroller.clear();
                                  logincontroller.update();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.loginRegisterOtp.toString(),
                                        style: ThemeText.textdata,
                                      ),
                                    ],
                                  ),
                                ))
                          else
                            InkWell(
                                onTap: () {
                                  logincontroller.otp_status = false.obs;
                                  logincontroller.phoneNumberController.clear();
                                  logincontroller.passwordcontroller.clear();
                                  logincontroller.update();
                                  // Get.toNamed(AppRoutes.registration);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.loginUsernamePassword.toString(),
                                        style: ThemeText.textdata,
                                      ),
                                    ],
                                  ),
                                ))
                        ],
                      ),
                    ),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: LoadingAnimationWidget.twistingDots(
                          leftDotColor: ThemeText.appcolor,
                          rightDotColor: ThemeText.basiccolor,
                          size: 70,
                        ),
                      ),
                    ],
                  );
                }
              }),
            ],
          ),
        ),
      ),
    ));
  }
}
