import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Controller/Forgot_Password_Controller/forgot_password_controller.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/logincontroller.dart';
import '../commonpage/export.dart';
import 'loader.dart';
class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  LoginController logincontroller = Get.put(LoginController());
  Fogotpasswordcontroller fogotpasswordcontroller = Get.put(Fogotpasswordcontroller());
  void initState() {
    // TODO: implement initState
    super.initState();
if(logincontroller
    .otp_status==false){
  fogotpasswordcontroller.emailcontroller.text=logincontroller.phoneNumberController.text;
  fogotpasswordcontroller.update();
}

  }
  final _registrationformkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return  SafeArea(
          child:Scaffold(
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
                            height: 200,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color:ThemeText.basiccolor,
                              borderRadius: BorderRadius.vertical(bottom: const Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(color: Get.theme.focusColor.withOpacity(0.2), blurRadius: 10, offset: Offset(0, 5)),
                              ],
                            ),
                            margin: EdgeInsets.only(bottom: 50),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.title.toString(),
                                      style: ThemeText.maintitle),

                                  SizedBox(height: 10),
                                  Text(
                                    Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.login!.subTitle.toString().tr,
                                    style: ThemeText.bodydata,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10),
                                  // Text("Fill the following credentials to login your account", style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.primaryColor))),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration:BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(5.0)),

                              border: Border.all(width: 3, color: ThemeText.appcolor),
                            ),
                            child:  ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(0)),

                              child:CachedNetworkImage(
                                fit: BoxFit.cover,
                                width:100,
                                height: 100,
                                imageUrl:Get.put(Settingscontroller()).settingsdata.value.data!.logoUrl.toString()+Get.put(Settingscontroller()).settingsdata.value.data!.siteLogo.toString(),
                                placeholder: (context, url) =>   Center(
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
                      Padding(padding:const EdgeInsets.only(left:8,right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Forgot Password"
                                ,style: ThemeText.heading,),



                            ],
                          )),


if(fogotpasswordcontroller.forgotpasswordStatus.isFalse)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: _registrationformkey,
                          child: Column(
                            children: [


                              const SizedBox(
                                height: 20,
                              ),
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
                                        child:  Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 0.0, horizontal: 15.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Email",
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
                                              controller:fogotpasswordcontroller.emailcontroller,
                                              autocorrect: true,
                                              keyboardType: TextInputType.emailAddress,
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'This field is required';
                                                }
                                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                                  return "Please enter a valid email address";
                                                }
                                                if (value.contains(' ')) {
                                                  return 'Email cannot contain spaces';
                                                }
                                                return null;
                                              },
                                              style: const TextStyle(
                                                  color: Color(0xffADA4A5),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                              cursorColor: ThemeText.appcolor,
                                              decoration:  Common.common("Email",IconlyLight.message),
                                            ),

                                          ],
                                        ),
                                      )),
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),
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
                                          return  ThemeText.appcolor;
                                        },
                                      ),
                                    ),
                                    child: Text(
      "Send".toUpperCase(),
      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,letterSpacing: 1),
      ),
      onPressed: () {

      // Get.toNamed(AppRoutes.home);
      if(_registrationformkey.currentState!.validate()) {
        fogotpasswordcontroller.forgotpasswordscreen({
       "email":fogotpasswordcontroller.emailcontroller.text,}, "forgot_password");
      }

      },

                                  ),
                                ),
                              ),




                            ],
                          ),
                        ),
                      )
                      else
  Column(
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
  )
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
