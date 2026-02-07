
import 'dart:io';
import 'package:animate_do/animate_do.dart';

import 'package:cached_network_image/cached_network_image.dart';


import '../../Controller/Account_Controller/Account_details_controller.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/logincontroller.dart';
import '/Controller/Account_Controller/Account_update_controller.dart';
import '../commonpage/export.dart';
import 'loader.dart';
class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => AccountState();
}

class AccountState extends State<Account> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageFile=null;

  }
  static File? imageFile;

  static var croppedImage;
  final _formkey = GlobalKey<FormState>();



  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    _cropImage(pickedFile?.path);
  }

  _cropImage(filePath) async {
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
        imageFile = File(croppedImage.path);
      });
    }
    if (croppedImage == null) {
      setState(() {
        print("Data not retrive");
      });
    }
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
                print( Getstore.box.read("firstname"));
                // Getstore.store();

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
          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.title.toString(),
          style: ThemeText.title1,
        ),
      ),
      bottomNavigationBar: const Bottomnavigation(
        item: 2,
      ),
      body:  Obx(() {
        if( Get.put(AccountupdateController()).accountupdateResponseStatus.isFalse&&Get.put(AccountupdateController()).accountdetailsResponseStatus.isFalse) {
          return SingleChildScrollView(
            child: FadeInUp(
              duration: const Duration(seconds: 1),
              child:   Center(
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
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
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
                                    Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.heading.toString(),
                                    style: ThemeText.maintitle),

                                const SizedBox(height: 10),
                                Text(
                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.content.toString().tr,
                                  style: ThemeText.bodydata,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 60),
                                // Text("Fill the following credentials to login your account", style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.primaryColor))),
                              ],
                            ),
                          ),
                        ),
                        if(Get.put(AccountupdateController()).image==null)
                          Container(
                            decoration:BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(5.0)),

                              border: Border.all(width: 3, color: ThemeText.appcolor),
                            ),
                            child:  ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(0)),

                              child:(imageFile==null)?const Image(
                                image: AssetImage(
                                  'images/icon.png',

                                ),
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,): ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                                child:  Image.file(
                                  imageFile!,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),

                            ),
                          )
                        else
                          Container(
                            decoration:BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(5.0)),

                              border: Border.all(width: 3, color: ThemeText.appcolor),
                            ),
                            child:  ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(0)),

                              child:(imageFile==null)?  Container(

                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child:(Get.put(AccountdetailsController()).accountdetailData.value.data!.userAvatar =="")?
                                CachedNetworkImage(
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
                                ):CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width:100,
                                  height: 100,
                                  imageUrl:Get.put(AccountupdateController()).image,
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
                                )
                              ): ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                                child:  Image.file(
                                  imageFile!,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),

                            ),
                          )
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

                            return ThemeText.appcolor;
                          },
                          ),
                        ),
                        child:  Text(
                          "Upload Profile".toUpperCase(),
                          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400,letterSpacing: 1),
                        ),
                        onPressed: () {
                          _getFromGallery();


                        },
                      ),
                    ),




                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formkey,
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
                                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.firstName.toString(),
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
                                            controller:Get.put(AccountupdateController()).firstname,


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


                                            decoration:  Common.common(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.firstName.toString(),IconlyLight.profile),
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
                                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.lastName.toString(),
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
                                            controller:Get.put(AccountupdateController()).lastname,

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


                                            decoration:  Common.common(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.lastName.toString(),IconlyLight.profile),
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
                                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.email.toString(),
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

                                            controller:Get.put(AccountupdateController()).email,
                                            autocorrect: true,
                                            keyboardType: TextInputType.emailAddress,
                                            validator: (value) {
                                              // Check if this field is empty
                                              if (value == null || value.isEmpty) {
                                                return 'This field is required';
                                              }

                                              // using regular expression
                                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                                return "Please enter a valid ${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.email.toString()} address";
                                              }
                                              if (value.contains(' ')) {
                                                return '${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.firstName.toString()} cannot contain spaces';
                                              }

                                              // the email is valid
                                              return null;
                                            },
                                            style: const TextStyle(
                                                color: Color(0xffADA4A5),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                            cursorColor: ThemeText.appcolor,


                                            decoration:  Common.common(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.email.toString(),IconlyLight.message),
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
                                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.phoneNumber.toString(),
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
                                            controller:Get.put(AccountupdateController()).phonenumber,
                                            autocorrect: true,
                                            keyboardType: TextInputType.phone,
                                            validator: (value) {
                                              // Check if this field is empty
                                              if (value == null || value.isEmpty) {
                                                return 'This field is required';
                                              }
                                              if (value.contains(' ')) {
                                                return '${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.phoneNumber.toString()} cannot contain spaces';
                                              }

                                              // using regular expression
                                              if (value.length<10) {
                                                return "Please enter a valid ${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.phoneNumber.toString()}";
                                              }

                                              // the email is valid
                                              return null;
                                            },
                                            style: const TextStyle(
                                                color: Color(0xffADA4A5),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                            cursorColor: ThemeText.appcolor,


                                            decoration:  Common.common(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.phoneNumber.toString(),IconlyLight.call),
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
                                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.biography.toString(),
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
                                            controller:Get.put(AccountupdateController()).biography,

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


                                            decoration:  Common.common(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.biography.toString(),Icons.book_online_rounded),
                                          ),



                                        ],
                                      ),
                                    )),
                              ),
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
                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerAccount!.saveButton.toString().toUpperCase(),
                                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,letterSpacing: 1),
                                ),
                                onPressed: () {

                                  if(_formkey.currentState!.validate()) {
                                    Get.put(AccountupdateController()).accountupdate();
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
            ),


          );

        } else {
          return const LoadingScreen();

        }}),


    ));
  }
}
