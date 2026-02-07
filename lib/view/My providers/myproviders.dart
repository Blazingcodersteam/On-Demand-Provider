
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../Controller/Basicinformationcontroller.dart';
import '../../Controller/Mail_verfication_Controller/mail_verfication_controller.dart';
import '../../Controller/Provider_Controller/provider_list_filter.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '/Controller/Provider_Controller/Provider_Details_controller.dart';
import '/Controller/Provider_Controller/provider_insert_controller.dart';
import '/Controller/addresslistcontroller.dart';
import '/Controller/logincontroller.dart';
import '/Controller/Provider_Controller/providerlist_Controller.dart';
import '../commonpage/export.dart';
import '../commonpage/loader.dart';
import 'package:flutter_html/flutter_html.dart';

class Myprovider extends StatefulWidget {
  const Myprovider({Key? key}) : super(key: key);
  @override
  State<Myprovider> createState() => _MyproviderState();
}
class _MyproviderState extends State<Myprovider> {
  var intialindex = 0;
  var status = 1;

  Providerlistcontroller providerlistcontroller = Get.put(Providerlistcontroller());
  Providerdetailscontroller providerdetailscontroller = Get.put(Providerdetailscontroller());
  ProviderListfiltercontroller providerListfiltercontroller = Get.put(ProviderListfiltercontroller());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(providerListfiltercontroller.providerfilterresponseStatus.isFalse) {
        return SafeArea(
          child: Scaffold(
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
               /*       if (Get.previousRoute == Get.currentRoute) {
                        Get.back();
                        Get.back();
                      }else{
                        Get.back();

                      }*/


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
                Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myProviders!.title.toString(),
                style: ThemeText.title1,
              ),
            ),
            // bottomNavigationBar: const Bottomnavigation(
            //   item: 3,
            // ),

            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: (providerlistcontroller
                .providerlisteresponseStatus.isFalse)?
            (Get.put(Settingscontroller()).settingsdata.value.data!.basic ==2)?(providerlistcontroller.providerdata.value.provider_insert_status==0)?Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FloatingActionButton(
                  // isExtended: true,
                  shape:
                  BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: const Icon(Icons.add),
                  backgroundColor: ThemeText.appcolor,
                  onPressed: () {
                    Get.delete<Providerinsertcontroller>(force: true);
                    Get.put(BasicinformationController()).providerstatus="0";
                    Get.put(BasicinformationController()).update();
                    Get.put(Addresslistcontroller()).addresslistscreen({
                      "user_id": Getstore.box.read("userid"),
                    }, "list_address");
                    Get.toNamed(AppRoutes.serviceproviderform)!.then((data) {
                      Get.put(Providerlistcontroller())
                          .providerlistscreen({
                        "search": "",
                        "user_id": Getstore.box.read("userid"),
                      }, "providers_list");
                    });
                  },
                )):const Text(""):Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FloatingActionButton(
                  // isExtended: true,
                  shape:
                  BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child:  Icon(Icons.add),
                  backgroundColor: ThemeText.appcolor,
                  onPressed: () {
                    Get.delete<Providerinsertcontroller>(force: true);
                    Get.put(BasicinformationController()).providerstatus="0";
                    Get.put(BasicinformationController()).update();
                    Get.put(Addresslistcontroller()).addresslistscreen({
                      "user_id": Getstore.box.read("userid"),
                    }, "list_address");
                    Get.toNamed(AppRoutes.serviceproviderform)!.then((data) {
                      Get.put(Providerlistcontroller())
                          .providerlistscreen({
                         "search": "",
                         "user_id": Getstore.box.read("userid"),
                      }, "providers_list");
                    });
                  },
                )):const Text(""),
            body: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: Get.height * 0.9,
                    child: DefaultTabController(
                      initialIndex: intialindex,
                      length: providerListfiltercontroller.providerlistfilterdata.value.dynamicOption!.length,
                      child: Column(
                        children: [
                          ButtonsTabBar(
                            backgroundColor: ThemeText.basiccolor,
                            radius: 5.0,
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 25),
                            unselectedBackgroundColor: const Color(0xffF0F1F3),
                            unselectedLabelStyle: ThemeText.buttontab,
                            labelStyle: ThemeText.textdata1,
                            onTap: (intialindex) {
                              for(var i=0;i< providerListfiltercontroller.providerlistfilterdata.value.dynamicOption!.length;i++){
                                if(intialindex==i) {
                                 if(providerListfiltercontroller.providerlistfilterdata.value.dynamicOption![i].statusName=="All"){
                                   setState(() {
                                     status=1;
                                   });
                                   providerlistcontroller.providerlistscreen({
                                     "search": "",
                                     "pros_accepted": "",
                                     // "pros_accepted": "",
                                     "user_id": Getstore.box.read("userid"),
                                   }, "providers_list");
                                 }else{
                                   setState(() {
                                     status=0;
                                   });

                                   providerlistcontroller.providerlistscreen({
                                     "search": "",
                                     "user_id": Getstore.box.read("userid"),
                                     "pros_accepted": providerListfiltercontroller.providerlistfilterdata.value.dynamicOption![i].mainStatusId,
                                   }, "providers_list");
                                 }
                                }
                              }
                            },
                            tabs:  [
                              for(var i=0;i< providerListfiltercontroller.providerlistfilterdata.value.dynamicOption!.length;i++)
                              Tab(
                                // icon: Icon(Icons.directions_car),
                                text: providerListfiltercontroller.providerlistfilterdata.value.dynamicOption![i].statusName,
                              ),

                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                for(var i=0;i< providerListfiltercontroller.providerlistfilterdata.value.dynamicOption!.length;i++)
                                Obx(() {
                                  if (providerlistcontroller
                                      .providerlisteresponseStatus.isFalse) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          if (providerlistcontroller
                                              .providerdata.value.data!.isNotEmpty)
                                            for (var i = 0;
                                            i <
                                                providerlistcontroller
                                                    .providerdata
                                                    .value
                                                    .data!
                                                    .length;
                                            i++)
                                              FadeInUp(
                                                duration: const Duration(seconds: 1),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 8,
                                                      right: 8,
                                                      top: 6,
                                                      bottom: 6),
                                                  child: InkWell(
                                                      onTap: () {
                                                        providerdetailscontroller
                                                            .providerdetailscreen({
                                                          "provider_id":
                                                          providerlistcontroller
                                                              .providerdata
                                                              .value
                                                              .data![i]
                                                              .prosId,
                                                        }, "providers_details");
                                                        // providerdetailscontroller.providerdetailscreen(postdata, endPoint)

                                                        providerdetails();
                                                      },
                                                      child: Card(
                                                        elevation: 10,
                                                        shadowColor:
                                                        ThemeText.basiccolor,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                          //set border radius more than 50% of height and width to make circle
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius: const BorderRadius
                                                                      .only(
                                                                      topRight: Radius
                                                                          .circular(
                                                                          5),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                          5)),
                                                                  child: SizedBox(
                                                                    width:
                                                                    Get.width * 1,
                                                                    height:
                                                                    Get.height *
                                                                        0.3,
                                                                    //   child: Image.memory(
                                                                    //     base64Decode( providerlistcontroller.providerdata
                                                                    //         .value.data![i].prosImage[0].split(',').last),
                                                                    //     fit: BoxFit.cover,
                                                                    //   ),
                                                                    // )

                                                                    child:
                                                                    CachedNetworkImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        width:
                                                                        Get.width *
                                                                            1,
                                                                        height: Get
                                                                            .height *
                                                                            0.2,
                                                                        imageUrl: providerlistcontroller
                                                                            .providerdata
                                                                            .value
                                                                            .data![
                                                                        i]
                                                                            .prosFiles[
                                                                        0],
                                                                        placeholder:
                                                                            (context, url) =>
                                                                            Center(
                                                                              child: LoadingAnimationWidget.twistingDots(
                                                                                leftDotColor: ThemeText.appcolor,
                                                                                rightDotColor: ThemeText.basiccolor,
                                                                                size: 70,
                                                                              ),
                                                                            ),
                                                                        errorWidget: (context,
                                                                            url,
                                                                            error) =>
                                                                        const Image(
                                                                          image:
                                                                          AssetImage("images/noimage.png"),
                                                                        )
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment: Alignment
                                                                      .topLeft,
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
                                                                        color: Color(
                                                                            0xffEEE7F7),
                                                                      ),
                                                                      child: Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                            10.0,
                                                                            vertical:
                                                                            5.0),
                                                                        child: Text(
                                                                          providerlistcontroller
                                                                              .providerdata
                                                                              .value
                                                                              .data![
                                                                          i]
                                                                              .providertypeName,
                                                                          style:
                                                                          ThemeText
                                                                              .text,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment: Alignment
                                                                      .topRight,
                                                                  child: Padding(
                                                                    padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 10,
                                                                        right:
                                                                        10),
                                                                    child: Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        width: 25,
                                                                        height: 25,
                                                                        decoration:
                                                                        BoxDecoration(
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .circular(5),
                                                                          color: const Color(
                                                                              0xffEEE7F7),
                                                                        ),
                                                                        child: PopupMenuButton(
                                                                            padding: EdgeInsets.all(0),
                                                                            icon: Icon(
                                                                              Icons
                                                                                  .more_vert,
                                                                              color: ThemeText
                                                                                  .secondarycolor,
                                                                              size:
                                                                              15.0,
                                                                            ),
                                                                            offset: const Offset(0, 30),
                                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                                                            itemBuilder: (BuildContext context) => [
                                                                              PopupMenuItem(
                                                                                child: InkWell(
                                                                                  onTap: () {

                                                                                    providerdetailscontroller.providerdetailscreen({
                                                                                      "provider_id": providerlistcontroller.providerdata.value.data![i].prosId,
                                                                                    }, "providers_details");
                                                                                    Get.back();
                                                                                    providerdetails();
                                                                                  },
                                                                                  child: Row(
                                                                                    children: [
                                                                                      const Icon(IconlyLight.home, color: Colors.black, size: 17),
                                                                                      const SizedBox(
                                                                                        width: 10,
                                                                                      ),
                                                                                      Text(
                                                                                        Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myProviders!.menuItem1.toString(),
                                                                                        style: ThemeText.buttontab,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              PopupMenuItem(
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    Get.delete<Providerinsertcontroller>(force: true);
                                                                                    Get.put(Providerinsertcontroller()).status = 1;
                                                                                    Get.put(Providerinsertcontroller()).provider_id = providerlistcontroller.providerdata.value.data![i].prosId;
                                                                                    Get.put(Providerinsertcontroller()).providerupdatescreen();
                                                                                    Get.put(BasicinformationController()).providerstatus="0";
                                                                                    Get.put(Providerinsertcontroller()).update();
                                                                                    Get.back();
                                                                                    Get.put(Mailverficationcontroller()).mailverficationscreen(
                                                                                        {
                                                                                          "user_id":Getstore.box.read("userid").toString(),
                                                                                        },
                                                                                        "check_mail_verification");

                                                                                    // Get.toNamed(AppRoutes.serviceproviderform);
                                                                                    Get.toNamed(AppRoutes.serviceproviderform)!.then((data) {
                                                                                      Get.put(Providerlistcontroller())
                                                                                          .providerlistscreen({
                                                                                        "search": "",
                                                                                        "pros_accepted": "",
                                                                                        "user_id": Getstore.box.read("userid"),
                                                                                      }, "providers_list");
                                                                                    });
                                                                                  },
                                                                                  child: Row(
                                                                                    children: [
                                                                                      const Icon(IconlyLight.edit, color: Colors.black, size: 17),
                                                                                      const SizedBox(
                                                                                        width: 10,
                                                                                      ),
                                                                                      Text(
                                                                                        Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myProviders!.menuItem2.toString(),
                                                                                        style: ThemeText.buttontab,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              PopupMenuItem(
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    /*          Get.put(Providerinsertcontroller()).status=1;
                                                                              Get.put(Providerinsertcontroller()).provider_id= providerlistcontroller.providerdata
                                                                                  .value.data![i].prosId;
                                                                              Get.put(Providerinsertcontroller()).providerupdatescreen();
                                                                              Get.put(Providerinsertcontroller()).update();


                                                                              Get.toNamed(AppRoutes.serviceproviderform);*/

                                                                                    if (providerlistcontroller.providerdata.value.data![i].publish_status == "0") {
                                                                                      popupproviderpublishunpublish(providerlistcontroller.providerdata.value.data![i].prosId, Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myProviders!.menuItem5.toString(),"1","1");

                                                                                    } else {
                                                                                      popupproviderpublishunpublish(providerlistcontroller.providerdata.value.data![i].prosId, Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myProviders!.menuItem3.toString(),"0","1");
                                                                                    }
                                                                                  },
                                                                                  child: Row(
                                                                                    children: [
                                                                                      if (providerlistcontroller.providerdata.value.data![i].publish_status == "0") const Icon(Icons.visibility_outlined, color: Colors.black, size: 17) else const Icon(Icons.visibility_off_outlined, color: Colors.black, size: 17),
                                                                                      const SizedBox(
                                                                                        width: 10,
                                                                                      ),
                                                                                      if (providerlistcontroller.providerdata.value.data![i].publish_status == "0")
                                                                                        Text(
                                                                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myProviders!.menuItem5.toString(),
                                                                                          style: ThemeText.buttontab,
                                                                                        )
                                                                                      else
                                                                                        Text(
                                                                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myProviders!.menuItem3.toString(),
                                                                                          style: ThemeText.buttontab,
                                                                                        )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              // if(settingscontroller.settingsdata.value.data!.basic!=2)
                                                                              PopupMenuItem(
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    popupproviderdelete(providerlistcontroller.providerdata.value.data![i].prosId);
                                                                                  },
                                                                                  child: Row(
                                                                                    children: [
                                                                                      const Icon(IconlyLight.delete, color: Color(0xffFE3030), size: 17),
                                                                                      const SizedBox(
                                                                                        width: 10,
                                                                                      ),
                                                                                      Text(
                                                                                        Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myProviders!.menuItem4.toString(),
                                                                                        style: ThemeText.delete,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ])),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        vertical: 5.0,
                                                                        horizontal:
                                                                        5.0),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          providerlistcontroller
                                                                              .providerdata
                                                                              .value
                                                                              .data![
                                                                          i]
                                                                              .prosName,
                                                                          style:
                                                                          const TextStyle(
                                                                            color: Color(
                                                                                0xff0C1A30),
                                                                            fontSize:
                                                                            16.0,
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                          ),
                                                                        ),
                                                                        RatingBar
                                                                            .builder(
                                                                          ignoreGestures:
                                                                          true,
                                                                          tapOnlyMode:
                                                                          false,
                                                                          itemSize:
                                                                          15,
                                                                          initialRating: double.parse(providerlistcontroller
                                                                              .providerdata
                                                                              .value
                                                                              .data![
                                                                          i]
                                                                              .review
                                                                              .toString()),
                                                                          minRating:
                                                                          1,
                                                                          direction: Axis
                                                                              .horizontal,
                                                                          allowHalfRating:
                                                                          false,
                                                                          itemCount:
                                                                          5,
                                                                          itemPadding: const EdgeInsets
                                                                              .symmetric(
                                                                              horizontal:
                                                                              1.0),
                                                                          itemBuilder:
                                                                              (context,
                                                                              _) =>
                                                                          const Icon(
                                                                            Icons
                                                                                .star,
                                                                            color: Colors
                                                                                .amber,
                                                                          ),
                                                                          onRatingUpdate:
                                                                              (rating) {
                                                                            print(
                                                                                rating);
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  // Column(
                                                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                                                  //   children: [
                                                                  //
                                                                  //
                                                                  //   ],
                                                                  // ),
                                                                  Container(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        vertical: 5.0,
                                                                        horizontal:
                                                                        6.0),
                                                                    // width: 180.w,
                                                                    child: Html(
                                                                      data: providerlistcontroller
                                                                          .providerdata
                                                                          .value
                                                                          .data![i]
                                                                          .prosDescription,
                                                                      linkStyle:
                                                                      ThemeText
                                                                          .bodydata,
                                                                    ),
                                                                    // child: Text(
                                                                    //   "This Service can take up to",
                                                                    //   style: ThemeText
                                                                    //       .bodydata,
                                                                    // ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                ),
                                              )
                                          else
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Image(
                                                  image:
                                                  AssetImage("images/nodata.png"),
                                                )
                                              ],
                                            )
                                        ],
                                      ),
                                    );
                                  } else {
                                    return LoadingScreen();
                                  }
                                }),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
      }else{
        return Container(
          color: Colors.white,
          height: Get.height*1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: ThemeText.appcolor,
                  rightDotColor: ThemeText.basiccolor,
                  size: 70,
                ),
              )
            ],
          ),
        );
      }

    });
  }
}
