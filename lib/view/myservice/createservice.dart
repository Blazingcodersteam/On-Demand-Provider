import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';

import '../../Controller/Catagories_controller/subcatagories_controller.dart';
import '../../Controller/Service_Controller/Service_list_Controller.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/logincontroller.dart';
import '/Controller/Catagories_controller/Catagories_list_Controller.dart';
import '/Controller/Image_Controller/Image_delete_Controller.dart';
import '/Controller/Service_Controller/Service_insert_Controller.dart';
import '/Controller/Provider_Controller/providerlist_Controller.dart';
import '../commonpage/export.dart';

class Createservice extends StatefulWidget {
  const Createservice({Key? key}) : super(key: key);

  @override
  State<Createservice> createState() => CreateserviceState();
}

class CreateserviceState extends State<Createservice> {
  static var selectdate = 0;

  List<Map<String, dynamic>> dataList = [];
  static var network;
  Catagorieslistcontroller catagorieslistcontroller =
  Get.put(Catagorieslistcontroller());
  Providerlistcontroller providerlistcontroller =
  Get.put(Providerlistcontroller());
  Serviceinsertcontroller serviceinsertcontroller =
  Get.put(Serviceinsertcontroller());
  SubCatagorieslistcontroller subCatagorieslistcontroller =
  Get.put(SubCatagorieslistcontroller());
  @override
  void initState() {
    super.initState();

    setState(() {
      network = 0;
    });

    // Get.put(Catagorieslistcontroller()).catagorieslistscreen("category_list");
  }

  final RegExp _timeRegex = RegExp(
    r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$',
  );



  Future<void> selectImages() async {
    List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null) {
      setState(() {
        network = 1;
        serviceinsertcontroller.imageFileList =
            images.map((image) => File(image.path)).toList();
      });

      selectImages1();
    }
  }

  static Future<void> selectImages1() async {
    if (Get.put(Serviceinsertcontroller()).imagedata != [] && network == 0) {
      for (var i = 0;
          i < Get.put(Serviceinsertcontroller()).imagedata.length;
          i++) {
        Get.put(Serviceinsertcontroller()).data.add({
          "type": "network",
          "url": Get.put(Serviceinsertcontroller()).imagedata[i],
        });
      }
    }
    if (Get.put(Serviceinsertcontroller()).imageFileList != []) {
      for (var i = 0;
          i < Get.put(Serviceinsertcontroller()).imageFileList!.length;
          i++) {
        Get.put(Serviceinsertcontroller()).data.add({
          "type": "fileimage",
          "url": Get.put(Serviceinsertcontroller()).imageFileList![i]
        });
      }
    }
  }

  bool loaderimage = false;
  bool priceunitvalidation = true;
  bool catagoriesvalidation = true;
  bool providersvalidation = true;
  bool providertypeValidation = true;

  loaderimagedata() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        loaderimage = false;
      });
    });
  }

  // void toggleCheckbox(String value) {
  //   setState(() {
  //     if (serviceinsertcontroller.catagories.contains(value)) {
  //       serviceinsertcontroller.catagories.remove(value);
  //       print(serviceinsertcontroller.catagories);
  //     } else {
  //       serviceinsertcontroller.catagories.add(value);
  //       print(serviceinsertcontroller.catagories);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      if (catagorieslistcontroller.catagorieslistResponseStatus.isFalse &&
          providerlistcontroller.providerlisteresponseStatus.isFalse &&
          serviceinsertcontroller.serviceinsertresponseStatus.isFalse &&
          serviceinsertcontroller.serviceupdateresponseStatus.isFalse) {
        return Scaffold(
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
              Get.put(Settingscontroller())
                  .settingsdata
                  .value
                  .data!
                  .cmsData!
                  .serviceEditService!
                  .title
                  .toString(),
              style: ThemeText.title1,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width * 0.9,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  child: BounceInDown(
                    duration: const Duration(seconds: 1),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (states) {
                                return ThemeText.appcolor;
                              },
                            ),
                          ),
                          child: Text(
                            Get.put(Settingscontroller())
                                .settingsdata
                                .value
                                .data!
                                .cmsData!
                                .serviceEditService!
                                .saveButton
                                .toString()
                                .toUpperCase(),
                            style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                          onPressed: () {
                            if (serviceinsertcontroller.formkey.currentState!
                                    .validate() &&
                                serviceinsertcontroller.catagories != null &&
                                serviceinsertcontroller.priceunit != null &&
                                serviceinsertcontroller.providers != null) {
                              serviceinsertcontroller
                                  .servicerinsertscreen(
                                      serviceinsertcontroller.catagories,
                                      serviceinsertcontroller.subCatagories,
                                      serviceinsertcontroller.childCatogories)
                                  .then((value) {
                                Get.put(Servicelistcontroller())
                                    .servicelistscreen({
                                  "search": "",
                                  "user_id": Getstore.box.read("userid"),
                                }, "service_list_by_user");
                              });
                            } else {
                              if (serviceinsertcontroller.catagories == null) {
                                setState(() {
                                  catagoriesvalidation = false;
                                });
                              } else {
                                setState(() {
                                  catagoriesvalidation = true;
                                });
                              }
                              // if(serviceinsertcontroller.subCatagories == null){
                              //
                              //   setState(() {
                              //     subCatagoriesValidation=false;
                              //   });
                              // }else{
                              //   setState(() {
                              //     subCatagoriesValidation=true;
                              //   });
                              // }
                              // if(serviceinsertcontroller.childCatogories == null){
                              //
                              //   setState(() {
                              //     childcatagoriesValidation=false;
                              //   });
                              // }else{
                              //   setState(() {
                              //     childcatagoriesValidation=true;
                              //   });
                              // }
                              if (serviceinsertcontroller.priceunit == null) {
                                setState(() {
                                  priceunitvalidation = false;
                                });
                              } else {
                                setState(() {
                                  priceunitvalidation = true;
                                });
                              }
                              if (serviceinsertcontroller.providers == null) {
                                setState(() {
                                  providersvalidation = false;
                                });
                              } else {
                                setState(() {
                                  providersvalidation = true;
                                });
                              }
                            }
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      height: Get.height * 0.20,
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
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                Get.put(Settingscontroller())
                                    .settingsdata
                                    .value
                                    .data!
                                    .cmsData!
                                    .serviceEditService!
                                    .heading
                                    .toString(),
                                style: ThemeText.maintitle),

                            const SizedBox(height: 10),
                            Text(
                              Get.put(Settingscontroller())
                                  .settingsdata
                                  .value
                                  .data!
                                  .cmsData!
                                  .serviceEditService!
                                  .subTitle
                                  .toString()
                                  .tr,
                              style: ThemeText.bodydata,
                              textAlign: TextAlign.center,
                            ),
                            // Text("Fill the following credentials to login your account", style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.primaryColor))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: serviceinsertcontroller.formkey,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                Get.put(Settingscontroller())
                                                    .settingsdata
                                                    .value
                                                    .data!
                                                    .cmsData!
                                                    .serviceEditService!
                                                    .images
                                                    .toString(),
                                                style: TextStyle(
                                                  color: ThemeText.headingcolor,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
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
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              left: 10),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: ThemeText
                                                              .appcolor,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      15.0,
                                                                  vertical:
                                                                      5.0),
                                                          child: Text(
                                                            "Upload",
                                                            style: ThemeText
                                                                .content1,
                                                            textAlign: TextAlign
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
                                        /*  if(Get.put(Providerinsertcontroller()).status!=1)
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                              child: ( Get.put(Providerinsertcontroller()).imageFileList!.isEmpty)
                                                  ? const Image(
                                                      image: NetworkImage(
                                                          "https://w7.pngwing.com/pngs/602/266/png-transparent-add-image-icon.png"),
                                                      fit: BoxFit.cover,
                                                      width: 100,
                                                      height: 100,
                                                    )
                                                  : Container(
                                                      height: 100,
                                                      child: ClipRRect(
                                                        borderRadius: const BorderRadius
                                                            .all(Radius
                                                                .circular(5)),
                                                        child: ListView.builder(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                            Get.put(Providerinsertcontroller()).imageFileList!
                                                                    .length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child: ClipRRect(
                                                                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                                                                      child: SizedBox(
                                                                        width:
                                                                            100,
                                                                        child: Image
                                                                            .file(
                                                                          File( Get.put(Providerinsertcontroller()).imageFileList![index]
                                                                              .path),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      )));
                                                            }),
                                                      ),
                                                    ),
                                            )
                                             else */
                                        if (loaderimage == false)
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            child: (Get.put(
                                                        Serviceinsertcontroller())
                                                    .data
                                                    .isEmpty)
                                                ? InkWell(
                                                    onTap: () {
                                                      selectImages();
                                                    },
                                                    child: const Image(
                                                      image: NetworkImage(
                                                          "https://w7.pngwing.com/pngs/602/266/png-transparent-add-image-icon.png"),
                                                      fit: BoxFit.cover,
                                                      width: 100,
                                                      height: 100,
                                                    ),
                                                  )
                                                : SizedBox(
                                                    height: 100,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  5)),
                                                      child: ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: Get.put(
                                                                  Serviceinsertcontroller())
                                                              .data!
                                                              .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            if (Get.put(Serviceinsertcontroller())
                                                                            .data![
                                                                        index]
                                                                    ["type"] ==
                                                                "network") {
                                                              return Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          5.0),
                                                                  child: ClipRRect(
                                                                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                                                                      child: SizedBox(
                                                                          width: 100,
                                                                          child: Stack(children: [
                                                                            ImageFade(
                                                                              width: 100,
                                                                              height: 100,
                                                                              // whenever the image changes, it will be loaded, and then faded in:
                                                                              image: NetworkImage(Get.put(Serviceinsertcontroller()).image_path + Get.put(Serviceinsertcontroller()).data![index]["url"]),

                                                                              // slow-ish fade for loaded images:
                                                                              duration: const Duration(milliseconds: 900),

                                                                              // if the image is loaded synchronously (ex. from memory), fade in faster:
                                                                              syncDuration: const Duration(milliseconds: 150),

                                                                              // supports most properties of Image:
                                                                              alignment: Alignment.center,
                                                                              fit: BoxFit.cover,
                                                                              scale: 2,
                                                                              loadingBuilder: (context, progress, chunkEvent) => Center(
                                                                                child: LoadingAnimationWidget.twistingDots(
                                                                                  leftDotColor: ThemeText.appcolor,
                                                                                  rightDotColor: ThemeText.basiccolor,
                                                                                  size: 30,
                                                                                ),
                                                                              ),
                                                                              errorBuilder: (context, error) => Center(
                                                                                child: LoadingAnimationWidget.twistingDots(
                                                                                  leftDotColor: ThemeText.appcolor,
                                                                                  rightDotColor: ThemeText.basiccolor,
                                                                                  size: 30,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: Alignment.topRight,
                                                                              child: Padding(
                                                                                  padding: const EdgeInsets.only(top: 2, right: 2),
                                                                                  child: InkWell(
                                                                                    onTap: () {
                                                                                      print(Get.put(Serviceinsertcontroller()).data.length.toString());

                                                                                      Get.put(ImagedeleteController()).imagedelete({
                                                                                        "image_name": Get.put(Serviceinsertcontroller()).data![index]["url"],
                                                                                        "id": Get.put(Serviceinsertcontroller()).service_id.toString(),
                                                                                      }, "delete_service_image");
                                                                                      setState(() {
                                                                                        loaderimage = true;
                                                                                        Get.put(Serviceinsertcontroller()).data.removeAt(index);
                                                                                      });
                                                                                      loaderimagedata();
                                                                                    },
                                                                                    child: Container(
                                                                                        alignment: Alignment.center,
                                                                                        width: 25,
                                                                                        height: 25,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(5),
                                                                                          color: const Color(0xffFAD8D2),
                                                                                        ),
                                                                                        child: Icon(IconlyLight.delete, size: 15, color: ThemeText.deleteicon)),
                                                                                  )),
                                                                            ),
                                                                          ])
                                                                          // child:Text(Get.put(Providerinsertcontroller()).image_path+Get.put(Providerinsertcontroller()).imagedata![index]),
                                                                          )));
                                                            } else {
                                                              return Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          5.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            5)),
                                                                    child: SizedBox(
                                                                        width: 100,
                                                                        child: Stack(children: [
                                                                          Image
                                                                              .file(
                                                                            File(Get.put(Serviceinsertcontroller()).data![index]["url"].path),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            width:
                                                                                100,
                                                                            height:
                                                                                100,
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                Alignment.topRight,
                                                                            child: Padding(
                                                                                padding: const EdgeInsets.only(top: 2, right: 2),
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      loaderimage = true;
                                                                                    });
                                                                                    /* Get.put(Providerinsertcontroller()).imagedata!.removeAt(index);*/
                                                                                    Get.put(Serviceinsertcontroller()).imageFileList!.remove(Get.put(Serviceinsertcontroller()).data![index]["url"]);
                                                                                    Get.put(Serviceinsertcontroller()).data.removeAt(index);

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
                                                                                      width: 25,
                                                                                      height: 25,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                        color: const Color(0xffFAD8D2),
                                                                                      ),
                                                                                      child: Icon(IconlyLight.delete, size: 15, color: ThemeText.deleteicon)),
                                                                                )),
                                                                          ),
                                                                        ])),
                                                                  ));
                                                            }
                                                          }),
                                                    ),
                                                  ),
                                          )
                                        else
                                          Center(
                                            child: LoadingAnimationWidget
                                                .twistingDots(
                                              leftDotColor: ThemeText.appcolor,
                                              rightDotColor:
                                                  ThemeText.basiccolor,
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
                                              Text(
                                                Get.put(Settingscontroller())
                                                    .settingsdata
                                                    .value
                                                    .data!
                                                    .cmsData!
                                                    .serviceEditService!
                                                    .serviceName
                                                    .toString(),
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
                                          controller: serviceinsertcontroller
                                              .service_namecontroller,
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
                                              Get.put(Settingscontroller())
                                                  .settingsdata
                                                  .value
                                                  .data!
                                                  .cmsData!
                                                  .serviceEditService!
                                                  .serviceName
                                                  .toString(),
                                              IconlyLight.profile),
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
                                              Text(
                                                Get.put(Settingscontroller())
                                                    .settingsdata
                                                    .value
                                                    .data!
                                                    .cmsData!
                                                    .serviceEditService!
                                                    .description
                                                    .toString(),
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
                                          controller: serviceinsertcontroller
                                              .service_descriptioncontroller,
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
                                              Get.put(Settingscontroller())
                                                  .settingsdata
                                                  .value
                                                  .data!
                                                  .cmsData!
                                                  .serviceEditService!
                                                  .description
                                                  .toString(),
                                              Icons.insert_comment_outlined),
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
                                              Text(
                                                Get.put(Settingscontroller())
                                                    .settingsdata
                                                    .value
                                                    .data!
                                                    .cmsData!
                                                    .serviceEditService!
                                                    .priceUnit
                                                    .toString(),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RadioListTile(
                                              activeColor: ThemeText.appcolor,
                                              title: Text(
                                                "Hourly",
                                                style: ThemeText.buttontab,
                                                textAlign: TextAlign.start,
                                              ),
                                              value: "Hourly",
                                              groupValue:
                                                  serviceinsertcontroller
                                                      .priceunit,
                                              onChanged: (value) {
                                                setState(() {
                                                  serviceinsertcontroller
                                                          .priceunit =
                                                      value.toString();
                                                });
                                              },
                                            ),
                                            RadioListTile(
                                              activeColor: ThemeText.appcolor,
                                              title: Text(
                                                "Fixed",
                                                style: ThemeText.buttontab,
                                                textAlign: TextAlign.start,
                                              ),
                                              value: "Fixed",
                                              groupValue:
                                                  serviceinsertcontroller
                                                      .priceunit,
                                              onChanged: (value) {
                                                setState(() {
                                                  serviceinsertcontroller
                                                          .priceunit =
                                                      value.toString();
                                                });
                                              },
                                            ),
                                            if (priceunitvalidation == false)
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 6),
                                                  child: Text(
                                                    "${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceEditService!.priceUnit.toString()} is Required",
                                                    style: const TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 12),
                                                  ))
                                          ],
                                        )
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
                                              Text(
                                                Get.put(Settingscontroller())
                                                    .settingsdata
                                                    .value
                                                    .data!
                                                    .cmsData!
                                                    .serviceEditService!
                                                    .quantityUnit
                                                    .toString(),
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
                                          controller: serviceinsertcontroller
                                              .service_customcontroller,
                                          autocorrect: true,
                                          keyboardType: TextInputType.phone,
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
                                              Get.put(Settingscontroller())
                                                  .settingsdata
                                                  .value
                                                  .data!
                                                  .cmsData!
                                                  .serviceEditService!
                                                  .quantityUnit
                                                  .toString(),
                                              Icons
                                                  .production_quantity_limits_outlined),
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    5), // Set your desired border radius here
                              ),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
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
                                              Text(
                                                Get.put(Settingscontroller())
                                                    .settingsdata
                                                    .value
                                                    .data!
                                                    .cmsData!
                                                    .serviceEditService!
                                                    .price
                                                    .toString(),
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
                                          controller: serviceinsertcontroller
                                              .servce_pricecontroller,
                                          autocorrect: true,
                                          keyboardType: TextInputType.phone,
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
                                          decoration: InputDecoration(
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Text(
                                                Get.put(Settingscontroller())
                                                    .settingsdata
                                                    .value
                                                    .data!
                                                    .currencyData!
                                                    .symbol
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    color: Color(0xffADA4A5)),
                                              ),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                            errorStyle: const TextStyle(
                                              fontSize: 12.0,
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
                                            hintText:
                                                "Enter the ${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceEditService!.price.toString()}",
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
                                              Text(
                                                Get.put(Settingscontroller())
                                                    .settingsdata
                                                    .value
                                                    .data!
                                                    .cmsData!
                                                    .serviceEditService!
                                                    .discountPrice
                                                    .toString(),
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
                                          controller: serviceinsertcontroller
                                              .service_discountcontroller,
                                          autocorrect: true,
                                          keyboardType: TextInputType.phone,
                                          validator: (value) {
                                            // Check if this field is empty
                                            if (value!.isNotEmpty) {
                                              if (int.parse(
                                                      serviceinsertcontroller
                                                          .servce_pricecontroller
                                                          .text) <
                                                  int.parse(serviceinsertcontroller
                                                      .service_discountcontroller
                                                      .text)) {
                                                return '${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceEditService!.price.toString()} is Higher than Price ';
                                              }
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
                                          decoration: InputDecoration(
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Text(
                                                Get.put(Settingscontroller())
                                                    .settingsdata
                                                    .value
                                                    .data!
                                                    .currencyData!
                                                    .symbol
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    color: Color(0xffADA4A5)),
                                              ),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                            errorStyle: const TextStyle(
                                              fontSize: 12.0,
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
                                            hintText:
                                                "Enter the ${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceEditService!.price.toString()}",
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
                                              Text(
                                                "Catagories",
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (var i = 0;
                                                i <
                                                    subCatagorieslistcontroller
                                                        .subCatagorieslistData
                                                        .value
                                                        .data!
                                                        .categoryData!
                                                        .length;
                                                i++)
                                              RadioListTile<String>(
                                                activeColor: ThemeText.appcolor,
                                                title: Text(
                                                  // subCatagorieslistcontroller.subCatagorieslistData.value.data!.categoryData![i].categoryName.toString(),
                                                  subCatagorieslistcontroller
                                                      .subCatagorieslistData
                                                      .value
                                                      .data!
                                                      .categoryData![i]
                                                      .categoryName
                                                      .toString(),
                                                  style: ThemeText.buttontab,
                                                  textAlign: TextAlign.start,
                                                ),
                                                value:
                                                    subCatagorieslistcontroller
                                                        .subCatagorieslistData
                                                        .value
                                                        .data!
                                                        .categoryData![i]
                                                        .categoryId
                                                        .toString(),
                                                groupValue:
                                                    serviceinsertcontroller
                                                        .catagories
                                                        .toString(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    serviceinsertcontroller
                                                            .catagories =
                                                        value.toString();
                                                    print(serviceinsertcontroller.catagories);
                                                  });
                                                  subCatagorieslistcontroller
                                                      .Subcatagorieslistscreen({
                                                    "category_id":
                                                        serviceinsertcontroller
                                                            .catagories
                                                            .toString(),
                                                    "sub_category_id": "",
                                                  }, "fetch_categories");
                                                  serviceinsertcontroller.subCatagories = null;
                                                },
                                              ),
                                            // if (catagorieslistcontroller.catagorieslistData.value.data!
                                            //     .isNotEmpty)
                                            //   Column(
                                            //     children:
                                            //     catagorieslistcontroller.catagorieslistData.value.data!
                                            //         .map((dynamic
                                            //     option) {
                                            //
                                            //       return CheckboxListTile(
                                            //         controlAffinity:
                                            //         ListTileControlAffinity
                                            //             .leading,
                                            //         activeColor:
                                            //         ThemeText.appcolor,
                                            //         visualDensity:
                                            //         const VisualDensity(
                                            //             horizontal:
                                            //             -2.0,
                                            //             vertical: 0.0),
                                            //         side:
                                            //         MaterialStateBorderSide
                                            //             .resolveWith(
                                            //               (Set<MaterialState>states) {
                                            //             if (states.contains(
                                            //                 MaterialState
                                            //                     .selected)) {
                                            //               return BorderSide(
                                            //                   color: ThemeText
                                            //                       .appcolor,
                                            //                   width: 2);
                                            //             }
                                            //             return BorderSide(
                                            //               color: ThemeText
                                            //                   .appcolor,
                                            //               width: 2,
                                            //             );
                                            //           },
                                            //         ),
                                            //         title:Text(
                                            //           option
                                            //               .categoryName,
                                            //           style:  ThemeText.buttontab,
                                            //
                                            //         ),
                                            //       //  value:  Get.put(Serviceinsertcontroller()).catagories.contains(option.categoryId),
                                            //         value:  Get.put(Serviceinsertcontroller()).catagories.contains(option.categoryId),
                                            //         onChanged:
                                            //             (bool? value) {
                                            //           toggleCheckbox(
                                            //               option.categoryId);
                                            //         },
                                            //       );
                                            //     }).toList(),
                                            //   )
                                            // else
                                            //   Card(
                                            //       elevation: 4.0,
                                            //       shape:
                                            //       RoundedRectangleBorder(
                                            //         borderRadius:
                                            //         BorderRadius
                                            //             .circular(15.0),
                                            //       ),
                                            //       child: Container(
                                            //         width: Get.width * 1,
                                            //         height:
                                            //         Get.height * 0.1,
                                            //         decoration:
                                            //         BoxDecoration(
                                            //           borderRadius:
                                            //           BorderRadius
                                            //               .circular(10),
                                            //           color: ThemeText
                                            //               .basiccolor,
                                            //           boxShadow: [
                                            //             BoxShadow(
                                            //                 color: ThemeText
                                            //                     .basiccolor,
                                            //                 spreadRadius:
                                            //                 3),
                                            //           ],
                                            //         ),
                                            //         child: Center(
                                            //           child: Text(
                                            //             "No Data Found",
                                            //             style: ThemeText
                                            //                 .heading1,
                                            //           ),
                                            //         ),
                                            //       )),

                                            if (catagoriesvalidation == false)
                                              const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 6),
                                                  child: Text(
                                                    "Catagories is Required",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 12),
                                                  ))
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          Obx(() {
                            if (subCatagorieslistcontroller
                                .SubcatagorieslistResponseStatus.isFalse) {
                              return subCatagorieslistcontroller
                                      .subCatagorieslistData
                                      .value
                                      .data!
                                      .subCategoryData!
                                      .isNotEmpty
                                  ? Padding(
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
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              //set border radius more than 50% of height and width to make circle
                                            ),
                                            shadowColor: ThemeText.basiccolor,
                                            elevation: 7,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 0.0,
                                                        horizontal: 15.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Sub Catagories",
                                                          style: TextStyle(
                                                            color: ThemeText
                                                                .headingcolor,
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  FormField<String>(
                                                    builder:
                                                        (FormFieldState<String>
                                                            state) {
                                                      return Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          for (var j = 0;
                                                              j <
                                                                  subCatagorieslistcontroller
                                                                      .subCatagorieslistData
                                                                      .value
                                                                      .data!
                                                                      .subCategoryData!
                                                                      .length;
                                                              j++)
                                                            RadioListTile<
                                                                String>(
                                                              activeColor:
                                                                  ThemeText
                                                                      .appcolor,
                                                              title: Text(
                                                                subCatagorieslistcontroller
                                                                    .subCatagorieslistData
                                                                    .value
                                                                    .data!
                                                                    .subCategoryData![
                                                                        j]
                                                                    .subCatName
                                                                    .toString(),
                                                                style: ThemeText
                                                                    .buttontab,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                              ),
                                                              value: subCatagorieslistcontroller
                                                                  .subCatagorieslistData
                                                                  .value
                                                                  .data!
                                                                  .subCategoryData![
                                                                      j]
                                                                  .subCatId
                                                                  .toString(),
                                                              groupValue:
                                                                  serviceinsertcontroller
                                                                      .subCatagories,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  serviceinsertcontroller
                                                                          .subCatagories =
                                                                      value
                                                                          .toString();

                                                                  print(serviceinsertcontroller.subCatagories);

                                                                });
                                                                subCatagorieslistcontroller
                                                                    .Subcatagorieslistscreen({
                                                                  "category_id":
                                                                      serviceinsertcontroller
                                                                          .catagories
                                                                          .toString(),
                                                                  "sub_category_id":
                                                                      serviceinsertcontroller
                                                                          .subCatagories
                                                                          .toString(),
                                                                }, "fetch_categories");
                                                                serviceinsertcontroller
                                                                        .childCatogories =
                                                                    null;
                                                              },
                                                            ),
                                                          // if (subCatagoriesValidation==false)
                                                          //   const Padding(
                                                          //       padding:
                                                          //       EdgeInsets.only(left: 6),
                                                          //       child: Text(
                                                          //         "Sub Catagories is Required",
                                                          //         style: TextStyle(
                                                          //             color: Colors.red,
                                                          //             fontSize: 12),
                                                          //       ))
                                                          if (state.hasError)
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      16.0),
                                                              child: Text(
                                                                state
                                                                    .errorText!,
                                                                style:
                                                                    TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .errorColor,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                    validator: (value) {
                                                      if (serviceinsertcontroller
                                                              .subCatagories ==
                                                          null) {
                                                        return 'select a sub-category';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    )
                                  : const SizedBox();
                            } else {
                              return Center(
                                child: LoadingAnimationWidget.twistingDots(
                                  leftDotColor: ThemeText.appcolor,
                                  rightDotColor: ThemeText.basiccolor,
                                  size: 40,
                                ),
                              );
                            }
                          }),
                          subCatagorieslistcontroller.subCatagorieslistData
                                  .value.data!.childCategoryData!.isNotEmpty
                              ? Padding(
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                                  children: [
                                                    Text(
                                                      " Child Catagories",
                                                      style: TextStyle(
                                                        color: ThemeText
                                                            .headingcolor,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              FormField<String>(
                                                builder: (FormFieldState<String>
                                                    state) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      for (var k = 0;
                                                          k <
                                                              subCatagorieslistcontroller
                                                                  .subCatagorieslistData
                                                                  .value
                                                                  .data!
                                                                  .childCategoryData!
                                                                  .length;
                                                          k++)
                                                        RadioListTile<String>(
                                                          activeColor: ThemeText
                                                              .appcolor,
                                                          title: Text(
                                                            subCatagorieslistcontroller
                                                                .subCatagorieslistData
                                                                .value
                                                                .data!
                                                                .childCategoryData![
                                                                    k]
                                                                .childCatName
                                                                .toString(),
                                                            style: ThemeText
                                                                .buttontab,
                                                            textAlign:
                                                                TextAlign.start,
                                                          ),
                                                          value: subCatagorieslistcontroller
                                                              .subCatagorieslistData
                                                              .value
                                                              .data!
                                                              .childCategoryData![
                                                                  k]
                                                              .childCatId
                                                              .toString(),
                                                          groupValue:
                                                              serviceinsertcontroller
                                                                  .childCatogories,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              serviceinsertcontroller
                                                                      .childCatogories =
                                                                  value
                                                                      .toString();
                                                              // childCatagoriesId=subCatagorieslistcontroller.subCatagorieslistData.value.data!.childCategoryData![k].childCatId.toString();
                                                            });
                                                          },
                                                        ),
                                                      if (state.hasError)
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      16.0),
                                                          child: Text(
                                                            state.errorText!,
                                                            style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .errorColor,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  );
                                                },
                                                validator: (value) {
                                                  if (serviceinsertcontroller
                                                          .childCatogories ==
                                                      null) {
                                                    return 'select a Child-category';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                )
                              : const SizedBox(),
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
                                              Text(
                                                Get.put(Settingscontroller())
                                                    .settingsdata
                                                    .value
                                                    .data!
                                                    .cmsData!
                                                    .serviceEditService!
                                                    .providers
                                                    .toString(),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (var i = 0;
                                                i <
                                                    providerlistcontroller
                                                        .providerdata
                                                        .value
                                                        .data!
                                                        .length;
                                                i++)
                                              RadioListTile(
                                                activeColor: ThemeText.appcolor,
                                                title: Text(
                                                  providerlistcontroller
                                                      .providerdata
                                                      .value
                                                      .data![i]
                                                      .prosName,
                                                  style: ThemeText.buttontab,
                                                  textAlign: TextAlign.start,
                                                ),
                                                value: providerlistcontroller
                                                    .providerdata
                                                    .value
                                                    .data![i]
                                                    .prosId,
                                                groupValue:
                                                    serviceinsertcontroller
                                                        .providers,
                                                onChanged: (value) {
                                                  setState(() {
                                                    serviceinsertcontroller
                                                            .providers =
                                                        value.toString();
                                                  });
                                                },
                                              ),
                                            if (providersvalidation == false)
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 6),
                                                  child: Text(
                                                    "${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceEditService!.providers.toString()} is Required",
                                                    style: const TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 12),
                                                  ))
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          if (serviceinsertcontroller.priceunit != "Fixed")
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
                                              children: [
                                                Text(
                                                  Get.put(Settingscontroller())
                                                      .settingsdata
                                                      .value
                                                      .data!
                                                      .cmsData!
                                                      .serviceEditService!
                                                      .duration
                                                      .toString(),
                                                  style: TextStyle(
                                                    color:
                                                        ThemeText.headingcolor,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          TextFormField(
                                            controller: serviceinsertcontroller
                                                .servce_durationcontroller,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            onTap: () {},
                                            autocorrect: true,
                                            keyboardType: TextInputType.phone,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'This field is required';
                                              } else {
                                                // Time is not valid
                                                print('Invalid time');
                                              }
                                              return null;
                                            },
                                            style: const TextStyle(
                                                color: Color(0xffADA4A5),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                            cursorColor: ThemeText.appcolor,
                                            decoration: Common.common(
                                                "Example : 2 hours",
                                                IconlyLight.time_circle),
                                          ),
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
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        );
      } else {
        return Container(
          color: Colors.white,
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
      }
    }));
  }
}
