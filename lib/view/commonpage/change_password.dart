import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Controller/Change_Password_Controller/change_password_controller.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/logincontroller.dart';
import '../commonpage/export.dart';
class Changepassword extends StatefulWidget {
  const Changepassword({Key? key}) : super(key: key);

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {

  Changepaswordcontroller changepaswordcontroller = Get.put(Changepaswordcontroller());

  final _changepasswordkey = GlobalKey<FormState>();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

      appBar: AppBar(
        backgroundColor:  ThemeText.basiccolor,
        elevation: 0,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
        leading:Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 25,
              ),
            );
          },
        ),
        actions:  [
          // Padding(padding: const EdgeInsets.only(right:20,top:10),
          //   child: Badge(
          //     badgeContent: const SizedBox(
          //         width: 15, height: 15, //badge size
          //         child:Center(  //aligh badge content to center
          //           child:Text("3", style: TextStyle(
          //               color: Colors.white,  //badge font color
          //               fontSize: 10 //badge font size
          //           )
          //           ),
          //         )
          //     ),
          //     badgeColor: ThemeText.appcolor,
          //     child:  Icon(IconlyLight.notification, size: 25, color:  ThemeText.secondarycolor,), //badge background color
          //   ),)

        ],
        centerTitle: true,
        title: Text(
          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.changePassword!.title.toString(),
          style: ThemeText.title1,
        ),
      ),
      bottomNavigationBar: const Bottomnavigation(
        item: 1,
      ),
      body: Obx((){
        if(changepaswordcontroller.changepasswordresponseStatus.isFalse){
          return FadeInUp(
            duration: const Duration(seconds: 1),
            child:  SingleChildScrollView(
              child: Center(
                child: Column(

                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          height: Get.height*0.22,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color:ThemeText.basiccolor,
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(color: Get.theme.focusColor.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 5)),
                            ],
                          ),
                          margin: const EdgeInsets.only(bottom: 50),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.changePassword!.heading.toString(),
                                    style: ThemeText.maintitle),

                                const SizedBox(height: 10),
                                Text(
                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.changePassword!.subTitle.toString().tr,
                                  style: ThemeText.bodydata,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 60),

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
                      height: 10,
                    ),





                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _changepasswordkey,
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
                                              children:  [
                                                Text(
                                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.changePassword!.previousPassword.toString(),
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
                                              controller: changepaswordcontroller.previouspassword,

                                              autocorrect: true,
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
                                                if (value.contains(' ')) {
                                                  return 'Password cannot contain spaces';
                                                }


                                                if (!RegExp(r'^(?=.*[0-9])(?=.*[A-Z]).*$').hasMatch(value)) {
                                                  return 'Password must contain at least one digit and one uppercase letter';
                                                }
                                                return null;
                                              },
                                              style: const TextStyle(
                                                  color: Color(0xffADA4A5),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                              cursorColor: ThemeText.appcolor,
                                              decoration:  Common.common("Enter ${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.changePassword!.previousPassword.toString()}",
                                                  IconlyLight.lock)),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
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
                                              children:  [
                                                Text(
                                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.changePassword!.newPassword.toString(),
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
                                              controller: changepaswordcontroller.newpasswordcontroller,
                                              autocorrect: true,
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
                                                if (value.contains(' ')) {
                                                  return 'Password cannot contain spaces';
                                                }


                                                if (!RegExp(r'^(?=.*[0-9])(?=.*[A-Z]).*$').hasMatch(value)) {
                                                  return 'Password must contain at least one digit and one uppercase letter';
                                                }
                                                return null;
                                              },
                                              style: const TextStyle(
                                                  color: Color(0xffADA4A5),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                              cursorColor: ThemeText.appcolor,
                                              decoration:  Common.common("Enter ${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.changePassword!.newPassword.toString()}",
                                                  IconlyLight.lock)),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
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
                                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.changePassword!.confirmPassword.toString(),
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
                                            controller: changepaswordcontroller.confirmpasswordontroller,
                                            autocorrect: true,
                                            obscureText: _isObscure,
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
                                              if (value.contains(' ')) {
                                                return 'Password cannot contain spaces';
                                              }

                                              if (!RegExp(r'^(?=.*[0-9])(?=.*[A-Z]).*$').hasMatch(value)) {
                                                return 'Password must contain at least one digit and one uppercase letter';
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
                                              hintText: Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.changePassword!.confirmPassword.toString(),
                                              suffixIcon: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0, top: 4),
                                                child: IconButton(
                                                  icon: Icon(
                                                    _isObscure
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color:
                                                    const Color(0xffADA4A5),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _isObscure =
                                                      !_isObscure;
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
                                                  left: 0,
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
                            BounceInDown(
                              duration: Duration(seconds: 1),
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
                                    Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.changePassword!.saveButton.toString().toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  onPressed: () {
                                    if (_changepasswordkey.currentState!
                                        .validate()) {
                                      changepaswordcontroller.changepasswordscreen({
                                        "user_id":   Getstore.box.read("userid").toString(),
                                        "old_pass":changepaswordcontroller.previouspassword.text ,
                                        "new_pass": changepaswordcontroller.newpasswordcontroller.text,
                                        "confirm_pass": changepaswordcontroller.confirmpasswordontroller.text,
                                      }, "change_password");
                                    }
                                    //
                                  },
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }else{
          return   Center(
            child: LoadingAnimationWidget.twistingDots(
              leftDotColor: ThemeText.appcolor,
              rightDotColor: ThemeText.basiccolor,
              size: 70,
            ),
          );
        }
      })

    ));
  }
}
