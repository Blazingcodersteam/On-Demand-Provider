import '../commonpage/export.dart';
class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _registrationformkey = GlobalKey<FormState>();
  bool _isObscure = true;
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                                    "Provider Application",
                                    style: ThemeText.maintitle),

                                SizedBox(height: 10),
                                Text(
                                  "Welcome to the best service provider system!".tr,
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
                            borderRadius: const BorderRadius.all(Radius.circular(20.0)),

                            border: Border.all(width: 5, color: ThemeText.appcolor),
                          ),
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(0)),

                            child:Image(image: AssetImage(
                              'images/icon.png',

                            ),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,),
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
                            Text("Registration"
                                "",style: ThemeText.heading,),



                          ],
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),


                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _registrationformkey,
                        child: Column(
                          children: [
                            TextFormField(


                              autocorrect: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                // Check if this field is empty
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }

                                // using regular expression
                                // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                //   return "Please enter a valid email address";
                                // }

                                // the email is valid
                                return null;
                              },
                              style: const TextStyle(
                                  color: Color(0xffADA4A5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              cursorColor: ThemeText.appcolor,


                              decoration: Common.common("First Name",IconlyLight.user),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              autocorrect: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                // Check if this field is empty
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }

                                // using regular expression
                                // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                //   return "Please enter a valid email address";
                                // }

                                // the email is valid
                                return null;
                              },
                              style: const TextStyle(
                                  color: Color(0xffADA4A5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              cursorColor: ThemeText.appcolor,


                              decoration: Common.common("Last Name",IconlyLight.user),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(


                              autocorrect: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                // Check if this field is empty
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }

                                // using regular expression
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return "Please enter a valid email address";
                                }

                                // the email is valid
                                return null;
                              },
                              style: const TextStyle(
                                  color: Color(0xffADA4A5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              cursorColor: ThemeText.appcolor,


                              decoration:  Common.common("Email",IconlyLight.message),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              autocorrect: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                // Check if this field is empty
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }

                                // using regular expression
                                if (value.length<10) {
                                  return "Please enter a valid Phone Number";
                                }

                                // the email is valid
                                return null;
                              },
                              style: const TextStyle(
                                  color: Color(0xffADA4A5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              cursorColor: ThemeText.appcolor,


                              decoration:  Common.common("Phone Number",IconlyLight.call),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              autocorrect: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                // Check if this field is empty
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }

                                // using regular expression
                                if (value.length<10) {
                                  return "Please enter a valid Phone Number";
                                }

                                // the email is valid
                                return null;
                              },
                              style: const TextStyle(
                                  color: Color(0xffADA4A5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              cursorColor: ThemeText.appcolor,


                              decoration:  Common.common("Password",IconlyLight.password),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(

                              autocorrect: true,
                              obscureText: _isObscure,

                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                if (value.length < 8) {
                                  return 'Password must be at least 8 characters long';
                                }
                                // You can add more complex validation rules using regex
                                // For example, to require at least one digit and one uppercase letter:
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
                                prefixIcon: const Icon(IconlyLight.password, color:  Color(0xffADA4A5),size: 23,),
                                fillColor: Colors.white,
                                filled: true,
                                errorStyle: const TextStyle(
                                  fontSize: 12.0,
                                ),
                                hintText: "Confirm Password",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.0, top: 4),
                                  child: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: const Color(0xffADA4A5),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xffDBE2EC),
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xffDBE2EC),
                                    width: 1.0,
                                  ),
                                ),
                                focusedErrorBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xffDBE2EC),
                                    width: 1.0,
                                  ),
                                ) ,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xffDBE2EC),
                                    width: 1.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xffDBE2EC),
                                    width: 1.0,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.only(
                                    left: 35, bottom: 11, top: 20, right: 15),

                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap:(){
                                    Get.toNamed(AppRoutes.forgotpassword);
                                  },
                                  child:   Text("Forgot Password ?",style: ThemeText.textdata,),
                                )




                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 50,
                              margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                  backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {

                                    return ThemeText.appcolor;
                                  },
                                  ),
                                ),
                                child:  Text(
                                  "Register".toUpperCase(),
                                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,letterSpacing: 1),
                                ),
                                onPressed: () {
                                  Get.toNamed(AppRoutes.home);
                                  if(_registrationformkey.currentState!.validate()) {
                                    // OtpscreenState.verifyPhoneNumber().whenComplete(() => Get.toNamed(AppRoutes.otpscreen));
                                  }


                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.toNamed(AppRoutes.home);
                                  },
                                  child:  Text("You already have an account",style: ThemeText.textdata,),
                                )



                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

