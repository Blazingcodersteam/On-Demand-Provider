import 'dart:io';


import 'package:cached_network_image/cached_network_image.dart';

import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '/Controller/Basicinformationcontroller.dart';
import '/Controller/logincontroller.dart';
import '../commonpage/export.dart';
class Generalpage extends StatefulWidget {
  const Generalpage({Key? key}) : super(key: key);

  @override
  State<Generalpage> createState() => GeneralpageState();
}

class GeneralpageState extends State<Generalpage> {


  static File? image;

  static var croppedImage;
  final _basicinformationformkey = GlobalKey<FormState>();

  bool _isObscure = true;
  getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    cropImage(pickedFile?.path);
  }
  cropImage(filePath) async {
    croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
    );
    if (croppedImage != null) {
      setState(() {
        image = File(croppedImage.path);
      });
    }
    if (croppedImage == null) {
      setState(() {
        print("Data not retrive");
      });
    }
  }
  BasicinformationController basicinformationcontroller = Get.put(BasicinformationController());
  void initState() {
    // TODO: implement initState
    super.initState();

   setState(() {
     basicinformationcontroller.getAndroidDeviceId();
     basicinformationcontroller.getFcmToken();
     image=null;
     if(Get.put(LoginController()).phoneNumberController!=null) {
       basicinformationcontroller.phonecontroller=Get.put(LoginController()).phoneNumberController;
     }
   });

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

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

        centerTitle: true,
        title: Text(
          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.title.toString(),
          style: ThemeText.title1,
        ),
      ),

      body: GetBuilder<BasicinformationController>(
    builder: (controller) {
      if(basicinformationcontroller.basicinformationResponseStatus.isFalse) {
        return   SingleChildScrollView(
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
                    borderRadius: BorderRadius.vertical(bottom: const Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(color: Get.theme.focusColor.withOpacity(0.2), blurRadius: 10, offset: Offset(0, 5)),
                    ],
                  ),
                  margin: const EdgeInsets.only(bottom: 50),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.heading.toString(),
                            style: ThemeText.maintitle),

                        const SizedBox(height: 10),
                        Text(
                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.subTitle.toString().tr,
                          style: ThemeText.bodydata,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 60),
                        // Text("Fill the following credentials to login your account", style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.primaryColor))),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration:BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),

                    border: Border.all(width: 3, color: ThemeText.appcolor),
                  ),
                  child:  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(0)),

                    child:(image==null)?CachedNetworkImage(
                        fit: BoxFit.cover,
                        width:100,
                        height: 100,
                        imageUrl:"https://img.freepik.com/premium-photo/user-icon_867433-72.jpg",
                        placeholder: (context, url) {
                          return Image.network("https://img.freepik.com/premium-photo/user-icon_867433-72.jpg");
                        } ,
                        errorWidget: (context, url, error) {
                          return Image.network("https://img.freepik.com/premium-photo/user-icon_867433-72.jpg");
                        }
                    ): ClipRRect(
                      borderRadius: BorderRadius.all(const Radius.circular(5)),
                      child:  Image.file(
                        image!,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),

                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 150,
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {

                    return  ThemeText.appcolor;
                  },
                  ),
                ),
                child:  Text(
                  "Upload Profile".toUpperCase(),
                  style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400,letterSpacing: 1),
                ),
                onPressed: () {
                  getFromGallery();


                },
              ),
            ),




            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _basicinformationformkey,
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
                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.firstName.toString(),
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
                                    controller: basicinformationcontroller.namecontroller,


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


                                    decoration:  Common.common(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.firstName.toString(),IconlyLight.profile),
                                  ),



                                ],
                              ),




                            )),
                      ),
                    ),

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
                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.lastName.toString(),
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
                                    controller: basicinformationcontroller.lastnamecontroller,


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


                                    decoration:  Common.common(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.lastName.toString(),IconlyLight.profile),
                                  ),



                                ],
                              ),




                            )),
                      ),
                    ),

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
                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.email.toString(),
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

                                    controller: basicinformationcontroller.emailcontroller,
                                    autocorrect: true,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      // Check if this field is empty
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      if (value.contains(' ')) {
                                        return '${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.email.toString()} cannot contain spaces';
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


                                    decoration:  Common.common(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.email.toString(),IconlyLight.message),
                                  ),



                                ],
                              ),
                            )),
                      ),
                    ),

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
                              child:   Column(
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
                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.phoneNumber.toString(),
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
                                    controller: basicinformationcontroller.phonecontroller,
                                    autocorrect: true,
                                    showCursor: false,
                                    readOnly: true,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      // Check if this field is empty
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      if (value.contains(' ')) {
                                        return '${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.phoneNumber.toString()} cannot contain spaces';
                                      }
                                      // using regular expression
                                      if (value.length<10) {
                                        return "Please enter a valid ${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.phoneNumber.toString()}";
                                      }

                                      // the email is valid
                                      return null;
                                    },
                                    style: const TextStyle(
                                        color: Color(0xffADA4A5),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    cursorColor: ThemeText.appcolor,


                                    decoration:  Common.common(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.phoneNumber.toString(),IconlyLight.call),
                                  ),



                                ],
                              ),
                            )),
                      ),
                    ),
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
                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.password.toString(),
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
                                    controller: basicinformationcontroller.passwordcontroller,
                                    autocorrect: true,
                                    obscureText: _isObscure,

                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      if (value.length < 8) {
                                        return '${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.password.toString()} must be at least 8 characters long';
                                      }
                                      if (value.contains(' ')) {
                                        return '${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.password.toString()} cannot contain spaces';
                                      }
                                      //
                                      // You can add more complex validation rules using regex
                                      // For example, to require at least one digit and one uppercase letter:
                                      if (!RegExp(r'^(?=.*[0-9])(?=.*[A-Z]).*$').hasMatch(value)) {
                                        return '${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.password.toString()} must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
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
                                      hintText: Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.password.toString(),
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
                                          //color: Color(0xffDBE2EC),
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          //color: Color(0xffDBE2EC),
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedErrorBorder:OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          // color: Color(0xffDBE2EC),
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                      ) ,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          // color: Color(0xffDBE2EC),
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          // color: Color(0xffDBE2EC),
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          left: 0, bottom: 11, top: 20, right: 15),

                                    ),
                                  ),



                                ],
                              ),




                            )),
                      ),
                    ),

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
                              child:     Column(
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
                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.biography.toString(),
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
                                    controller: basicinformationcontroller.biographycontroller,

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


                                    decoration:  Common.common(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.biography.toString(),Icons.book_online_rounded),
                                  ),



                                ],
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 20,
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
                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.basicInformation!.saveButton.toString().toUpperCase(),
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,letterSpacing: 1),
                        ),
                        onPressed: () {

                          if(_basicinformationformkey.currentState!.validate()) {
                            basicinformationcontroller.BasicRegistration();


                          }


                        },
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
      }
      else{
        return   Column(
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

    })




    ));
  }
}
