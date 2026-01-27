import 'dart:io';

import 'package:animate_do/animate_do.dart';

import '../../Controller/Avaliability_Range_Controller/availability_range_list_controller.dart';
import '../../Controller/Basicinformationcontroller.dart';
import '../../Controller/Mail_verfication_Controller/mail_send_verification_controller.dart';
import '../../Controller/Mail_verfication_Controller/mail_verfication_controller.dart';
import '../../Controller/Provider_Controller/providerlist_Controller.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/logincontroller.dart';
import '/Controller/Image_Controller/Image_delete_Controller.dart';
import '/Controller/address_add_controller.dart';
import '/Controller/addresslistcontroller.dart';
import '/Controller/Provider_Controller/provider_insert_controller.dart';
import '/Controller/Provider_Controller/provider_tax_controller.dart';
import '/Controller/Provider_Controller/provider_type_controller.dart';
import '../commonpage/Addressmap.dart';
import '../commonpage/export.dart';
import 'package:another_stepper/another_stepper.dart';

class Serviceproviderform extends StatefulWidget {
  const Serviceproviderform({Key? key}) : super(key: key);

  @override
  State<Serviceproviderform> createState() => ServiceproviderformState();
}

class ServiceproviderformState extends State<Serviceproviderform> {
  static var selectdate = 0;

  var activeindexvalue = 0;
  static File? imageFile;
  bool isChecked = false;
  final _formkey = GlobalKey<FormState>();
  final _formkeysecond = GlobalKey<FormState>();
  TextEditingController timeinput = TextEditingController();
  Mailverficationcontroller mailverficationcontroller = Get.put(Mailverficationcontroller());
  Addresslistcontroller addresslistcontroller =Get.put(Addresslistcontroller());
  Providertypecontroller providertypecontroller =Get.put(Providertypecontroller());
  Providertaxcontroller providertaxcontroller =Get.put(Providertaxcontroller());
  Addressaddcontroller addressaddcontroller = Get.put(Addressaddcontroller());
  Availabilityrangelistcontroller availabilityrangelistcontroller = Get.put(Availabilityrangelistcontroller());
  static var network;
  @override
  void initState() {
    availabilityrangelistcontroller.availabilityrangescreen({
      "user_id": Getstore.box.read("userid"),
    }, "service_range_list");
    Get.put(Providertypecontroller()).providertypescreen("providers_type");
    Get.put(Providertaxcontroller()).providertypescreen("tax_list");

    Get.put(Addresslistcontroller()).addresslistscreen({
      "user_id": Getstore.box.read("userid"),
    }, "list_address");
    timeinput.text = "";
    super.initState();
    setState(() {
      network=0;
      Get.put(Providerinsertcontroller()).phonenumber.text=Getstore.box.read("phone");
    });
  }

  final ImagePicker imagePicker = ImagePicker();

  Future<void> selectImages() async {
    List<XFile>? images = await ImagePicker().pickMultiImage();
    setState(() {
      network=1;
      print(Get.put(Providerinsertcontroller()).imageFileList!.length);
      Get.put(Providerinsertcontroller()).imageFileList = images.map((image) => File(image.path)).toList();

    });
    selectImages1();
  }


  static Future<void> selectImages1() async {
    if(Get.put(Providerinsertcontroller()).imagedata!=[]&& network==0){
      for(var i=0;i<Get.put(Providerinsertcontroller()).imagedata.length;i++)
      {
        Get.put(Providerinsertcontroller()).data.add(
            {
              "type": "network",
              "url": Get.put(Providerinsertcontroller()).imagedata[i],
            }
        );
      }
    }
    if(Get.put(Providerinsertcontroller()).imageFileList!=[]) {
      for (var i = 0; i < Get.put(Providerinsertcontroller()).imageFileList!.length; i++) {
        Get.put(Providerinsertcontroller()).data.add(
            {
              "type": "fileimage",
              "url": Get.put(Providerinsertcontroller()).imageFileList![i]
            }
        );
      }
    }
  }
  bool loaderimage = false;
  loaderimagedata(){
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        loaderimage=false;

      });

    });
  }

  bool addressValidation=true;
  bool imageValidation=true;
  bool serviceAvailabilityValidation=true;
  bool providertypeValidation=true;
  bool taxesValidation=true;


  bool mainAddress=true;
  bool timeperiodvalidation=true;






  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.step1.toString()),
      iconWidget: Card(
        color: ThemeText.appcolor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            "1",
            style: ThemeText.content,
          ),
        ),
      ),
    ),
    StepperData(
      title: StepperText(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.step2.toString()),
      iconWidget: Card(
        color: ThemeText.appcolor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            "2",
            style: ThemeText.content,
          ),
        ),
      ),
    ),
    StepperData(
      title: StepperText(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.step3.toString()),
      iconWidget: Card(
        color: ThemeText.appcolor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            "3",
            style: ThemeText.content,
          ),
        ),
      ),
    ),
  ];
  void toggleCheckbox(String value) {
    setState(() {
      if ( Get.put(Providerinsertcontroller()).selectedValues.contains(value)) {
        Get.put(Providerinsertcontroller()).selectedValues.remove(value);
        print( Get.put(Providerinsertcontroller()).selectedValues);
      } else {
        Get.put(Providerinsertcontroller()).selectedValues.add(value);
        print( Get.put(Providerinsertcontroller()).selectedValues);
      }
    });
  }
  void toggleCheckbox1(String value) {
    setState(() {
      if ( Get.put(Providerinsertcontroller()).taxs.contains(value)) {
        Get.put(Providerinsertcontroller()).taxs.remove(value);
        print(Get.put(Providerinsertcontroller()).taxs);
      } else {
        Get.put(Providerinsertcontroller()).taxs.add(value);
        print( Get.put(Providerinsertcontroller()).taxs);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() {
          return (Get.put(Providerinsertcontroller()).providerinsertresponseStatus.isFalse&&Get.put(Providerinsertcontroller()).providerupdateesponseStatus.isFalse && mailverficationcontroller.mailverficationStatus.isFalse && Get.put(Mailsendcontroller()).mailsendStatus.isFalse)?(mailverficationcontroller.maildata.value.data==1)?Scaffold(

            appBar: AppBar(
              backgroundColor: ThemeText.basiccolor,
              elevation: 0,
              automaticallyImplyLeading: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(0),
                ),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  if(Get.put(BasicinformationController()).providerstatus!="1"){

                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (activeindexvalue == 1) {
                            activeindexvalue = 0;
                            print(activeindexvalue);

                          } else if (activeindexvalue == 2) {
                            activeindexvalue = 1;
                          } else {
                            Get.back();
                          }
                        });
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 25,
                      ),
                    );
                  }

                  else
                  {
                    if(activeindexvalue!=0){
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (activeindexvalue == 1) {
                              activeindexvalue = 0;
                              print(activeindexvalue);

                            } else if (activeindexvalue == 2) {
                              activeindexvalue = 1;
                            } else {
                              Get.back();
                            }
                          });
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 25,
                        ),
                      );
                    }else {
                      return const SizedBox();
                    }
                  }
                },
              ),
              centerTitle: true,
              title: Text(
                Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.title.toString(),
                style: ThemeText.title1,
              ),
            ),

            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: (activeindexvalue == 0)
                ? Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FloatingActionButton(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  ),
                  // isExtended: true,
                  backgroundColor: ThemeText.appcolor,
                  onPressed: () {
                    addressaddcontroller.status="1";
                    addressaddcontroller.id="";
                    addressaddcontroller.update();
                    Get.toNamed(AppRoutes.addressmap);
                  },
                  // isExtended: true,
                  child: const Icon(Icons.add),
                ))
                : const Text(""),
            bottomSheet: Container(
              height: Get.height * 0.17,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xffE1E1E1),
              margin: EdgeInsets.zero,
              child: Card(
                elevation: 10,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                ),
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: Get.width * 0.9,
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            primary: ThemeText.appcolor, // Adjust the elevation as needed
                          ),
                          child:(activeindexvalue==2)? Text(
                            Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.saveButton.toString().toUpperCase(),
                            style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ):Text(
                            Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.buttonText.toString().toUpperCase(),
                            style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                          onPressed: () {
                            setState(() {
                              // Get.toNamed(AppRoutes.home);

                              if (activeindexvalue == 1) {
                                if (_formkeysecond.currentState!.validate() /*&& Get.put(Providerinsertcontroller()).data.isNotEmpty*/ && Get.put(Providerinsertcontroller()).providertype!=null) {
                                  setState(() {

                                    activeindexvalue = 2;
                                    /* if ( Get.put(Providerinsertcontroller()).data.isNotEmpty&&Get.put(Providerinsertcontroller()).providertype!=null&&Get.put(Providerinsertcontroller()).taxs!=null) {

                                } else {
                                  snack1("Provider", "Select the values",
                                      Colors.red);
                                }*/
                                  });
                                }else{
                                  // if(Get.put(Providerinsertcontroller()).data.isNotEmpty){
                                  //   setState(() {
                                  //     imageValidation=true;
                                  //   });
                                  // }else{
                                  //   setState(() {
                                  //     imageValidation=false;
                                  //   });
                                  // }

                                  if(Get.put(Providerinsertcontroller()).providertype!=null){
                                    setState(() {
                                      providertypeValidation=true;
                                    });
                                  }else{
                                    setState(() {

                                      providertypeValidation=false;

                                    });
                                  }
                                  // if(Get.put(Providerinsertcontroller()).selectedrange.isNotEmpty){
                                  //   setState(() {
                                  //     serviceAvailabilityValidation=true;
                                  //   });
                                  // }else{
                                  //   setState(() {
                                  //     serviceAvailabilityValidation=false;
                                  //   });
                                  // }
                                  if(Get.put(Providerinsertcontroller()).taxs!=null){
                                    setState(() {
                                      taxesValidation=true;
                                    });
                                  }else {
                                    setState(() {
                                      taxesValidation=false;
                                    });
                                  }



                                }
                              } else if (activeindexvalue == 0) {
                                setState(() {
                                  if ( Get.put(Providerinsertcontroller()).selectedValues.isNotEmpty) {
                                    activeindexvalue = 1;
                                    print(activeindexvalue);

                                    setState(() {
                                      mainAddress=true;
                                    });

                                  } else {

                                    setState(() {
                                      mainAddress=false;
                                    });

                                  }
                                });

                                // Get.toNamed(AppRoutes.home);
                              } else {
                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0) {
                                  if ((Get
                                      .put(Providerinsertcontroller())
                                      .sundaydata || Get
                                      .put(Providerinsertcontroller())
                                      .mondaydata || Get
                                      .put(Providerinsertcontroller())
                                      .tuesdaydata || Get
                                      .put(Providerinsertcontroller())
                                      .wednesdaydata || Get
                                      .put(Providerinsertcontroller())
                                      .thursdaydata
                                      || Get
                                          .put(Providerinsertcontroller())
                                          .fridaydata || Get
                                      .put(Providerinsertcontroller())
                                      .saturdaydata == true)) {

                                    print(Get
                                        .put(Providerinsertcontroller())
                                        .monday_start);
                                    if(Get
                                        .put(Providerinsertcontroller())
                                        .monday_start.text.isNotEmpty  || Get
                                        .put(Providerinsertcontroller())
                                        .tuesday_start.text.isNotEmpty || Get
                                        .put(Providerinsertcontroller())
                                        .wednesday_start.text.isNotEmpty || Get
                                        .put(Providerinsertcontroller())
                                        .thursday_start.text.isNotEmpty || Get
                                        .put(Providerinsertcontroller())
                                        .friday_start.text.isNotEmpty || Get
                                        .put(Providerinsertcontroller())
                                        .saturday_start.text.isNotEmpty || Get
                                        .put(Providerinsertcontroller())
                                        .sunday_start.text.isNotEmpty) {
                                      Get.put(Providerinsertcontroller())
                                          .providerinsertscreen()
                                          .whenComplete(() {

                                        setState(() {
                                          timeperiodvalidation=true;
                                        });
                                        if (Get
                                            .put(BasicinformationController())
                                            .providerstatus != "1") {
                                          // Get.offUntil(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             Myprovider()),
                                          //         (route) =>
                                          //     route.settings.name ==
                                          //         '/myproviders');
                                          Get.back();
                                        } else {
                                          Get.offNamed(AppRoutes.home);
                                        }
                                      });
                                    }else {
                                      setState(() {
                                        timeperiodvalidation=false;
                                      });
                                    }


                                  }
                                  else{
                                    // print("hai");
                                    setState(() {
                                      timeperiodvalidation=false;
                                    });
                                  }
                                }else{

                                  Get.put(Providerinsertcontroller()).providerinsertscreen().whenComplete(() {
                                    Get.put(Providerlistcontroller()) .providerlistscreen({
                                      "search": "",
                                      "user_id": Getstore.box.read("userid"),
                                    }, "providers_list");
                                    if( Get.put(BasicinformationController()).providerstatus!="1")
                                    {
                                      // Get.offUntil(
                                      //     MaterialPageRoute(builder: (context) => Myprovider()),
                                      //         (route) => route.settings.name == '/myproviders');
                                      Get.back();
                                    }else{
                                      Get.offNamed(AppRoutes.home);
                                    }
                                  });
                                }
                              }
                            });

                            // if (_formkey.currentState!.validate()) {
                            //   // OtpscreenState.verifyPhoneNumber().whenComplete(() => Get.toNamed(AppRoutes.otpscreen));
                            // }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        // height: Get.height*0.18,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: ThemeText.basiccolor,
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: ThemeText.basiccolor.withOpacity(1),
                                blurRadius: 10,
                                offset: const Offset(0, 50)),
                          ],
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              AnotherStepper(
                                stepperList: stepperData,
                                stepperDirection: Axis.horizontal,
                                iconWidth: 40,
                                iconHeight: 40,
                                activeBarColor: ThemeText.appcolor,
                                inActiveBarColor: Colors.grey,
                                inverted: true,
                                verticalGap: 30,
                                activeIndex: activeindexvalue,
                                barThickness: 3,
                              ),
                              const SizedBox(height: 20),
                              // Text("Fill the following credentials to login your account", style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.primaryColor))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  if (activeindexvalue == 0)
                    (addresslistcontroller.addresslistresponseStatus.isFalse)
                        ?FadeInUp(
                      duration:const Duration(seconds:1),
                      child:SizedBox(
                        height: Get.height * 0.5,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Form(
                              key: _formkey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 0, bottom: 15),
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
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            //set border radius more than 50% of height and width to make circle
                                          ),
                                          shadowColor: ThemeText.basiccolor,
                                          elevation: 7,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 0.0,
                                                      horizontal: 10.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children:  [
                                                      Text(
                                                        Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.selectAddress.toString(),
                                                        style: TextStyle(
                                                          color:
                                                          ThemeText.headingcolor,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                if (addresslistcontroller
                                                    .addresslistdata
                                                    .value
                                                    .data!
                                                    .isNotEmpty)
                                                  Column(
                                                    children:
                                                    addresslistcontroller
                                                        .addresslistdata
                                                        .value
                                                        .data!
                                                        .map((dynamic
                                                    option) {

                                                      return CheckboxListTile(
                                                        controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                        activeColor:
                                                        ThemeText.appcolor,
                                                        visualDensity:
                                                        const VisualDensity(
                                                            horizontal:
                                                            -2.0,
                                                            vertical: 0.0),
                                                        side:
                                                        MaterialStateBorderSide
                                                            .resolveWith(
                                                              (Set<MaterialState>
                                                          states) {
                                                            if (states.contains(
                                                                MaterialState
                                                                    .selected)) {
                                                              return BorderSide(
                                                                  color: ThemeText
                                                                      .appcolor,
                                                                  width: 2);
                                                            }
                                                            return BorderSide(
                                                              color: ThemeText
                                                                  .appcolor,
                                                              width: 2,
                                                            );
                                                          },
                                                        ),
                                                        title: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .end,
                                                          children: [
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.45,
                                                              child: Text(
                                                                option
                                                                    .adAddresses,
                                                                style: ThemeText
                                                                    .bodydata,
                                                              ),
                                                            ),
                                                            IconButton(
                                                              icon: const Icon(
                                                                IconlyLight
                                                                    .edit,
                                                                color: Color(
                                                                    0xff3F90BF),
                                                                size: 20,
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  addressaddcontroller.status="0";
                                                                  addressaddcontroller.latitude=option.adLatitude;
                                                                  addressaddcontroller.id=option.adId;
                                                                  addressaddcontroller.logitude=option.adLongitude;
                                                                  MaplocationState.address=option.adAddresses;
                                                                  addressaddcontroller.discController.text=option.adDescription;

                                                                });
                                                                Get.toNamed(AppRoutes.addressmap);
                                                              },
                                                            ),
                                                            IconButton(
                                                              icon: const Icon(
                                                                  IconlyLight
                                                                      .delete,
                                                                  color: Color(
                                                                      0xffF35339),
                                                                  size: 20),
                                                              onPressed: () {
                                                                if(Get.put(Providerinsertcontroller()).selectedValues
                                                                    .contains(
                                                                    option.adId)){
                                                                  toggleCheckbox(option.adId);
                                                                }

                                                                popupaddressdelete(option.adId);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        value:  Get.put(Providerinsertcontroller()).selectedValues
                                                            .contains(
                                                            option.adId),
                                                        onChanged:
                                                            (bool? value) {
                                                          toggleCheckbox(
                                                              option.adId);
                                                        },
                                                      );
                                                    }).toList(),
                                                  )
                                                else
                                                  Card(
                                                      elevation: 4.0,
                                                      shape:
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(15.0),
                                                      ),
                                                      child: Container(
                                                        width: Get.width * 1,
                                                        height:
                                                        Get.height * 0.1,
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(10),
                                                          color: ThemeText
                                                              .basiccolor,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: ThemeText
                                                                    .basiccolor,
                                                                spreadRadius:
                                                                3),
                                                          ],
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "No Data Found",
                                                            style: ThemeText
                                                                .heading1,
                                                          ),
                                                        ),
                                                      )),

                                                if(mainAddress==false)

                                                  const Padding(
                                                      padding:EdgeInsets.only(left:8),
                                                      child:Text("Select the Address",style: TextStyle(color:Colors.red,fontSize: 12),)
                                                  )
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                        : Center(
                      child: LoadingAnimationWidget.twistingDots(
                        leftDotColor: ThemeText.appcolor,
                        rightDotColor: ThemeText.basiccolor,
                        size: 70,
                      ),
                    ),
                  if (activeindexvalue == 1)
                    if (providertypecontroller.providertyperesponseStatus.isFalse &&
                        providertaxcontroller.providertaxresponseStatus.isFalse)
                      FadeInUp(
                          duration:const Duration(seconds:1),
                          child:  Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Form(
                                key: _formkeysecond,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, bottom: 15),
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
                                                padding: const EdgeInsets.all(15.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 15.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                           Text(
                                                             Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.images.toString(),
                                                            style: TextStyle(
                                                              color: ThemeText.headingcolor,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  selectImages();
                                                                },
                                                                child: Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 10,
                                                                      left: 10),
                                                                  child: Container(
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          5),
                                                                      color: ThemeText
                                                                          .appcolor,
                                                                    ),
                                                                    child: Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                          15.0,
                                                                          vertical:
                                                                          5.0),
                                                                      child: Text(
                                                                        "Upload",
                                                                        style: ThemeText
                                                                            .content1,
                                                                        textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),

                                                    if(loaderimage==false)
                                                      ClipRRect(
                                                        borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(5)),
                                                        child: ( Get.put(Providerinsertcontroller()).data.isEmpty)

                                                            ? Column(
                                                            children: [
                                                             InkWell(
                                                               onTap:(){
                                                                 selectImages();
                                                               },
                                                               child:  const Image(
                                                                 image: NetworkImage(
                                                                     "https://w7.pngwing.com/pngs/602/266/png-transparent-add-image-icon.png"),
                                                                 fit: BoxFit.cover,
                                                                 width: 100,
                                                                 height: 100,
                                                               ),
                                                             ),
                                                              const SizedBox(height:10),
                                                              if(imageValidation==false)
                                                                const Padding(
                                                                    padding:EdgeInsets.only(left:6),
                                                                    child:Text("Image is Required",style: TextStyle(color:Colors.red,fontSize: 12),)
                                                                )
                                                            ]
                                                        )
                                                            : SizedBox(
                                                          height: 100,
                                                          child: ClipRRect(
                                                            borderRadius: const BorderRadius
                                                                .all(Radius
                                                                .circular(5)),
                                                            child: ListView.builder(
                                                                scrollDirection:
                                                                Axis.horizontal,
                                                                itemCount:
                                                                Get.put(Providerinsertcontroller()).data!.length,
                                                                itemBuilder:
                                                                    (BuildContext
                                                                context,
                                                                    int index) {
                                                                  if(Get.put(Providerinsertcontroller()).data![index]["type"]=="network") {
                                                                    return  Padding(
                                                                        padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            5.0),
                                                                        child: ClipRRect(
                                                                            borderRadius: const BorderRadius.all( Radius.circular(5)),
                                                                            child: SizedBox(
                                                                                width:
                                                                                100,
                                                                                child: Stack(
                                                                                    children:[


                                                                                      ImageFade(
                                                                                        width: 100,
                                                                                        height: 100,
                                                                                        // whenever the image changes, it will be loaded, and then faded in:
                                                                                        image:
                                                                                        NetworkImage( Get.put(Providerinsertcontroller()).image_path+Get.put(Providerinsertcontroller()).data![index]["url"]),



                                                                                        // slow-ish fade for loaded images:
                                                                                        duration:
                                                                                        const Duration(
                                                                                            milliseconds:
                                                                                            900),

                                                                                        // if the image is loaded synchronously (ex. from memory), fade in faster:
                                                                                        syncDuration:
                                                                                        const Duration(
                                                                                            milliseconds:
                                                                                            150),

                                                                                        // supports most properties of Image:
                                                                                        alignment:
                                                                                        Alignment.center,
                                                                                        fit: BoxFit.cover,
                                                                                        scale: 2,
                                                                                        loadingBuilder: (context,
                                                                                            progress,
                                                                                            chunkEvent) =>
                                                                                            Center(
                                                                                              child:
                                                                                              LoadingAnimationWidget
                                                                                                  .twistingDots(
                                                                                                leftDotColor:
                                                                                                ThemeText
                                                                                                    .appcolor,
                                                                                                rightDotColor:
                                                                                                ThemeText
                                                                                                    .basiccolor,
                                                                                                size: 30,
                                                                                              ),

                                                                                            ),
                                                                                        errorBuilder:
                                                                                            (context, error) =>
                                                                                            Center(
                                                                                              child:
                                                                                              LoadingAnimationWidget
                                                                                                  .twistingDots(
                                                                                                leftDotColor:
                                                                                                ThemeText
                                                                                                    .appcolor,
                                                                                                rightDotColor:
                                                                                                ThemeText
                                                                                                    .basiccolor,
                                                                                                size: 30,
                                                                                              ),
                                                                                            ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: Alignment.topRight,
                                                                                        child: Padding(
                                                                                            padding: const EdgeInsets
                                                                                                .only(top: 2,
                                                                                                right: 2),
                                                                                            child: InkWell(
                                                                                              onTap:(){
                                                                                                /* Get.put(Providerinsertcontroller()).imagedata!.removeAt(index);*/
                                                                                                print(Get.put(Providerinsertcontroller()).data.length.toString());



                                                                                                Get.put(ImagedeleteController()).imagedelete(
                                                                                                    {
                                                                                                      "image_name":Get.put(Providerinsertcontroller()).data![index]["url"],
                                                                                                      "id":Get.put(Providerinsertcontroller()).provider_id.toString(),
                                                                                                    },"delete_providers_image"
                                                                                                );
                                                                                                setState(() {

                                                                                                  loaderimage=true;
                                                                                                  Get.put(Providerinsertcontroller()).data.removeAt(index);

                                                                                                });
                                                                                                loaderimagedata();

                                                                                              },
                                                                                              child: Container(
                                                                                                  alignment: Alignment.center,
                                                                                                  width:25,
                                                                                                  height:25,

                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(5),
                                                                                                    color: const Color(0xffFAD8D2),
                                                                                                  ),
                                                                                                  child: Icon(IconlyLight.delete,size: 15,color:ThemeText.deleteicon)
                                                                                              ),
                                                                                            )
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                )
                                                                              // child:Text(Get.put(Providerinsertcontroller()).image_path+Get.put(Providerinsertcontroller()).imagedata![index]),
                                                                            )));
                                                                  }else{
                                                                    return Padding(
                                                                        padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            5.0),
                                                                        child: ClipRRect(
                                                                          borderRadius: const BorderRadius.all( Radius.circular(5)),
                                                                          child: SizedBox(
                                                                              width: 100,
                                                                              child: Stack(
                                                                                  children:[

                                                                                    Image.file(
                                                                                      File( Get.put(Providerinsertcontroller()).data![index]["url"].path),
                                                                                      fit: BoxFit
                                                                                          .cover,
                                                                                      width: 100,
                                                                                      height:100 ,
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: Alignment.topRight,
                                                                                      child: Padding(
                                                                                          padding: const EdgeInsets
                                                                                              .only(top: 2,
                                                                                              right: 2),
                                                                                          child: InkWell(
                                                                                            onTap:(){
                                                                                              setState(() {
                                                                                                loaderimage=true;
                                                                                              });
                                                                                              /* Get.put(Providerinsertcontroller()).imagedata!.removeAt(index);*/
                                                                                              Get.put(Providerinsertcontroller()).imageFileList!.remove(Get.put(Providerinsertcontroller()).data![index]["url"]);
                                                                                              Get.put(Providerinsertcontroller()).data.removeAt(index);


                                                                                              loaderimagedata();


                                                                                              // Get.put(ImagedeleteController()).imagedelete(
                                                                                              //     {
                                                                                              //       "image_name":Get.put(Providerinsertcontroller()).imagedata![index],
                                                                                              //       "id":Get.put(Providerinsertcontroller()).provider_id.toString(),
                                                                                              //     },"delete_providers_image"
                                                                                              // );
                                                                                            },
                                                                                            child: Container(
                                                                                                alignment: Alignment.center,
                                                                                                width:25,
                                                                                                height:25,

                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                                  color: const Color(0xffFAD8D2),
                                                                                                ),
                                                                                                child: Icon(IconlyLight.delete,size: 15,color:ThemeText.deleteicon)
                                                                                            ),
                                                                                          )
                                                                                      ),
                                                                                    ),
                                                                                  ]
                                                                              )

                                                                          ),));




                                                                  }
                                                                }),
                                                          ),
                                                        ),
                                                      )
                                                    else
                                                      Center(
                                                        child: LoadingAnimationWidget.twistingDots(
                                                          leftDotColor: ThemeText.appcolor,
                                                          rightDotColor: ThemeText.basiccolor,
                                                          size: 50,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, bottom: 15),
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
                                                padding: const EdgeInsets.all(15.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 15.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children:  [
                                                           Text(
                                                             Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.providerName.toString(),
                                                            style:  TextStyle(
                                                              color: ThemeText.headingcolor,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    TextFormField(
                                                      controller: Get.put(Providerinsertcontroller()).name,
                                                      autocorrect: true,
                                                      keyboardType:
                                                      TextInputType.emailAddress,
                                                      validator: (value) {
                                                        // Check if this field is empty
                                                        if (value == null ||
                                                            value.isEmpty) {
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
                                                      decoration: Common.common(
                                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.providerName.toString(), IconlyLight.profile),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, bottom: 15),
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
                                                padding: const EdgeInsets.all(15.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 15.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children:  [
                                                          Text(
                                                            Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.description.toString(),
                                                            style: TextStyle(
                                                              color: ThemeText.headingcolor,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    TextFormField(
                                                      controller: Get.put(Providerinsertcontroller()).disc,
                                                      autocorrect: true,
                                                      keyboardType:
                                                      TextInputType.emailAddress,
                                                      validator: (value) {
                                                        // Check if this field is empty
                                                        if (value == null ||
                                                            value.isEmpty) {
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
                                                      decoration: Common.common(
                                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.description.toString(),
                                                          Icons.menu_book),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, bottom: 15),
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
                                                padding: const EdgeInsets.all(15.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 15.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children:  [
                                                          Text(
                                                            Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.phoneNumber.toString(),
                                                            style: TextStyle(
                                                              color: ThemeText.headingcolor,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    TextFormField(
                                                      controller: Get.put(Providerinsertcontroller()).phonenumber,
                                                      autocorrect: true,
                                                      keyboardType:
                                                      TextInputType.phone,
                                                      validator: (value) {
                                                        // Check if this field is empty
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'This field is required';
                                                        }else if(value.length>10){
                                                          return 'Enter valid ${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.phoneNumber.toString()}';
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
                                                      decoration: Common.common(
                                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.phoneNumber.toString(),
                                                          IconlyLight.call),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, bottom: 15),
                                        child: Container(
                                          // padding: const EdgeInsets.symmetric(
                                          //     horizontal: 3.0, vertical: 3.0),
                                          decoration: BoxDecoration(
                                            // color:ThemeText.basiccolor, // Set your desired color here
                                            borderRadius: BorderRadius.circular(5), // Set your desired border radius here
                                          ),
                                          child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                //set border radius more than 50% of height and width to make circle
                                              ),
                                              shadowColor: ThemeText.basiccolor,
                                              elevation: 7,
                                              child: Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 15.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children:  [
                                                          Text(
                                                            Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.alternativeNumber.toString(),
                                                            style: TextStyle(
                                                              color: ThemeText.headingcolor,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    TextFormField(

                                                      controller: Get.put(Providerinsertcontroller()).alterphonenumber,
                                                      autocorrect: true,
                                                      keyboardType:
                                                      TextInputType.phone,

                                                      style: const TextStyle(
                                                          color: Color(0xffADA4A5),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400),
                                                      cursorColor: ThemeText.appcolor,
                                                      decoration: Common.common(
                                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.alternativeNumber.toString(),
                                                          IconlyLight.call),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                  /*    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, bottom: 15),
                                        child: Container(
                                          // padding: const EdgeInsets.symmetric(
                                          //     horizontal: 3.0, vertical: 3.0),
                                          decoration: BoxDecoration(
                                            // color:ThemeText.basiccolor, // Set your desired color here
                                            borderRadius: BorderRadius.circular(5), // Set your desired border radius here
                                          ),
                                          child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                //set border radius more than 50% of height and width to make circle
                                              ),
                                              shadowColor: ThemeText.basiccolor,
                                              elevation: 7,
                                              child: Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 15.0),
                                                      child:Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            "Service Availability Range",
                                                            style: TextStyle(
                                                              color: ThemeText.headingcolor,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                            ),
                                                          ),

                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.toNamed(AppRoutes.availability_range);

                                                                },
                                                                child: Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 10,
                                                                      left: 10),
                                                                  child: Container(
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          5),
                                                                      color: ThemeText
                                                                          .appcolor,
                                                                    ),
                                                                    child: Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                          15.0,
                                                                          vertical:
                                                                          5.0),
                                                                      child: Text(
                                                                        "Select",
                                                                        style: ThemeText
                                                                            .content1,
                                                                        textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    if(availabilityrangelistcontroller.availabilityrangelistStatus.isFalse)



                                                      Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          children:[
                                                            SizedBox(height:10),
                                                            if(availabilityrangelistcontroller.availabilityrangelistdata.value.status!=false)
                                                              Column(
                                                                children:
                                                                availabilityrangelistcontroller.availabilityrangelistdata.value.data!
                                                                    .map((dynamic
                                                                option) {

                                                                  return CheckboxListTile(
                                                                    controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .leading,
                                                                    activeColor:
                                                                    ThemeText.appcolor,
                                                                    visualDensity:
                                                                    const VisualDensity(
                                                                        horizontal:
                                                                        -2.0,
                                                                        vertical: 0.0),
                                                                    side:
                                                                    MaterialStateBorderSide
                                                                        .resolveWith(
                                                                          (Set<MaterialState>
                                                                      states) {
                                                                        if (states.contains(
                                                                            MaterialState
                                                                                .selected)) {
                                                                          return BorderSide(
                                                                              color: ThemeText
                                                                                  .appcolor,
                                                                              width: 2);
                                                                        }
                                                                        return BorderSide(
                                                                          color: ThemeText
                                                                              .appcolor,
                                                                          width: 2,
                                                                        );
                                                                      },
                                                                    ),
                                                                    title:Text(
                                                                      option.serviceRange,
                                                                      style:  ThemeText.buttontab,
                                                                    ),
                                                                    value:  Get.put(Providerinsertcontroller()).selectedrange
                                                                        .contains(
                                                                        option.serviceRangeId),
                                                                    onChanged:
                                                                        (bool? value) {
                                                                      toggleCheckbox1(
                                                                          option.serviceRangeId);
                                                                    },
                                                                  );
                                                                }).toList(),
                                                              )
                                                            else
                                                              Card(
                                                                  elevation: 4.0,
                                                                  shape:
                                                                  RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(5.0),
                                                                  ),
                                                                  child: Container(
                                                                    width: Get.width * 1,
                                                                    height:
                                                                    Get.height * 0.05,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(5),
                                                                      color: ThemeText
                                                                          .basiccolor,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                            color: ThemeText
                                                                                .basiccolor,
                                                                            spreadRadius:
                                                                            3),
                                                                      ],
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        availabilityrangelistcontroller.availabilityrangelistdata.value.msg.toString(),
                                                                        style: ThemeText
                                                                            .heading1,
                                                                      ),
                                                                    ),
                                                                  )),
                                                            SizedBox(
                                                              height:10,
                                                            ),
                                                            if(serviceAvailabilityValidation==false)
                                                              Padding(
                                                                  padding:EdgeInsets.only(left:8),
                                                                  child:Text("Service Availability is Required",style: TextStyle(color:Colors.red,fontSize: 12),)
                                                              )
                                                          ]
                                                      )


                                                    else
                                                      Center(
                                                        child: LoadingAnimationWidget.twistingDots(
                                                          leftDotColor: ThemeText.appcolor,
                                                          rightDotColor: ThemeText.basiccolor,
                                                          size: 40,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),*/
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, bottom: 15),
                                        child: Container(
                                          // padding: const EdgeInsets.symmetric(
                                          //     horizontal: 3.0, vertical: 3.0),

                                          decoration: BoxDecoration(
                                            // color:ThemeText.basiccolor, // Set your desired color here
                                            borderRadius: BorderRadius.circular(5), // Set your desired border radius here
                                          ),
                                          child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                //set border radius more than 50% of height and width to make circle
                                              ),
                                              shadowColor: ThemeText.basiccolor,
                                              elevation: 7,
                                              child: Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 15.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children:  [
                                                          Text(
                                                            Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.providerType.toString(),
                                                            style: TextStyle(
                                                              color: ThemeText.headingcolor,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),


                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        for (var i = 0;
                                                        i <
                                                            providertypecontroller
                                                                .providertypedata
                                                                .value
                                                                .data!
                                                                .length;
                                                        i++)
                                                          RadioListTile(
                                                            activeColor:
                                                            ThemeText.appcolor,
                                                            title: Text(
                                                              providertypecontroller
                                                                  .providertypedata
                                                                  .value
                                                                  .data![i]
                                                                  .providertypeName.toString(),
                                                              style:
                                                              ThemeText.buttontab,
                                                              textAlign:
                                                              TextAlign.start,
                                                            ),
                                                            value:
                                                            providertypecontroller
                                                                .providertypedata
                                                                .value
                                                                .data![i]
                                                                .typeId,
                                                            groupValue: Get.put(Providerinsertcontroller()).providertype,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                Get.put(Providerinsertcontroller()).providertype =
                                                                    value.toString();
                                                              });
                                                            },
                                                          ),
                                                        const SizedBox(
                                                          height:10,
                                                        ),
                                                        if(providertypeValidation==false)
                                                          Padding(
                                                              padding:const EdgeInsets.only(left:8),
                                                              child:Text("${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.providerName.toString()} is Required",style: TextStyle(color:Colors.red,fontSize: 12),textAlign: TextAlign.start,)
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, bottom: 15),
                                        child: Container(
                                          // padding: const EdgeInsets.symmetric(
                                          //     horizontal: 3.0, vertical: 3.0),

                                          decoration: BoxDecoration(
                                            // color:ThemeText.basiccolor, // Set your desired color here
                                            borderRadius: BorderRadius.circular(5), // Set your desired border radius here
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
                                                      padding:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 15.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children:  [
                                                          Text(
                                                            Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.taxes.toString(),
                                                            style: TextStyle(
                                                              color: ThemeText.headingcolor,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    Column(
                                                      children:
                                                      providertaxcontroller
                                                          .providertaxdata
                                                          .value
                                                          .data!
                                                          .map((dynamic
                                                      option) {

                                                        return CheckboxListTile(
                                                          controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                          activeColor:
                                                          ThemeText.appcolor,
                                                          visualDensity:
                                                          const VisualDensity(
                                                              horizontal:
                                                              -2.0,
                                                              vertical: 0.0),
                                                          side:
                                                          MaterialStateBorderSide
                                                              .resolveWith(
                                                                (Set<MaterialState>
                                                            states) {
                                                              if (states.contains(
                                                                  MaterialState
                                                                      .selected)) {
                                                                return BorderSide(
                                                                    color: ThemeText
                                                                        .appcolor,
                                                                    width: 2);
                                                              }
                                                              return BorderSide(
                                                                color: ThemeText
                                                                    .appcolor,
                                                                width: 2,
                                                              );
                                                            },
                                                          ),
                                                          title:Text(

                                                            option.taxesName,
                                                            style:  ThemeText.buttontab,
                                                          ),
                                                          value:  Get.put(Providerinsertcontroller()).taxs
                                                              .contains(
                                                              option.taxesId),
                                                          onChanged:
                                                              (bool? value) {
                                                            toggleCheckbox1(
                                                                option.taxesId);
                                                          },
                                                        );
                                                      }).toList(),
                                                    ),
                                                    // if(taxesValidation==false)
                                                    //   const Padding(
                                                    //       padding:const EdgeInsets.only(left:11),
                                                    //       child:const Text("Taxes is Required",style: const TextStyle(color:Colors.red,fontSize: 12),)
                                                    //   ),

                                                    // Column(
                                                    //   crossAxisAlignment:
                                                    //   CrossAxisAlignment.start,
                                                    //   children: [
                                                    //     const SizedBox(
                                                    //       height: 10,
                                                    //     ),
                                                    //     for (var i = 0;
                                                    //     i <
                                                    //         providertaxcontroller
                                                    //             .providertaxdata
                                                    //             .value
                                                    //             .data!
                                                    //             .length;
                                                    //     i++)
                                                    //       RadioListTile(
                                                    //         activeColor:
                                                    //         ThemeText.appcolor,
                                                    //         title: Text(
                                                    //           providertaxcontroller
                                                    //               .providertaxdata
                                                    //               .value
                                                    //               .data![i]
                                                    //               .taxesName,
                                                    //           style:
                                                    //           ThemeText.buttontab,
                                                    //           textAlign:
                                                    //           TextAlign.start,
                                                    //         ),
                                                    //         value: providertaxcontroller
                                                    //             .providertaxdata
                                                    //             .value
                                                    //             .data![i]
                                                    //             .taxesId,
                                                    //         groupValue: Get.put(Providerinsertcontroller()).taxs,
                                                    //         onChanged: (value) {
                                                    //           setState(() {
                                                    //             Get.put(Providerinsertcontroller()).taxs = value.toString();
                                                    //           });
                                                    //         },
                                                    //       ),
                                                    //     const SizedBox(
                                                    //       height:10,
                                                    //     ),
                                                    //
                                                    //   ],
                                                    // ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                      const SizedBox(height: 200)
                                    ],
                                  ),
                                )),
                          )
                      )
                    else
                      Center(
                        child: LoadingAnimationWidget.twistingDots(
                          leftDotColor: ThemeText.appcolor,
                          rightDotColor: ThemeText.basiccolor,
                          size: 70,
                        ),
                      ),
                  if (activeindexvalue == 2)
                    FadeInUp(
                      duration:const Duration(seconds:1),
                      child:   Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                            key: _formkey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 15),
                                    child: Container(
                                      // padding: const EdgeInsets.symmetric(
                                      //     horizontal: 3.0, vertical: 3.0),

                                      decoration: BoxDecoration(
                                        // color:ThemeText.basiccolor, // Set your desired color here
                                        borderRadius: BorderRadius.circular(5), // Set your desired border radius here
                                      ),
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            //set border radius more than 50% of height and width to make circle
                                          ),
                                          shadowColor: ThemeText.basiccolor,
                                          elevation: 7,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children:  [
                                                       Text(
                                                         Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.timePeriod.toString(),
                                                        style: TextStyle(
                                                          color: ThemeText.headingcolor,
                                                          fontSize: 16.0,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      Transform.scale(
                                                          scale: 1,
                                                          child: Switch(
                                                            onChanged: (value) {
                                                              if (Get.put(Providerinsertcontroller()).checkallday == true) {
                                                                setState(() {
                                                                  print(Get.put(Providerinsertcontroller()).checkallday);
                                                                  Get.put(Providerinsertcontroller()).checkallday =false;
                                                                  Get.put(Providerinsertcontroller()).checkalldayinsert=0;
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  Get.put(Providerinsertcontroller()).checkalldayinsert=1;
                                                                  Get.put(Providerinsertcontroller()).checkallday = true;
                                                                  Get.put(Providerinsertcontroller()).update();
                                                                  print(Get.put(Providerinsertcontroller()).checkallday);
                                                                });
                                                              }
                                                            },
                                                            value: Get.put(Providerinsertcontroller()). checkallday,
                                                            activeColor:
                                                            ThemeText.basiccolor,
                                                            activeTrackColor:
                                                            ThemeText.appcolor,
                                                            inactiveThumbColor:
                                                            ThemeText.appcolor,
                                                            inactiveTrackColor:
                                                            ThemeText.basiccolor,
                                                          )),

                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0)
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Mon",
                                                          style: ThemeText.buttontab,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .monday_start,
                                                              readOnly: true,
                                                              onTap: () {
                                                                if ( Get.put(Providerinsertcontroller()).mondaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 1;
                                                                  });

                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor:ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "Start time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              readOnly: true,
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .monday_end,
                                                              onTap: () {
                                                                if (Get.put(Providerinsertcontroller()).mondaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 1;
                                                                  });

                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor:ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "End time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Transform.scale(
                                                            scale: 1,
                                                            child: Switch(
                                                              onChanged: (value) {
                                                                if (Get.put(Providerinsertcontroller()).mondaydata == true) {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).mondaydata = false;
                                                                    Get.put(Providerinsertcontroller())
                                                                        .monday_end
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller())
                                                                        .monday_start
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller()). monday="";
                                                                    Get.put(Providerinsertcontroller()). mon_check=0;
                                                                    Get.put(Providerinsertcontroller()).update();
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).mondaydata = true;
                                                                  });
                                                                }
                                                              },
                                                              value: Get.put(Providerinsertcontroller()).mondaydata,
                                                              activeColor:
                                                              ThemeText.basiccolor,
                                                              activeTrackColor:
                                                              ThemeText.appcolor,
                                                              inactiveThumbColor:
                                                              ThemeText.appcolor,
                                                              inactiveTrackColor:
                                                              ThemeText.basiccolor,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0)
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0)
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Tus",
                                                          style: ThemeText.buttontab,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              readOnly: true,
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .tuesday_start,
                                                              onTap: () {
                                                                if (Get.put(Providerinsertcontroller()).tuesdaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 2;
                                                                  });

                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor: ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "Start time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              readOnly: true,
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .tuesday_end,
                                                              onTap: () {
                                                                if (Get.put(Providerinsertcontroller()).tuesdaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 2;
                                                                  });
                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor: ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "End time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Transform.scale(
                                                            scale: 1,
                                                            child: Switch(
                                                              onChanged: (value) {
                                                                print(Get.put(Providerinsertcontroller()).tuesdaydata);
                                                                if (Get.put(Providerinsertcontroller()).tuesdaydata == true) {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).tuesdaydata = false;
                                                                    Get.put(Providerinsertcontroller())
                                                                        .tuesday_start
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller())
                                                                        .tuesday_end
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller()). tuesday="";
                                                                    Get.put(Providerinsertcontroller()). tue_check=0;
                                                                    Get.put(Providerinsertcontroller()).update();
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).tuesdaydata = true;
                                                                  });
                                                                }
                                                              },
                                                              value: Get.put(Providerinsertcontroller()).tuesdaydata,
                                                              activeColor:
                                                              ThemeText.basiccolor,
                                                              activeTrackColor:
                                                              ThemeText.appcolor,
                                                              inactiveThumbColor:
                                                              ThemeText.appcolor,
                                                              inactiveTrackColor:
                                                              ThemeText.basiccolor,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0)
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0)
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Wed",
                                                          style: ThemeText.buttontab,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              readOnly: true,
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .wednesday_start,
                                                              onTap: () {
                                                                if (Get.put(Providerinsertcontroller()).wednesdaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 3;
                                                                  });

                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor:ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "Start time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              readOnly: true,
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .wednesday_end,
                                                              onTap: () {
                                                                if (Get.put(Providerinsertcontroller()).wednesdaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 3;
                                                                  });

                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor:ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "End time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Transform.scale(
                                                            scale: 1,
                                                            child: Switch(
                                                              onChanged: (value) {
                                                                if (Get.put(Providerinsertcontroller()).wednesdaydata == true) {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).wednesdaydata = false;
                                                                    Get.put(Providerinsertcontroller())
                                                                        .wednesday_start
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller())
                                                                        .wednesday_end
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller()). wednesday="";
                                                                    Get.put(Providerinsertcontroller()). wed_check=0;
                                                                    Get.put(Providerinsertcontroller()).update();
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).wednesdaydata = true;
                                                                  });
                                                                }
                                                              },
                                                              value: Get.put(Providerinsertcontroller()).wednesdaydata,
                                                              activeColor:
                                                              ThemeText.basiccolor,
                                                              activeTrackColor:
                                                              ThemeText.appcolor,
                                                              inactiveThumbColor:
                                                              ThemeText.appcolor,
                                                              inactiveTrackColor:
                                                              ThemeText.basiccolor,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0)
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0)
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Thr",
                                                          style: ThemeText.buttontab,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              readOnly: true,
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .thursday_start,
                                                              onTap: () {
                                                                if (Get.put(Providerinsertcontroller()).thursdaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 4;
                                                                  });

                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor: ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "Start time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              readOnly: true,
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .thursday_end,
                                                              onTap: () {
                                                                if (Get.put(Providerinsertcontroller()).thursdaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 4;
                                                                  });

                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor:ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "End time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Transform.scale(
                                                            scale: 1,
                                                            child: Switch(
                                                              onChanged: (value) {
                                                                if (Get.put(Providerinsertcontroller()).thursdaydata == true) {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).thursdaydata = false;
                                                                    Get.put(Providerinsertcontroller())
                                                                        .thursday_start
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller())
                                                                        .thursday_end
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller()). thursday="";
                                                                    Get.put(Providerinsertcontroller()). thurs_check=0;
                                                                    Get.put(Providerinsertcontroller()).update();
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).thursdaydata = true;
                                                                  });
                                                                }
                                                              },
                                                              value: Get.put(Providerinsertcontroller()).thursdaydata,
                                                              activeColor:
                                                              ThemeText.basiccolor,
                                                              activeTrackColor:
                                                              ThemeText.appcolor,
                                                              inactiveThumbColor:
                                                              ThemeText.appcolor,
                                                              inactiveTrackColor:
                                                              ThemeText.basiccolor,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0)
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0)
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Fri",
                                                          style: ThemeText.buttontab,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              readOnly: true,
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .friday_start,
                                                              onTap: () {
                                                                if (Get.put(Providerinsertcontroller()).fridaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 5;
                                                                  });

                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor: ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "Start time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              readOnly: true,
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .friday_end,
                                                              onTap: () {
                                                                if (Get.put(Providerinsertcontroller()).fridaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 5;
                                                                  });

                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor: ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "End time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Transform.scale(
                                                            scale: 1,
                                                            child: Switch(
                                                              onChanged: (value) {
                                                                if (Get.put(Providerinsertcontroller()).fridaydata == true) {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).fridaydata = false;
                                                                    Get.put(Providerinsertcontroller())
                                                                        .friday_start
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller())
                                                                        .friday_end
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller()). friday="";
                                                                    Get.put(Providerinsertcontroller()). fri_check=0;
                                                                    Get.put(Providerinsertcontroller()).update();
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).fridaydata = true;
                                                                  });
                                                                }
                                                              },
                                                              value: Get.put(Providerinsertcontroller()).fridaydata,
                                                              activeColor:
                                                              ThemeText.basiccolor,
                                                              activeTrackColor:
                                                              ThemeText.appcolor,
                                                              inactiveThumbColor:
                                                              ThemeText.appcolor,
                                                              inactiveTrackColor:
                                                              ThemeText.basiccolor,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0)
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0)
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Sat",
                                                          style: ThemeText.buttontab,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              readOnly: true,
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .saturday_start,
                                                              onTap: () {
                                                                if (Get.put(Providerinsertcontroller()).saturdaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 6;
                                                                  });

                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor: ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "Start time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              readOnly: true,
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .saturday_end,
                                                              onTap: () {
                                                                if (Get.put(Providerinsertcontroller()).saturdaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 6;
                                                                  });

                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor:ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "End time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Transform.scale(
                                                            scale: 1,
                                                            child: Switch(
                                                              onChanged: (value) {
                                                                if (Get.put(Providerinsertcontroller()).saturdaydata == true) {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).saturdaydata = false;
                                                                    Get.put(Providerinsertcontroller())
                                                                        .saturday_start
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller())
                                                                        .saturday_end
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller()). saturday="";
                                                                    Get.put(Providerinsertcontroller()). sat_check=0;
                                                                    Get.put(Providerinsertcontroller()).update();
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).saturdaydata = true;
                                                                  });
                                                                }
                                                              },
                                                              value: Get.put(Providerinsertcontroller()).saturdaydata,
                                                              activeColor:
                                                              ThemeText.basiccolor,
                                                              activeTrackColor:
                                                              ThemeText.appcolor,
                                                              inactiveThumbColor:
                                                              ThemeText.appcolor,
                                                              inactiveTrackColor:
                                                              ThemeText.basiccolor,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0)
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                if(Get.put(Providerinsertcontroller()).checkalldayinsert==0)
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Sun",
                                                          style: ThemeText.buttontab,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              readOnly: true,
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .sunday_start,
                                                              onTap: () {
                                                                if (Get.put(Providerinsertcontroller()).sundaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 7;
                                                                  });

                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor: ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "Start time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            subtitle: TextFormField(
                                                              readOnly: true,
                                                              controller: Get.put(
                                                                  Providerinsertcontroller())
                                                                  .sunday_end,
                                                              onTap: () {
                                                                if (Get.put(Providerinsertcontroller()).sundaydata == true) {
                                                                  setState(() {
                                                                    selectdate = 7;
                                                                  });

                                                                  providertime();
                                                                }
                                                              },
                                                              cursorWidth: 2,
                                                              cursorColor: ThemeText.appcolor,
                                                              decoration:
                                                              Common.timetextfield(
                                                                "End time",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Transform.scale(
                                                            scale: 1,
                                                            child: Switch(
                                                              onChanged: (value) {
                                                                if (Get.put(Providerinsertcontroller()).sundaydata == true) {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).sundaydata = false;
                                                                    Get.put(Providerinsertcontroller())
                                                                        .sunday_start
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller())
                                                                        .sunday_end
                                                                        .clear();
                                                                    Get.put(Providerinsertcontroller()). sunday="";
                                                                    Get.put(Providerinsertcontroller()). sun_check=0;
                                                                    Get.put(Providerinsertcontroller()).update();
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    Get.put(Providerinsertcontroller()).sundaydata = true;
                                                                  });
                                                                }
                                                              },
                                                              value: Get.put(Providerinsertcontroller()).sundaydata,
                                                              activeColor:
                                                              ThemeText.basiccolor,
                                                              activeTrackColor:
                                                              ThemeText.appcolor,
                                                              inactiveThumbColor:
                                                              ThemeText.appcolor,
                                                              inactiveTrackColor:
                                                              ThemeText.basiccolor,
                                                            )),
                                                      ],
                                                    ),
                                                  ),

                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                if(timeperiodvalidation==false)
                                                   Padding(
                                                      padding:const EdgeInsets.only(left:8),
                                                      child: Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.providerForm!.timePeriod.toString(),style: const TextStyle(color:Colors.red,fontSize: 12),)
                                                  )


                                              ],
                                            ),
                                          )),
                                    ),
                                  ),

                                  const SizedBox(height: 200)
                                ],
                              ),
                            )),
                      ),
                    )

                ],
              ),
            ),
          ):SafeArea(
              child: Scaffold(

                  appBar: AppBar(
                    backgroundColor: ThemeText.basiccolor,
                    elevation: 0,
                    automaticallyImplyLeading: false,

                    centerTitle: true,
                    title: Text(
                      "Verify Email",
                      style: ThemeText.title1,
                    ),
                  ),
                  // backgroundColor: ThemeText.basiccolor.withOpacity(0.9),

                  body:Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: SizedBox(
                            height: Get.height*0.45,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                //set border radius more than 50% of height and width to make circle
                              ),
                              shadowColor: ThemeText.basiccolor,
                              elevation: 7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Image(image:AssetImage("images/email.gif"),width: 100,height: 100,)
                                    ],
                                  ),
                                  const  SizedBox(height:20),
                                  Text("Verify Email",style: ThemeText.heading,),
                                  const  SizedBox(height:20),
                                  // Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceBookingConformation!.bookingSuccessfully.toString(),style: ThemeText.heading3,),
                                  // const SizedBox(height:30),
                                  Text("Please verify your email. Check your inbox for a verification email.",style: ThemeText.bodydata,
                                    textAlign: TextAlign.center,),
                                  const SizedBox(height:30),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0.0, left: 0, right: 15),
                                        child: InkWell(
                                          onTap: () {


                                            mailverficationcontroller.mailverficationscreen(
                                                {
                                                  "user_id":Getstore.box.read("userid").toString(),
                                                },
                                                "check_mail_verification");




                                          },
                                          child: Container(
                                              width: 150,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0xffBFD1F8),
                                                    offset: Offset(
                                                      5.0,
                                                      5.0,
                                                    ),
                                                    blurRadius: 10.0,
                                                    spreadRadius: 2.0,
                                                  ), //BoxShadow
                                                  //BoxShadow
                                                ],
                                                gradient:  LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: const Alignment(0.8, 1),
                                                  colors: <Color>[
                                                    ThemeText.appcolor,
                                                    ThemeText.appcolor,
                                                  ],

                                                  tileMode: TileMode.mirror,
                                                ),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child:  Center(
                                                child:  Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children:  [

                                                    Padding(padding: const EdgeInsets.only(left: 5,),
                                                      child:  Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceBookingConformation!.homepageButton.toString(),
                                                          style: const TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 15,
                                                              letterSpacing: 1)),)
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0.0, left: 0, right: 0),
                                        child: InkWell(
                                          onTap: () {


                                            Get.put(Mailsendcontroller()).mailsendscreen({
                                              "user_id":Getstore.box.read("userid").toString(),
                                            },
                                                "mail_verification");



                                          },
                                          child: Container(
                                              width: 150,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0xffBFD1F8),
                                                    offset: Offset(
                                                      5.0,
                                                      5.0,
                                                    ),
                                                    blurRadius: 10.0,
                                                    spreadRadius: 2.0,
                                                  ), //BoxShadow
                                                  //BoxShadow
                                                ],
                                                gradient:  LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: const Alignment(0.8, 1),
                                                  colors: <Color>[
                                                    ThemeText.appcolor,
                                                    ThemeText.appcolor,
                                                  ],

                                                  tileMode: TileMode.mirror,
                                                ),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child:  Center(
                                                child:  Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [

                                                    Padding(padding:  EdgeInsets.only(left: 5,),
                                                      child:  Text("Resend Mail",
                                                          style:  TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 15,
                                                              letterSpacing: 1)),)
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height:30),



                                ],
                              ),
                            )
                        ),
                      )
                  ))):
          Container(
            color:Colors.white,
            child: Column(
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
            ),
          );
        }));
  }
}
