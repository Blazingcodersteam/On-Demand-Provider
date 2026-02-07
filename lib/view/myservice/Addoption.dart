import 'dart:io';

import '../commonpage/export.dart';
class Addoption extends StatefulWidget {
  const Addoption({Key? key}) : super(key: key);

  @override
  State<Addoption> createState() => _AddoptionState();
}

class _AddoptionState extends State<Addoption> {
  static File? imageFile;
  String? gender;
  static var croppedImage;
  final _formkey = GlobalKey<FormState>();
  List<Map<String,dynamic>> dataList=[];

  @override
  void initState() {
    super.initState();

    for(int i=0;i<2;i++){
      dataList.add({
        "title":"Item $i",
        "isChecked":false
      });
    }
  }
  bool isChecked = false;
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

            centerTitle: true,
            title: Text(
              'Options',
              style: ThemeText.title1,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton:Container(
            color: Colors.white,
            margin: EdgeInsets.only(left:8,right:8),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width*0.45,
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      primary:  ThemeText.appcolor,// Adjust the elevation as needed
                    ),

                    child:  Text(
                      "Save".toUpperCase(),
                      style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold,letterSpacing: 1),
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.home);
                      if(_formkey.currentState!.validate()) {
                        // OtpscreenState.verifyPhoneNumber().whenComplete(() => Get.toNamed(AppRoutes.otpscreen));
                      }


                    },
                  ),
                ),
                Container(
                  width: Get.width*0.45,
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 5.0),
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      primary:  Color(0xffEEE7F7),// Adjust the elevation as needed
                    ),
                    //
                    child:  Text(
                      "Save & Add Options".toUpperCase(),
                      style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold,letterSpacing: 1,color: ThemeText.appcolor),
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.addoption);
                      if(_formkey.currentState!.validate()) {
                        // OtpscreenState.verifyPhoneNumber().whenComplete(() => Get.toNamed(AppRoutes.otpscreen));
                      }


                    },
                  ),
                ),
              ],
            ),
          ),


          body:  SingleChildScrollView(
            child: Column(

              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      height: Get.height*0.20,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color:ThemeText.basiccolor,
                        borderRadius: BorderRadius.vertical(bottom: const Radius.circular(20)),
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
                                "Options",
                                style: ThemeText.maintitle),

                            const SizedBox(height: 10),
                            Text(
                              "Fill the following details to add option to this service".tr,
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
                        borderRadius: const BorderRadius.all(Radius.circular(20.0)),

                        border: Border.all(width: 3, color: ThemeText.appcolor),
                      ),
                      child:  ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(0)),

                        child:(imageFile==null)?const Image(
                          image: AssetImage(
                            'images/icon.png',

                          ),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,): ClipRRect(
                          borderRadius: BorderRadius.all(const Radius.circular(15)),
                          child:  Image.file(
                            imageFile!,
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
                  width: 100,
                  height: 30,
                  margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {

                        return ThemeText.appcolor;
                      },
                      ),
                    ),
                    child:  Text(
                      "Upload".toUpperCase(),
                      style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400,letterSpacing: 1),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8,bottom: 15),
                          child:   Container(
                            // padding: const EdgeInsets.symmetric(
                            //     horizontal: 3.0, vertical: 3.0),

                            decoration: BoxDecoration(
                              // color:ThemeText.basiccolor, // Set your desired color here
                              borderRadius: BorderRadius.circular(15), // Set your desired border radius here
                            ),
                            child:Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                shadowColor: ThemeText.basiccolor,
                                elevation: 7,
                                child:  Padding(
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
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name",
                                              style: TextStyle(
                                                color: ThemeText.headingcolor,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
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


                                        decoration:  Common.common("Name",IconlyLight.profile),
                                      ),

                                    ],
                                  ),
                                )
                            ),),),

                        Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8,bottom: 15),
                          child:   Container(
                            // padding: const EdgeInsets.symmetric(
                            //     horizontal: 3.0, vertical: 3.0),

                            decoration: BoxDecoration(
                              // color:ThemeText.basiccolor, // Set your desired color here
                              borderRadius: BorderRadius.circular(15), // Set your desired border radius here
                            ),
                            child:Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                shadowColor: ThemeText.basiccolor,
                                elevation: 7,
                                child:  Padding(
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
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Discription",
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


                                        decoration:  Common.common("Discription",Icons.insert_comment_outlined),
                                      ),



                                    ],
                                  ),

                                )
                            ),),),



                        Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8,bottom: 15),
                          child:   Container(
                            // padding: const EdgeInsets.symmetric(
                            //     horizontal: 3.0, vertical: 3.0),

                            decoration: BoxDecoration(
                              // color:ThemeText.basiccolor, // Set your desired color here
                              borderRadius: BorderRadius.circular(15), // Set your desired border radius here
                            ),
                            child:Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                shadowColor: ThemeText.basiccolor,
                                elevation: 7,
                                child:  Padding(
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
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Option Group",
                                              style: TextStyle(
                                                color: ThemeText.headingcolor,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),

                                          ListTile(

                                            title: Text('Featured',style: ThemeText.buttontab),
                                            trailing: Checkbox(
                                              activeColor: ThemeText.appcolor,
                                              value: isChecked,
                                              onChanged: (value) {
                                                setState(() {
                                                  isChecked = value!;
                                                });
                                              },
                                            ),
                                          ),
                                          ListTile(

                                            title: Text('Enable Booking',style: ThemeText.buttontab),
                                            trailing: Checkbox(
                                              activeColor: ThemeText.appcolor,
                                              value: isChecked,
                                              onChanged: (value) {
                                                setState(() {
                                                  isChecked = value!;
                                                });
                                              },
                                            ),
                                          ),

                                        ],
                                      ),



                                    ],
                                  ),

                                )
                            ),),),
                        Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8,bottom: 15),
                          child:   Container(
                            // padding: const EdgeInsets.symmetric(
                            //     horizontal: 3.0, vertical: 3.0),

                            decoration: BoxDecoration(
                              // color:ThemeText.basiccolor, // Set your desired color here
                              borderRadius: BorderRadius.circular(15), // Set your desired border radius here
                            ),
                            child:Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                shadowColor: ThemeText.basiccolor,
                                elevation: 7,
                                child:  Padding(
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
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Price",
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


                                        decoration:  Common.common("\$ 500",Icons.money_outlined),
                                      ),

                                    ],
                                  ),

                                )
                            ),),),









                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),

        ));
  }
}
