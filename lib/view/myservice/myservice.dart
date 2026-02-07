import 'package:animate_do/animate_do.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import '../../Controller/Catagories_controller/subcatagories_controller.dart';
import '../../Controller/Provider_Controller/provider_list_filter.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/Sevice_Schedule_Controller/schedule_list_controller.dart';
import '../../Controller/logincontroller.dart';
import '../commonpage/loader.dart';
import '/Controller/Service_Controller/Service_insert_Controller.dart';
import '/Controller/Service_Controller/Service_details_controller.dart';
import '/Controller/Service_Controller/Service_list_Controller.dart';
import '../commonpage/export.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class Myservice extends StatefulWidget {
  const Myservice({Key? key}) : super(key: key);

  @override
  State<Myservice> createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  // var data = ["sasi", "bharathi"];
  var intialindex1 = 0;
  ProviderListfiltercontroller providerListfiltercontroller = Get.put(ProviderListfiltercontroller());
  Servicelistcontroller servicelistcontroller = Get.put(Servicelistcontroller());
  Schedulelistcontroller schedulelistcontroller = Get.put(Schedulelistcontroller());
  SubCatagorieslistcontroller subCatagorieslistcontroller = Get.put(SubCatagorieslistcontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        if (providerListfiltercontroller.providerfilterresponseStatus.isFalse) {
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
                        // if (Get.previousRoute == Get.currentRoute) {
                        //   Get.back();
                        //   Get.back();
                        // }else{
                        //   Get.back();
                        // }
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
                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.title.toString(),
                  style: ThemeText.title1,
                ),
              ),
              bottomNavigationBar: const Bottomnavigation(
                item: 4,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: (servicelistcontroller
                  .servicelisteresponseStatus.isFalse)?(servicelistcontroller.servicedata.value.service_insert_status==1)?Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: FloatingActionButton(
                    // isExtended: true,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: ThemeText.appcolor,
                    onPressed: () {
                      // Fluttertoast.showToast(
                      //     msg: "This is Center Short Toast",
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.CENTER,
                      //     timeInSecForIosWeb: 1,
                      //     backgroundColor: Colors.red,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0
                      // );
                      Get.delete<Serviceinsertcontroller>(force: true);
                      Get.toNamed(AppRoutes.createservice);

                    },
                    child: const Icon(Icons.add),
                  )):const Text(""):const Text(""),
              body: Padding(
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: Get.height * 0.82,
                      child: DefaultTabController(
                        initialIndex: intialindex1,
                        length: providerListfiltercontroller
                            .providerlistfilterdata.value.dynamicOption!.length,
                        child: Column(
                          children: [
                            ButtonsTabBar(
                              backgroundColor: ThemeText.basiccolor,
                              radius: 5.0,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              unselectedBackgroundColor:
                                  const Color(0xffF0F1F3),
                              unselectedLabelStyle: ThemeText.buttontab,
                              labelStyle: ThemeText.textdata1,
                              onTap: (intialindex) {
                                for (var i = 0;
                                    i <
                                        providerListfiltercontroller
                                            .providerlistfilterdata
                                            .value
                                            .dynamicOption!
                                            .length;
                                    i++) {
                                  if (intialindex == i) {
                                    setState(() {
                                      intialindex1 = i;
                                    });
                                    if (providerListfiltercontroller
                                            .providerlistfilterdata
                                            .value
                                            .dynamicOption![i]
                                            .statusName ==
                                        "All") {
                                      Get.put(Servicelistcontroller())
                                          .servicelistscreen({
                                        "search": "",
                                        "user_id": Getstore.box.read("userid"),
                                      }, "service_list_by_user");
                                    } else {
                                      setState(() {
                                        intialindex1 = i;
                                      });
                                      Get.put(Servicelistcontroller())
                                          .servicelistscreen({
                                        "search": "",
                                        "user_id": Getstore.box.read("userid"),
                                        "filter": providerListfiltercontroller
                                            .providerlistfilterdata
                                            .value
                                            .dynamicOption![i]
                                            .mainStatusId,
                                      }, "service_list_by_user");
                                    }
                                  }
                                }
                              },
                              tabs: [
                                for (var i = 0;
                                    i <
                                        providerListfiltercontroller.providerlistfilterdata.value.dynamicOption!.length;
                                    i++)
                                  Tab(
                                    // icon: Icon(Icons.directions_car),
                                    text: providerListfiltercontroller.providerlistfilterdata.value.dynamicOption![i].statusName,
                                  ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  for (var i = 0;
                                      i < providerListfiltercontroller.providerlistfilterdata.value.dynamicOption!.length; i++)
                                    Obx(() {
                                      if (servicelistcontroller.servicelisteresponseStatus.isFalse) {
                                        return FadeInUp(
                                            duration:
                                                const Duration(seconds: 1),
                                            child: SingleChildScrollView(
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 6,
                                                          right: 6,
                                                          top: 6,
                                                          bottom: 6),
                                                  child: Column(
                                                    children: [
                                                      if (servicelistcontroller.servicedata.value.data!.isNotEmpty)
                                                        for (var i = 0;
                                                            i < servicelistcontroller.servicedata.value.data!.length;
                                                            i++)
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 6,
                                                                    bottom: 6),
                                                            child: InkWell(
                                                              onTap: () {
                                                                Get.put(Servicedetailscontroller())
                                                                    .servicedetailscreen({
                                                                  "service_id":
                                                                      servicelistcontroller.servicedata.value.data![i]["id"],
                                                                }, "service_details");
                                                                servicedetails();
                                                              },
                                                              child: Container(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        5.0,
                                                                    vertical:
                                                                        5.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    width: 1,
                                                                    color: ThemeText
                                                                        .basiccolor,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    // const Divider(
                                                                    //   color: Colors.green,
                                                                    //   thickness: 0.5,
                                                                    //   indent : 10,
                                                                    //   endIndent : 10,
                                                                    // ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Stack(
                                                                          children: [
                                                                            if (servicelistcontroller.servicedata.value.data![i]["service_image"] != null)
                                                                              Container(
                                                                                margin: const EdgeInsets.all(0.0),
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                ),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                  child: CachedNetworkImage(
                                                                                    fit: BoxFit.cover,
                                                                                    width: MediaQuery.of(context).size.width * 0.43,
                                                                                    height: Get.height * 0.17,
                                                                                    imageUrl: servicelistcontroller.servicedata.value.serviceImgPath! + servicelistcontroller.servicedata.value.data![i]["service_image"]!.split("|||")[0].toString(),
                                                                                    placeholder: (context, url) => Center(
                                                                                      child: LoadingAnimationWidget.twistingDots(
                                                                                        leftDotColor: ThemeText.appcolor,
                                                                                        rightDotColor: ThemeText.basiccolor,
                                                                                        size: 70,
                                                                                      ),
                                                                                    ),
                                                                                    errorWidget: (context, url, error) => Image(
                                                                                      fit: BoxFit.cover,
                                                                                      width: MediaQuery.of(context).size.width * 0.43,
                                                                                      height: Get.height * 0.17,
                                                                                      image: AssetImage("images/noimage.png"),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            else
                                                                              Container(
                                                                                margin: const EdgeInsets.all(0.0),
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                ),
                                                                                child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(5),
                                                                                    child: Image(
                                                                                      fit: BoxFit.cover,
                                                                                      width: MediaQuery.of(context).size.width * 0.43,
                                                                                      height: Get.height * 0.17,
                                                                                      image: const AssetImage("images/noimage.png"),
                                                                                    )),
                                                                              ),
                                                                            Align(
                                                                              alignment: Alignment.topRight,
                                                                              child: Card(
                                                                                color: const Color(0xffEEE7F7),
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                                                                                  child: Row(
                                                                                    children: [
                                                                                      Icon(
                                                                                        IconlyLight.star,
                                                                                        color: ThemeText.appcolor,
                                                                                        size: 17,
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Text(
                                                                                        "${servicelistcontroller.servicedata.value.data![i]["review"]}.0",
                                                                                        style: ThemeText.textdata1,
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(
                                                                            left:
                                                                                10,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(
                                                                                  left: 0,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      width: Get.width * 0.3,
                                                                                      child: Text(
                                                                                        servicelistcontroller.servicedata.value.data![i]["firstname"].toString(),
                                                                                        style: ThemeText.heading1,
                                                                                      ),
                                                                                    ),
                                                                                    PopupMenuButton(
                                                                                        icon: Icon(
                                                                                          Icons.more_vert,
                                                                                          color: ThemeText.secondarycolor,
                                                                                          size: 17.0,
                                                                                        ),
                                                                                        offset: const Offset(0, 50),
                                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                                                                        itemBuilder: (BuildContext context) => [
                                                                                              PopupMenuItem(
                                                                                                child: InkWell(
                                                                                                  onTap: () {
                                                                                                    Get.delete<Servicedetailscontroller>(force: true);
                                                                                                    Get.put(Servicedetailscontroller()).servicedetailscreen({
                                                                                                      "service_id": servicelistcontroller.servicedata.value.data![i]["id"],
                                                                                                    }, "service_details");
                                                                                                    Get.back();
                                                                                                    servicedetails();
                                                                                                  },
                                                                                                  child: Row(
                                                                                                    children: [
                                                                                                      const Icon(IconlyLight.home, color: Colors.black, size: 17),
                                                                                                      const SizedBox(
                                                                                                        width: 10,
                                                                                                      ),
                                                                                                      Text(
                                                                                                        Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.menu1.toString(),
                                                                                                        style: ThemeText.buttontab,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          PopupMenuItem(
                                                                                            child: InkWell(
                                                                                              onTap: () {
                                                                                                schedulelistcontroller.serviceId=servicelistcontroller.servicedata.value.data![i]["id"].toString();
                                                                                                schedulelistcontroller.update();
                                                                                                schedulelistcontroller.schedulelistscreen({
                                                                                                  "service_id":servicelistcontroller.servicedata.value.data![i]["id"],
                                                                                                  "date_filter":DateFormat('yyyy-MM-dd').format(DateTime.now()),
                                                                                                  // "service_id":"1",
                                                                                                  // "date_filter":"2024-04-24",
                                                                                                }, "schedule_list");
                                                                                                Get.back();
                                                                                                Get.toNamed(AppRoutes.servicesschedule);
                                                                                              },
                                                                                              child: Row(
                                                                                                children: [
                                                                                                  const Icon(Icons.schedule_outlined, color: Colors.black, size: 17),
                                                                                                  const SizedBox(
                                                                                                    width: 10,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.menu2.toString(),
                                                                                                    style: ThemeText.buttontab,
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                              PopupMenuItem(
                                                                                                child: InkWell(
                                                                                                  onTap: () {
                                                                                                    Get.delete<Serviceinsertcontroller>(force: true);
                                                                                                    Get.put(Serviceinsertcontroller()).service_id = servicelistcontroller.servicedata.value.data![i]["id"];
                                                                                                    Get.put(Serviceinsertcontroller()).update();

                                                                                                    Get.put(Serviceinsertcontroller()).serviceupdatescreen();
                                                                                                    Get.back();
                                                                                                    Get.toNamed(AppRoutes.createservice)!.then((value) => Get.put(Servicelistcontroller()).servicelistscreen({
                                                                                                          "search": "",
                                                                                                          "user_id": Getstore.box.read("userid"),
                                                                                                        }, "service_list_by_user"));
                                                                                                  },
                                                                                                  child: Row(
                                                                                                    children: [
                                                                                                      const Icon(IconlyLight.edit, color: Colors.black, size: 17),
                                                                                                      const SizedBox(
                                                                                                        width: 10,
                                                                                                      ),
                                                                                                      Text(
                                                                                                        Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.menu3.toString(),
                                                                                                        style: ThemeText.buttontab,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          PopupMenuItem(
                                                                                            child: InkWell(
                                                                                              onTap: () {
                                                                                                if (servicelistcontroller.servicedata.value.data![i]["service_featured"] == "0") {
                                                                                                  featured( servicelistcontroller.servicedata.value.data![i]["id"]);
                                                                                                }
                                                                                              },
                                                                                              child: Row(
                                                                                                children: [
                                                                                                  if (servicelistcontroller.servicedata.value.data![i]["service_featured"] == "0") const Icon(IconlyLight.star, color: Colors.black, size: 17) else const Icon(IconlyLight.star, color: Colors.black, size: 17),
                                                                                                  const SizedBox(
                                                                                                    width: 10,
                                                                                                  ),
                                                                                                  if (servicelistcontroller.servicedata.value.data![i]["service_featured"] == "0")
                                                                                                    Text(
                                                                                                      Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.menu8.toString(),
                                                                                                      style: ThemeText.buttontab,
                                                                                                    )
                                                                                                  else
                                                                                                    Text(
                                                                                                      Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.menu4.toString(),
                                                                                                      style: ThemeText.buttontab,
                                                                                                    )
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                              PopupMenuItem(
                                                                                                child: InkWell(
                                                                                                  onTap: () {
                                                                                                    if (servicelistcontroller.servicedata.value.data![i]["service_publish_status"] == "0") {
                                                                                                      popupproviderpublishunpublish(servicelistcontroller.servicedata.value.data![i]["id"], Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.menu7.toString(), "1", "0");
                                                                                                    } else {
                                                                                                      popupproviderpublishunpublish(servicelistcontroller.servicedata.value.data![i]["id"], Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.menu5.toString(), "0", "0");
                                                                                                    }
                                                                                                  },
                                                                                                  child: Row(
                                                                                                    children: [
                                                                                                      if (servicelistcontroller.servicedata.value.data![i]["service_publish_status"] == "0") const Icon(Icons.visibility_outlined, color: Colors.black, size: 17) else const Icon(Icons.visibility_off_outlined, color: Colors.black, size: 17),
                                                                                                      const SizedBox(
                                                                                                        width: 10,
                                                                                                      ),
                                                                                                      if (servicelistcontroller.servicedata.value.data![i]["service_publish_status"] == "0")
                                                                                                        Text(
                                                                                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.menu7.toString(),
                                                                                                          style: ThemeText.buttontab,
                                                                                                        )
                                                                                                      else
                                                                                                        Text(
                                                                                                          Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.menu5.toString(),
                                                                                                          style: ThemeText.buttontab,
                                                                                                        )
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              PopupMenuItem(
                                                                                                child: InkWell(
                                                                                                  onTap: () {
                                                                                                    Get.put(Serviceinsertcontroller()).service_id = servicelistcontroller.servicedata.value.data![i]["id"];
                                                                                                    Get.put(Serviceinsertcontroller()).update();
                                                                                                    popupdeleteservice(servicelistcontroller.servicedata.value.data![i]["id"]);
                                                                                                  },
                                                                                                  child: Row(
                                                                                                    children: [
                                                                                                      const Icon(IconlyLight.delete, color: Color(0xffFE3030), size: 17),
                                                                                                      const SizedBox(
                                                                                                        width: 10,
                                                                                                      ),
                                                                                                      Text(
                                                                                                        Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.menu6.toString(),
                                                                                                        style: ThemeText.delete,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ])
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width: Get.width * 0.4,
                                                                                child: Row(
                                                                                  children: [
                                                                                    const Icon(
                                                                                      Icons.description_outlined,
                                                                                      size: 15,
                                                                                      color: Color(0xff242424),
                                                                                    ),
                                                                                    const SizedBox(width: 5),
                                                                                   SizedBox(
                                                                                     width: Get.width * 0.34,
                                                                                     child:  Text(
                                                                                       servicelistcontroller.servicedata.value.data![i]["biography"].toString(),
                                                                                       style: ThemeText.bodydata,
                                                                                       maxLines: 2,
                                                                                       // endColor: ThemeText.basiccolor,
                                                                                       //
                                                                                       // duration: Duration(milliseconds: 500),
                                                                                     ),
                                                                                   )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 7,
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  const Icon(
                                                                                    IconlyLight.star,
                                                                                    size: 15,
                                                                                    color: Color(0xff242424),
                                                                                  ),
                                                                                  const SizedBox(width: 5),
                                                                                  Text(
                                                                                    "${servicelistcontroller.servicedata.value.data![i]["review"]}.0 (Over all review)",
                                                                                    style: ThemeText.bodydata,
                                                                                    // endColor: ThemeText.basiccolor,
                                                                                    //
                                                                                    // duration: Duration(milliseconds: 500),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 7,
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  const Icon(
                                                                                    IconlyLight.calendar,
                                                                                    size: 15,
                                                                                    color: Color(0xff242424),
                                                                                  ),
                                                                                  const SizedBox(width: 5),
                                                                                  Text(
                                                                                    servicelistcontroller.servicedata.value.data![i]["pros_created"].toString(),
                                                                                    style: ThemeText.bodydata,
                                                                                    // endColor: ThemeText.basiccolor,
                                                                                    //
                                                                                    // duration: Duration(milliseconds: 500),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 7,
                                                                              ),
                                                                              Row(children: [
                                                                                Text.rich(
                                                                                  TextSpan(
                                                                                    text: ' ',
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: '${Get.put(Settingscontroller()).settingsdata.value.data!.currencyData!.symbol.toString()} ${double.parse(servicelistcontroller.servicedata.value.data![i]["price"].toString()) - double.parse(servicelistcontroller.servicedata.value.data![i]["service_discount"].toString())}',
                                                                                        style: ThemeText.amount,
                                                                                      ),
                                                                                      const WidgetSpan(
                                                                                        child: SizedBox(width: 3), // Adjust the width as needed
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 3,
                                                                                ),
                                                                                Text.rich(
                                                                                  TextSpan(
                                                                                    text: ' ',
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: "${Get.put(Settingscontroller()).settingsdata.value.data!.currencyData!.symbol.toString()} ${servicelistcontroller.servicedata.value.data![i]["price"].toString()}",
                                                                                        style: TextStyle(
                                                                                          fontSize: 16,
                                                                                          color: ThemeText.secondarycolor,
                                                                                          decoration: TextDecoration.lineThrough,
                                                                                          decorationColor: ThemeText.secondarycolor,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              ])
                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                      else
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Image(
                                                              image: AssetImage(
                                                                  "images/nodata.png"),
                                                            )
                                                          ],
                                                        ),
                                                    ],
                                                  )),
                                            ));
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
                    ),

                    // const SizedBox(
                    //   height: 100,
                    // ),
                  ],
                ),
              ));
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
      }),
    );
  }
}
