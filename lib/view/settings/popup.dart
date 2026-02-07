
import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';
import 'package:intl/intl.dart';
import '../../Controller/Basicinformationcontroller.dart';
import '../../Controller/Provider_Controller/Publish_Unpublish_Controller.dart';
import '../../Controller/Review_list_Controller/review_dynamic_option_controller.dart';
import '../../Controller/Review_list_Controller/review_list_controller.dart';
import '../../Controller/Review_list_Controller/specific_review_controller.dart';
import '../../Controller/Service_Controller/featured_controller.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '/Controller/Address_delete_Controller.dart';
import '/Controller/Provider_Controller/Provider_Details_controller.dart';
import '/Controller/Service_Controller/Service_delete_Controller.dart';
import '/Controller/Service_Controller/Service_details_controller.dart';
import '/Controller/Service_Controller/Service_insert_Controller.dart';
import '/Controller/Service_Controller/Service_list_Controller.dart';
import '/Controller/logincontroller.dart';
import '/Controller/Provider_Controller/provider_delete_controller.dart';
import '/Controller/Provider_Controller/provider_insert_controller.dart';
import '/view/commonpage/export.dart';
Servicelistcontroller servicelistcontroller  = Get.put(Servicelistcontroller());
popupproviderdelete( var id) {
  return Get.defaultDialog(
    titlePadding: const EdgeInsets.symmetric(vertical: 15.0),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
    title: 'Delete',
    titleStyle:  TextStyle(
      color: ThemeText.headingcolor,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),
    confirm: Container(
      height: 40.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: FloatingActionButton(
        onPressed: () {

          Get.put(ProviderdeleteController()).providerdelete({
            "provider_id":id.toString(),
          }, "providers_delete").whenComplete(() =>providerlistcontroller.providerlistscreen({
            "search": "",
            "user_id": Getstore.box.read("userid"),
          }, "providers_list")
          ).whenComplete(() => Get.offNamed(AppRoutes.myprovider));
          Get.back();
          Get.back();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        mini: true,
        elevation: 5.0,
        child: const Icon(
          Icons.check,
          color: Colors.green,
        ),
      ),
    ),
    cancel: Container(
      height: 40.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: FloatingActionButton(
        onPressed: () {
Get.back();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        mini: true,
        elevation: 5.0,
        child: const Icon(
          Icons.clear,
          color: Colors.red,
        ),
      ),
    ),
    content: const Text(
      'Are you sure, do you want to Delete  Now ?',
      style: TextStyle(
          color: Color(0xff0F0F0F),
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          height: 2),
      textAlign: TextAlign.center,
    ),
    radius: 10.0,
  );
}

popupaddressdelete(var id){
  return Get.defaultDialog(
    titlePadding: const EdgeInsets.symmetric(vertical: 15.0),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
    title: 'Delete',
    titleStyle:  TextStyle(
      color: ThemeText.headingcolor,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),
    confirm: Container(
      height: 40.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: FloatingActionButton(
        onPressed: () {

          Get.put(Addressdeletecontroller()).addressdeletescreen({
            "user_id":Getstore.box.read("userid").toString(),
            "ad_id":id.toString(),
          }, "delete_address");
          Get.back();


        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        mini: true,
        elevation: 5.0,
        child: const Icon(
          Icons.check,
          color: Colors.green,
        ),
      ),
    ),
    cancel: Container(
      height: 40.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        mini: true,
        elevation: 5.0,
        child: const Icon(
          Icons.clear,
          color: Colors.red,
        ),
      ),
    ),
    content: const Text(
      'Are you sure, do you want to Delete the Address ?',
      style: TextStyle(
          color: Color(0xff0F0F0F),
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          height: 2),
      textAlign: TextAlign.center,
    ),
    radius: 10.0,
  );
}

popupdeleteservice(var id) {

  return Get.defaultDialog(
    titlePadding: const EdgeInsets.symmetric(vertical: 15.0),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
    title: 'Delete',
    titleStyle:  ThemeText.heading,
    confirm: Container(
      height: 40.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: FloatingActionButton(
        onPressed: () {

          Get.put(ServicedeleteController()).servicedelete({
            "service_id":id.toString()
          }, "service_delete");
          /*    .whenComplete(() =>      Get.put(Servicelistcontroller()).servicelistscreen({
            "search": "",
            "user_id": Getstore.box.read("userid"),
          }, "service_list_by_user")).whenComplete(() => Get.offNamed(AppRoutes.myservice));
          Get.back();
        */


        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        mini: true,
        elevation: 5.0,
        child: const Icon(
          Icons.check,
          color: Colors.green,
        ),
      ),
    ),
    cancel: Container(
      height: 40.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        mini: true,
        elevation: 5.0,
        child: const Icon(
          Icons.clear,
          color: Colors.red,
        ),
      ),
    ),
    content: const Text(
      'Are you sure, do you want to Delete the service Now ?',
      style: TextStyle(
          color: Color(0xff0F0F0F),
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          height: 2),
      textAlign: TextAlign.center,
    ),
    radius: 10.0,
  );
}




featured( var id) {
  return Get.defaultDialog(
    titlePadding: const EdgeInsets.symmetric(vertical: 15.0),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
    title: "Enable Featured",
    titleStyle: ThemeText.heading,
    confirm: Container(
      height: 40.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: FloatingActionButton(
        onPressed: () {


            Get.put(FeaturedController()).featureenable({
              "service_id":id.toString(),
              // "service_publish_status":status.toString(),
            }, "service_featured_change");


        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        mini: true,
        elevation: 5.0,
        child: const Icon(
          Icons.check,
          color: Colors.green,
        ),
      ),
    ),
    cancel: Container(
      height: 40.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        mini: true,
        elevation: 5.0,
        child: const Icon(
          Icons.clear,
          color: Colors.red,
        ),
      ),
    ),
    content:  const Text(
      'Are yo want to change this service as Featured click here to pay now ?',
      style: const TextStyle(
          color: Color(0xff0F0F0F),
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          height: 2),
      textAlign: TextAlign.center,
    ),
    radius: 10.0,
  );
}




popupproviderpublishunpublish( var id,var title,var status,var provider) {
  return Get.defaultDialog(
    titlePadding: const EdgeInsets.symmetric(vertical: 15.0),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
    title: title,
    titleStyle: ThemeText.heading,
    confirm: Container(
      height: 40.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: FloatingActionButton(
        onPressed: () {

if(provider=="1"){
  Get.put(Publishunpublishcontroller()).publishunpublishscreen({
    "pros_id":id.toString(),
    "publish_status":status.toString(),
  }, "provider_publish_status").whenComplete(() =>providerlistcontroller.providerlistscreen({
    "search": "",
    "user_id": Getstore.box.read("userid"),
  }, "providers_list")
  ).whenComplete(() => Get.offNamed(AppRoutes.myprovider));
  Get.back();
  Get.back();
}else{
  Get.put(Publishunpublishcontroller()).publishunpublishscreen({
    "service_id":id.toString(),
    "service_publish_status":status.toString(),
  }, "service_publish_status").whenComplete(() =>      Get.put(Servicelistcontroller()).servicelistscreen({
          "search": "",
          "user_id": Getstore.box.read("userid"),
          }, "service_list_by_user")).whenComplete(() => Get.offNamed(AppRoutes.myservice));
          Get.back();
          Get.back();
}

        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        mini: true,
        elevation: 5.0,
        child: const Icon(
          Icons.check,
          color: Colors.green,
        ),
      ),
    ),
    cancel: Container(
      height: 40.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        mini: true,
        elevation: 5.0,
        child: const Icon(
          Icons.clear,
          color: Colors.red,
        ),
      ),
    ),
    content:  Text(
      'Are you sure, do you want to ${title} Now ?',
      style: const TextStyle(
          color: const Color(0xff0F0F0F),
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          height: 2),
      textAlign: TextAlign.center,
    ),
    radius: 10.0,
  );
}





/*service details page*/

List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
List<bool> checkedItems = List.generate(4, (i) => false);
Providerdetailscontroller providerdetailscontroller =
    Get.put(Providerdetailscontroller());
Servicedetailscontroller servicedetailscontroller  = Get.put(Servicedetailscontroller());

servicedetails() {
  Get.bottomSheet(
    isScrollControlled: true,
    StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Obx((){
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              child:Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                child:(servicedetailscontroller.ServicedetailresponseStatus.isFalse) ?Column(
                  children: [
                    Container(
                      height: 70,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                        color: ThemeText.basiccolor,
                      ),
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            servicedetailscontroller.servicedata.value.data!["category_name"].toString(),
                            style: ThemeText.title1,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                const SizedBox(width: 3,),
                                InkWell(
                                  onTap:(){

                                    Get.put(Serviceinsertcontroller()).service_id=servicedetailscontroller.servicedata.value.data!["id"];
                                    Get.put(Serviceinsertcontroller()).update();
                                    popupdeleteservice(servicedetailscontroller.servicedata.value.data!["id"]);


                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(5),
                                        color: const Color(0xffFAD8D2),
                                      ),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                            vertical: 5.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              IconlyLight.delete,
                                              color: ThemeText.deleteicon,
                                              size: 15.0,
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 3,),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.close_rounded,
                                      color: Colors.black,
                                      size: 25.0,
                                    ),
                                  ),
                                ),
                              ]
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.85,
                      child: ListView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: SizedBox(
                                    height: 250,
                                    child: ( servicedetailscontroller
                                        .servicedata
                                        .value
                                        .data!
                                    ["service_image"]!=null)?Swiper(
                                      itemHeight: 250,
                                      itemWidth: 350,
                                      autoplay: false,
                                      itemCount:( servicedetailscontroller
                                          .servicedata
                                          .value
                                          .data!
                                      ["service_image"]!=null)?
                                      servicedetailscontroller
                                          .servicedata
                                          .value
                                          .data!
                                          ["service_image"]!
                                          .split("|||")
                                          .length:1,
                                      itemBuilder:
                                          (BuildContext context,
                                          int index) {
                                        return InkWell(
                                          onTap: () {},
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(
                                                5),
                                            child: ImageFade(
                                              width: 40,
                                              // whenever the image changes, it will be loaded, and then faded in:
                                              image: NetworkImage(
                                                servicedetailscontroller
                                                    .servicedata
                                                    .value
                                                    .serviceImgPath! +
                                                    servicedetailscontroller
                                                        .servicedata
                                                        .value
                                                        .data!
                                                    ["service_image"]!
                                                        .split("|||")[index],
                                              ),

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
                                                      size: 70,
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
                                                      size: 70,
                                                    ),
                                                  ),
                                            ),
                                          ),
                                        );
                                      },
                                      pagination: SwiperPagination(
                                          margin: EdgeInsets.zero,
                                          builder:
                                          SwiperCustomPagination(
                                              builder: (context,
                                                  config) {
                                                return ConstrainedBox(
                                                  constraints:
                                                  const BoxConstraints
                                                      .expand(
                                                      height: 35.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Align(
                                                          //alignment: Alignment.center,
                                                          child: Padding(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                10.0),
                                                            child: DotSwiperPaginationBuilder(
                                                                color: Colors.white,
                                                                activeColor: ThemeText.appcolor,
                                                                //  autoPlayCurve: Curves.fastOutSlowIn,
                                                                size: 10.0,
                                                                activeSize: 12.0)
                                                                .build(context, config),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              })),
                                      control: SwiperControl(
                                        color: ThemeText.appcolor,
                                      ),
                                    ): Image(
                                      fit: BoxFit.cover,
                                      width:Get.width*1,
                                      height: Get.height*0.2,
                                      image:
                                      const AssetImage("images/noimage.png"),
                                    )
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8, right: 8),
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
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 5.0,
                                                        horizontal: 5.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                         Text(
                                                           servicedetailscontroller.servicedata.value.data!["firstname"].toString(),
                                                          style:  TextStyle(
                                                            color:
                                                            ThemeText.headingcolor,
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                            FontWeight.w600,
                                                          ),
                                                        ),

                                                        RatingBarIndicator(
                                                          rating: double.parse(servicedetailscontroller.servicedata.value.review.toString()),
                                                          itemBuilder: (context, index) => const Icon(
                                                            // _selectedIcon ?? Icons.star,
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                          itemCount: 5,
                                                          itemSize: 20,
                                                          unratedColor: Colors.amber.withAlpha(50),
                                                          direction:Axis.horizontal,
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                  padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 5.0),
                                                  // width: 180.w,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5),
                                                              color: const Color(0xffEEE7F7),
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets.symmetric(
                                                                  horizontal: 10.0, vertical: 5.0),
                                                              child: Text(
                                                                servicedetailscontroller.servicedata.value.data!["category_name"].toString(),
                                                                style: ThemeText.text,
                                                                textAlign: TextAlign.center,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                          children:[
                                                            Text.rich(
                                                              TextSpan(
                                                                text: ' ',
                                                                children: [
                                                                  TextSpan(
                                                                    text:  '${Get.put(Settingscontroller()).settingsdata.value.data!.currencyData!.symbol.toString()} ${double.parse(servicedetailscontroller.servicedata.value.data!["price"].toString())-double.parse(servicedetailscontroller.servicedata.value.data!["service_discount"].toString())}',
                                                                    style: ThemeText.amount,
                                                                  ),
                                                                  const WidgetSpan(
                                                                    child: SizedBox(width: 3), // Adjust the width as needed
                                                                  ),



                                                                ],
                                                              ),

                                                            ),
                                                            const SizedBox(
                                                                width:3,
                                                            ),
                                                            Text.rich(
                                                              TextSpan(
                                                                text: ' ',
                                                                children: [
                                                                  TextSpan(

                                                                    text: "${Get.put(Settingscontroller()).settingsdata.value.data!.currencyData!.symbol.toString()} ${servicedetailscontroller.servicedata.value.data!["price"].toString()}",
                                                                    style:   TextStyle(
                                                                      fontSize: 16,
                                                                      color:ThemeText.secondarycolor ,
                                                                      decoration: TextDecoration.lineThrough,
                                                                      decorationColor:ThemeText.secondarycolor,
                                                                    ),
                                                                  ),

                                                                ],
                                                              ),

                                                            )
                                                          ]
                                                      )




                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8, right: 5),
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
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 6.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children:  [
                                                    Text(
                                                      Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.description.toString(),
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
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 6.0),
                                                child: Divider(
                                                  color: Color(0xffEEE7F7),
                                                  //color of divider
                                                  height: 5,
                                                  //height spacing of divider
                                                  thickness: 1,
                                                  //thickness of divier line
                                                  indent: 0,
                                                  //spacing at the start of divider
                                                  endIndent:
                                                  0, //spacing at the end of divider
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 6.0),
                                                // width: 180.w,
                                                child: Text(
                                                  servicedetailscontroller.servicedata.value.data!["biography"].toString(),
                                                  style: ThemeText.bodydata,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8, right: 8),
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
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                     Text(
                                                       Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.duration.toString(),
                                                      style: TextStyle(
                                                        color: ThemeText.headingcolor,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                      ),
                                                    ),
                                                    if(servicedetailscontroller.servicedata.value.data!["service_duration"]!="")
                                                    Text(
                                                      "${servicedetailscontroller.servicedata.value.data!["service_duration"]} hours",
                                                      style: ThemeText.textdata1,

                                                      // endColor: ThemeText.basiccolor,
                                                      //
                                                      // duration: Duration(milliseconds: 500),
                                                    )
                                    else
                                                      Text(
                                                        "Fixed",
                                                        style: ThemeText.textdata1,

                                                        // endColor: ThemeText.basiccolor,
                                                        //
                                                        // duration: Duration(milliseconds: 500),
                                                      )

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
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 6.0),
                                                // width: 180.w,
                                                child: Text(
                                                  "This Service can take up to",
                                                  style: ThemeText.bodydata,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
if(servicedetailscontroller.servicedata.value.data!["service_image"]!=null)
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8, right: 5),
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
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 6.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children:  [
                                                    Text(
                                                      Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.galleries.toString(),
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
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 6.0),
                                                child: Divider(
                                                  color: Color(0xffEEE7F7),
                                                  //color of divider
                                                  height: 5,
                                                  //height spacing of divider
                                                  thickness: 1,
                                                  //thickness of divier line
                                                  indent: 0,
                                                  //spacing at the start of divider
                                                  endIndent:
                                                  0, //spacing at the end of divider
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 6.0),
                                                height: Get.height * 0.15,
                                                // width: 180.w,
                                                // decoration: BoxDecoration(
                                                //   // color:ThemeText.basiccolor, // Set your desired color here
                                                //   borderRadius: BorderRadius.circular(15), // Set your desired border radius here
                                                // ),
                                                child: ListView(
                                                  scrollDirection:
                                                  Axis.horizontal,
                                                  children: [
                                                    for (var i = 0; i <  servicedetailscontroller.servicedata.value.data!["service_image"]!.split("|||").length; i++)
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                            right: 5),
                                                        child: Container(
                                                          width: Get.width * 0.3,
                                                          decoration:
                                                          BoxDecoration(
                                                            // color:ThemeText.basiccolor, // Set your desired color here
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                5), // Set your desired border radius here
                                                          ),
                                                          child: OPopupTrigger(
                                                            triggerWidget:
                                                            ClipRRect(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5),
                                                              child: ImageFade(
                                                                width: 40,
                                                                // whenever the image changes, it will be loaded, and then faded in:
                                                                image:
                                                                 NetworkImage(
                                                                   servicedetailscontroller
                                                                       .servicedata
                                                                       .value
                                                                       .serviceImgPath! +
                                                                       servicedetailscontroller
                                                                           .servicedata
                                                                           .value
                                                                           .data!
                                                                       ["service_image"]!
                                                                           .split("|||")[i],
                                                                ),

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
                                                                Alignment
                                                                    .center,
                                                                fit: BoxFit.cover,
                                                                scale: 2,

                                                                // shown behind everything:
                                                                // placeholder:  Center(
                                                                //     child:  SpinKitRipple(
                                                                //       color: Color(0xffde2127),
                                                                //       size: 50.0,
                                                                //     )
                                                                // ),

                                                                // shows progress while loading an image:
                                                                loadingBuilder: (context,
                                                                    progress,
                                                                    chunkEvent) =>
                                                                 Center(
                                                                    child:
                                                                    SpinKitRipple(
                                                                      color:ThemeText.basiccolor,
                                                                      size: 50.0,
                                                                    )),

                                                                // displayed when an error occurs:
                                                                errorBuilder: (context,
                                                                    error) =>
                                                                const Center(
                                                                    child:
                                                                    SpinKitRipple(
                                                                      color: Color(
                                                                          0xffde2127),
                                                                      size: 50.0,
                                                                    )),
                                                              ),
                                                            ),
                                                            popupHeader: OPopupContent
                                                                .standardizedHeader(
                                                                ''),
                                                            popupContent:
                                                            PinchZoom(
                                                              resetDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                  100),
                                                              maxScale: 4,
                                                              onZoomStart: () {
                                                                print(
                                                                    'Start zooming');
                                                              },
                                                              onZoomEnd: () {
                                                                print(
                                                                    'Stop zooming');
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    10),
                                                                child: ImageFade(
                                                                  width: 40,
                                                                  // whenever the image changes, it will be loaded, and then faded in:
                                                                  image:
                                                                   NetworkImage(
                                                                    servicedetailscontroller
                                                                        .servicedata
                                                                        .value
                                                                        .serviceImgPath! +
                                                                        servicedetailscontroller
                                                                            .servicedata
                                                                            .value
                                                                            .data!
                                                                        ["service_image"]!
                                                                            .split("|||")[i],
                                                                  ),

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
                                                                  Alignment
                                                                      .center,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  scale: 2,

                                                                  // shown behind everything:
                                                                  // placeholder:  Center(
                                                                  //     child:  SpinKitRipple(
                                                                  //       color: Color(0xffde2127),
                                                                  //       size: 50.0,
                                                                  //     )
                                                                  // ),

                                                                  // shows progress while loading an image:
                                                                  loadingBuilder: (context,
                                                                      progress,
                                                                      chunkEvent) =>
                                                                  const Center(
                                                                      child:
                                                                      SpinKitRipple(
                                                                        color: Color(
                                                                            0xffde2127),
                                                                        size: 50.0,
                                                                      )),

                                                                  // displayed when an error occurs:
                                                                  errorBuilder: (context,
                                                                      error) =>
                                                                  const Center(
                                                                      child:
                                                                      SpinKitRipple(
                                                                        color: Color(
                                                                            0xffde2127),
                                                                        size: 50.0,
                                                                      )),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                if(servicedetailscontroller.servicedata.value.data!["service_image"]!=null)
                                const SizedBox(
                                  height: 20,
                                ),

/*
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8),
                                  child: Container(
                                    // padding: const EdgeInsets.symmetric(
                                    //     horizontal: 3.0, vertical: 3.0),

                                      decoration: BoxDecoration(
                                        // color:ThemeText.basiccolor, // Set your desired color here
                                        borderRadius:
                                        BorderRadius.circular(
                                            5), // Set your desired border radius here
                                      ),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              5),
                                          //set border radius more than 50% of height and width to make circle
                                        ),
                                        shadowColor:
                                        ThemeText.basiccolor,
                                        elevation: 7,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .symmetric(
                                                    vertical: 5.0,
                                                    horizontal:
                                                    5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: const [
                                                    Text(
                                                      "Service Availability",
                                                      style:
                                                      TextStyle(
                                                        color: Color(
                                                            0xff0C1A30),
                                                        fontSize:
                                                        16.0,
                                                        fontWeight:
                                                        FontWeight
                                                            .w600,
                                                      ),
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
                                    *//*          if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_24hrs"].toString())["service_allday"]!="1")
                                                Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 5.0,
                                                        horizontal:
                                                        6.0),
                                                    // width: 180.w,
                                                    child: Column(
                                                      children: [
                                                        if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["monday"] ==
                                                            "1")
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Mon",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "Start time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["monday_opening"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "End time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["monday_closing"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              )
                                                            ],
                                                          ),
                                                        if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["tuesday"] ==
                                                            "1")
                                                          const SizedBox(
                                                            height:
                                                            20,
                                                          ),
                                                        if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["tuesday"] ==
                                                            "1")
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Tus",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "Start time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["tuesday_opening"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "End time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["tuesday_closing"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              )
                                                            ],
                                                          ),
                                                        if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["wednesday"] ==
                                                            "1")
                                                          const SizedBox(
                                                            height:
                                                            20,
                                                          ),
                                                        if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["wednesday"] ==
                                                            "1")
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Wed",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "Start time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["wednesday_opening"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "End time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["wednesday_closing"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              )
                                                            ],
                                                          ),
                                                        if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["thursday"] ==
                                                            "1")
                                                          const SizedBox(
                                                            height:
                                                            20,
                                                          ),
                                                        if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["thursday"] ==
                                                            "1")
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Thu",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "Start time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["thursday_opening"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "End time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["thursday_closing"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              )
                                                            ],
                                                          ),
                                                        if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["friday"] ==
                                                            "1")
                                                          const SizedBox(
                                                            height:
                                                            20,
                                                          ),
                                                        if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["friday"] ==
                                                            "1")
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Fri",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "Start time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["friday_opening"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "End time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["friday_closing"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              )
                                                            ],
                                                          ),
                                                        if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["saturday"] ==
                                                            "1")
                                                          const SizedBox(
                                                            height:
                                                            20,
                                                          ),
                                                        if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["saturday"] ==
                                                            "1")
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Sat",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "Start time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["saturday_opening"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "End time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["saturday_closing"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              )
                                                            ],
                                                          ),
                                                        if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["sunday"] ==
                                                            "1")
                                                          const SizedBox(
                                                            height:
                                                            20,
                                                          ),
                                                        if (jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["sunday"] == "1")
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Sun",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "Start time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["sunday_opening"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              ),
                                                              Text(
                                                                "End time (${jsonDecode(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_time"].toString())["sunday_closing"]})",
                                                                style:
                                                                ThemeText.bodydata,
                                                              )

                                                            ],
                                                          ),
                                                      ],
                                                    ))
                                              else
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(padding:const EdgeInsets.only(left:5),
                                                      child:  Text(
                                                        "Available of full week working time",
                                                        style: ThemeText.bodydata,
                                                      ),
                                                    )
                                                  ],
                                                ),*//*
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),*/
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8, right: 8),
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
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 6.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children:  [
                                                    Text(
                                                      Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.reviewRatings.toString(),
                                                      style: TextStyle(
                                                        color: ThemeText.headingcolor,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Get.put(Reviewdynamiccontroller()).reviewdynamicoptionscreen("dynamic_option_review");
                                                        Get.put(Specificservicereviewcontroller()).specificservicereviewscreen({
                                                          "user_id":Getstore.box.read("userid").toString(),
                                                          "service_id":servicedetailscontroller.servicedata.value.data!["id"],
                                                          //  "user_id":"3",
                                                          //  "service_id":"1",
                                                          "filter":"",
                                                        }, "review_page");


                                                        Get.toNamed(AppRoutes.specificservicereview);
                                                      },
                                                      child: Text(
                                                        Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myServices!.reviewRatings.toString(),
                                                        style: ThemeText.textdata1,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 6.0),
                                                child: Divider(
                                                  color: Color(0xffEEE7F7),
                                                  //color of divider
                                                  height: 5,
                                                  //height spacing of divider
                                                  thickness: 1,
                                                  //thickness of divier line
                                                  indent: 0,
                                                  //spacing at the start of divider
                                                  endIndent:
                                                  0, //spacing at the end of divider
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 6.0),
                                                width: Get.width * 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      servicedetailscontroller
                                                          .servicedata
                                                          .value
                                                          .review!.toDouble().toString(),
                                                      style: ThemeText.datepic,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),

                                                    RatingBar.builder(
                                                      ignoreGestures: true,
                                                      tapOnlyMode: false,
                                                      itemSize: 25,
                                                      initialRating: double.parse( servicedetailscontroller.servicedata.value.review!.toString()),
                                                      minRating: 1,
                                                      direction: Axis.horizontal,
                                                      allowHalfRating: false,
                                                      itemCount: 5,
                                                      itemPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 1.0),
                                                      itemBuilder: (context, _) =>
                                                      const Icon(
                                                        IconlyLight.star,
                                                        color: Colors.amber,
                                                      ),
                                                      onRatingUpdate: (rating) {
                                                        print(rating);
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    // Text(
                                                    //   "Reviews (1)",
                                                    //   style: ThemeText.bodydata,
                                                    // ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 6.0),
                                                child: Divider(
                                                  color: Color(0xffEEE7F7),
                                                  //color of divider
                                                  height: 5,
                                                  //height spacing of divider
                                                  thickness: 1,
                                                  //thickness of divier line
                                                  indent: 0,
                                                  //spacing at the start of divider
                                                  endIndent:
                                                  0, //spacing at the end of divider
                                                ),
                                              ),
          //                                     if( servicedetailscontroller.servicedata.value.reviwer_name=="")
          //
          //                                     InkWell(
          // onTap:(){
          //   Get.put(Reviewlistcontroller()).reviewlistscreen({
          //                                     "filter":"1",
          //                                     "user_id":Getstore.box.read("userid"),
          //                                     //"user_id":"1",
          //                                     }, "review_list");
          //                                     // HomeState.advancedDrawerController.hideDrawer();
          //                                     Get.toNamed(AppRoutes.reviews);
          //                                     },
          // child:Container(
          // padding:
          // const EdgeInsets.symmetric(
          // horizontal: 5.0,
          // vertical: 5.0),
          // decoration: BoxDecoration(
          // border: Border.all(
          // width: 1,
          // color: ThemeText.basiccolor,
          // ),
          // borderRadius:
          // BorderRadius.circular(5.0),
          // ),
          // child: Column(
          // mainAxisAlignment:
          // MainAxisAlignment.start,
          // children: [
          // // const Divider(
          // //   color: Colors.green,
          // //   thickness: 0.5,
          // //   indent : 10,
          // //   endIndent : 10,
          // // ),
          // Row(
          // mainAxisAlignment:
          // MainAxisAlignment.start,
          // crossAxisAlignment:
          // CrossAxisAlignment
          //     .start,
          // children: [
          // Container(
          // margin: const EdgeInsets
          //     .only(
          // top: 6.0,
          // bottom: 6.0),
          // decoration:
          // BoxDecoration(
          // borderRadius:
          // BorderRadius
          //     .circular(
          // 5.0),
          // ),
          // child: ClipRRect(
          // borderRadius:
          // BorderRadius
          //     .circular(
          // 5),
          // child: ImageFade(
          // width: MediaQuery.of(
          // context)
          //     .size
          //     .width *
          // 0.25,
          // // whenever the image changes, it will be loaded, and then faded in:
          // image:( servicedetailscontroller.servicedata.value.reviwer_image=="")?
          // const NetworkImage(
          // "https://img.freepik.com/premium-photo/user-icon_867433-72.jpg",
          // ):   NetworkImage(
          // servicedetailscontroller.servicedata.value.reviwer_image.toString(),
          // ),
          //
          // // slow-ish fade for loaded images:
          // duration:
          // const Duration(
          // milliseconds:
          // 900),
          //
          // // if the image is loaded synchronously (ex. from memory), fade in faster:
          // syncDuration:
          // const Duration(
          // milliseconds:
          // 150),
          //
          // // supports most properties of Image:
          // alignment:
          // Alignment
          //     .center,
          // fit: BoxFit.cover,
          // scale: 2,
          //
          // // shown behind everything:
          // // placeholder:  Center(
          // //     child:  SpinKitRipple(
          // //       color: Color(0xffde2127),
          // //       size: 50.0,
          // //     )
          // // ),
          //
          // // shows progress while loading an image:
          // loadingBuilder: (context,
          // progress,
          // chunkEvent) =>
          // const Center(
          // child:
          // SpinKitRipple(
          // color: Color(
          // 0xffE2D9FA),
          // size: 50.0,
          // )),
          //
          // // displayed when an error occurs:
          // errorBuilder: (context,
          // error) =>
          // const Center(
          // child:
          // SpinKitRipple(
          // color: Color(
          // 0xffE2D9FA),
          // size: 50.0,
          // )),
          // )),
          // ),
          // Padding(
          // padding:
          // const EdgeInsets
          //     .only(
          // left: 10,
          // ),
          // child: Column(
          // mainAxisAlignment:
          // MainAxisAlignment
          //     .start,
          // crossAxisAlignment:
          // CrossAxisAlignment
          //     .start,
          // children: [
          // Row(
          // mainAxisAlignment:
          // MainAxisAlignment
          //     .spaceBetween,
          // children: [
          // SizedBox(
          // width:
          // Get.width *
          // 0.40,
          // child: Text(
          // servicedetailscontroller.servicedata.value.reviwer_name.toString(),
          // style: ThemeText
          //     .heading1,
          // ),
          // ),
          // Card(
          // color: const Color(
          // 0xffEEE7F7),
          // elevation: 0,
          // shape:
          // RoundedRectangleBorder(
          // borderRadius:
          // BorderRadius.circular(
          // 5),
          // ),
          // child:
          // Padding(
          // padding: const EdgeInsets
          //     .symmetric(
          // horizontal:
          // 8.0,
          // vertical:
          // 3.0),
          // child: Row(
          // children: [
          // Icon(
          // Icons
          //     .star,
          // color:
          // ThemeText.appcolor,
          // size:
          // 17,
          // ),
          // const SizedBox(
          // width:
          // 5,
          // ),
          // Text(
          // "${ servicedetailscontroller.servicedata.value.review}.0",
          // style:
          // ThemeText.textdata1,
          // ),
          // const SizedBox(
          // width:
          // 5,
          // ),
          // ],
          // ),
          // ),
          // ),
          // ],
          // ),
          // Row(
          // children: [
          // Text(
          // servicedetailscontroller.servicedata.value.reviwer_msg.toString(),
          // style: ThemeText
          //     .bodydata,
          // // endColor: ThemeText.basiccolor,
          // //
          // // duration: Duration(milliseconds: 500),
          // ),
          // ],
          // ),
          // const SizedBox(
          // height: 7,
          // ),
          // ],
          // ),
          // )
          // ],
          // )
          // ],
          // ),
          // )
          //
          // )
          //                                     else
          //
          //                                       Card(
          //                                           elevation: 4.0,
          //                                           shape:
          //                                           RoundedRectangleBorder(
          //                                             borderRadius:
          //                                             BorderRadius
          //                                                 .circular(15.0),
          //                                           ),
          //                                           child: Container(
          //                                             width: Get.width * 1,
          //                                             height:
          //                                             Get.height * 0.1,
          //                                             decoration:
          //                                             BoxDecoration(
          //                                               borderRadius:
          //                                               BorderRadius
          //                                                   .circular(10),
          //                                               color: ThemeText
          //                                                   .basiccolor,
          //                                               boxShadow: [
          //                                                 BoxShadow(
          //                                                     color: ThemeText
          //                                                         .basiccolor,
          //                                                     spreadRadius:
          //                                                     3),
          //                                               ],
          //                                             ),
          //                                             child: Center(
          //                                               child: Text(
          //                                                 "Review not yet posted",
          //                                                 style: ThemeText
          //                                                     .heading1,
          //                                               ),
          //                                             ),
          //                                           )),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ): Center(
                  child: LoadingAnimationWidget.twistingDots(
                    leftDotColor: ThemeText.appcolor,
                    rightDotColor: ThemeText.basiccolor,
                    size: 70,
                  ),
                ),)
          );
        });
      },
    ),
  );
}

/*provider details*/
providerdetails() {
  Get.bottomSheet(


    isScrollControlled: true,
    StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Obx(() {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                child:
                    (providerdetailscontroller.providerdetailresponseStatus.isFalse)
                        ? Column(
                            children: [
                              Container(
                                height: 70,
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      topLeft: Radius.circular(5)),
                                  color: ThemeText.basiccolor,
                                ),
                                alignment: Alignment.topRight,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      providerdetailscontroller
                                          .providerdata.value.data!.prosName,
                                      style: ThemeText.title1,
                                    ),
                                   Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children:[
                                    /*   InkWell(
                                         onTap:(){
                                           // Get.delete<Providerinsertcontroller>(force: true).whenComplete(() {})
                                           // Get.put(Providerinsertcontroller()).data=[];
                                          setState((){
                                            Get.put(Providerinsertcontroller()).status=1;
                                            Get.put(Providerinsertcontroller()).provider_id=providerdetailscontroller.providerdata.value.data!.prosId;
                                            Get.put(Providerinsertcontroller()).update();
                                            Get.put(BasicinformationController()).providerstatus="0";
                                            Get.put(Providerinsertcontroller()).providerupdatescreen();
                                            Get.put(Providerinsertcontroller()).update();
                                            Get.back();
                                            Get.toNamed(AppRoutes.serviceproviderform);
                                          });


                                         },
                                           child: Padding(
                                             padding: const EdgeInsets.only(
                                                 left: 0, right: 5),
                                             child: Container(
                                               decoration: BoxDecoration(
                                                 borderRadius:
                                                 BorderRadius.circular(5),
                                                 color: const Color(0xffEEE7F7),
                                               ),
                                               child: Padding(
                                                 padding:
                                                 const EdgeInsets.symmetric(
                                                     horizontal: 10.0,
                                                     vertical: 5.0),
                                                 child: Row(
                                                   children: [
                                                     Icon(
                                                       IconlyLight.edit,
                                                       color: ThemeText.appcolor,
                                                       size: 15.0,
                                                     ),
                                                     const SizedBox(width: 5,),
                                                     Text(
                                                       "Edit",
                                                       style: ThemeText.text,
                                                       textAlign: TextAlign.center,
                                                     )
                                                   ],
                                                 ),
                                               ),
                                             ),
                                           ),
                                       ),*/
                                       const SizedBox(width: 3,),
                                       // InkWell(
                                       //   onTap:(){
                                       //
                                       //
                                       //     popupproviderdelete(providerdetailscontroller
                                       //         .providerdata.value.data!.prosId);
                                       //
                                       //
                                       //   },
                                       //   child: Padding(
                                       //     padding: const EdgeInsets.only(
                                       //         left: 0, right: 5),
                                       //     child: Container(
                                       //       decoration: BoxDecoration(
                                       //         borderRadius:
                                       //         BorderRadius.circular(5),
                                       //         color: const Color(0xffFAD8D2),
                                       //       ),
                                       //       child: Padding(
                                       //         padding:
                                       //         const EdgeInsets.symmetric(
                                       //             horizontal: 10.0,
                                       //             vertical: 5.0),
                                       //         child: Row(
                                       //           children: [
                                       //             Icon(
                                       //               IconlyLight.delete,
                                       //               color: ThemeText.deleteicon,
                                       //               size: 15.0,
                                       //             ),
                                       //
                                       //           ],
                                       //         ),
                                       //       ),
                                       //     ),
                                       //   ),
                                       // ),
                                       const SizedBox(width: 3,),
                                       GestureDetector(
                                         onTap: () {
                                           Get.back();
                                         },
                                         child: Container(
                                           width: 30.0,
                                           height: 30.0,
                                           alignment: Alignment.center,
                                           decoration: BoxDecoration(
                                             borderRadius:
                                             BorderRadius.circular(5.0),
                                             color: Colors.white,
                                           ),
                                           child: const Icon(
                                             Icons.close_rounded,
                                             color: Colors.black,
                                             size: 25.0,
                                           ),
                                         ),
                                       ),
                                     ]
                                   )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.85,
                                child: ListView(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: SizedBox(
                                              height: 250,
                                              child: Swiper(
                                                itemHeight: 250,
                                                itemWidth: 350,
                                                autoplay: false,
                                                itemCount:
                                                    providerdetailscontroller
                                                        .providerdata
                                                        .value
                                                        .data!
                                                        .prosFiles
                                                        .split("|||")
                                                        .length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return InkWell(
                                                    onTap: () {},
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: ImageFade(
                                                        width: 40,
                                                        // whenever the image changes, it will be loaded, and then faded in:
                                                        image: NetworkImage(
                                                          providerdetailscontroller
                                                                  .providerdata
                                                                  .value
                                                                  .imagePath! +
                                                              providerdetailscontroller.providerdata.value.data!.prosFiles.split("|||")[index],
                                                        ),

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
                                                            size: 70,
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
                                                            size: 70,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                pagination: SwiperPagination(
                                                    margin: EdgeInsets.zero,
                                                    builder:
                                                        SwiperCustomPagination(
                                                            builder: (context,
                                                                config) {
                                                      return ConstrainedBox(
                                                        constraints:
                                                            const BoxConstraints
                                                                    .expand(
                                                                height: 35.0),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(
                                                              child: Align(
                                                                //alignment: Alignment.center,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          10.0),
                                                                  child: DotSwiperPaginationBuilder(
                                                                          color: Colors.white,
                                                                          activeColor: ThemeText.appcolor,
                                                                          //  autoPlayCurve: Curves.fastOutSlowIn,
                                                                          size: 10.0,
                                                                          activeSize: 12.0)
                                                                      .build(context, config),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    })),
                                                control: SwiperControl(
                                                  color: ThemeText.appcolor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 5),
                                            child: Container(
                                                // padding: const EdgeInsets.symmetric(
                                                //     horizontal: 3.0, vertical: 3.0),

                                                decoration: BoxDecoration(
                                                  // color:ThemeText.basiccolor, // Set your desired color here
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5), // Set your desired border radius here
                                                ),
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    //set border radius more than 50% of height and width to make circle
                                                  ),
                                                  shadowColor:
                                                      ThemeText.basiccolor,
                                                  elevation: 7,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
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
                                                                    providerdetailscontroller
                                                                        .providerdata
                                                                        .value
                                                                        .data!
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
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius.circular(5),
                                                                      color: const Color(0xffEEE7F7),
                                                                    ),
                                                                    child: Padding(
                                                                      padding:
                                                                      const EdgeInsets.symmetric(
                                                                          horizontal: 10.0,
                                                                          vertical: 5.0),
                                                                      child: Text(
                                                                        providerdetailscontroller
                                                                            .providerdata
                                                                            .value
                                                                            .data!
                                                                            .providertypeName,
                                                                        style: ThemeText.text,
                                                                        textAlign: TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),

                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        5.0,
                                                                    horizontal:
                                                                        5.0),
                                                            // width: 180.w,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    const Icon(
                                                                      IconlyLight
                                                                          .calendar,
                                                                      size: 15,
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      "Created at ${providerdetailscontroller.providerdata.value.data!.created}",
                                                                      style: ThemeText
                                                                          .bodydata,
                                                                    ),

                                                                  ],
                                                                ),
                                                                RatingBar
                                                                    .builder(
                                                                  ignoreGestures:
                                                                  true,
                                                                  tapOnlyMode:
                                                                  false,
                                                                  itemSize:
                                                                  20,
                                                                  initialRating: double.parse(providerdetailscontroller
                                                                      .providerdata
                                                                      .value
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
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 5),
                                            child: InkWell(
                                                onTap: () {

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
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              child: ImageFade(
                                                                width:
                                                                    Get.width *
                                                                        1,
                                                                height:
                                                                    Get.height *
                                                                        0.2,
                                                                // whenever the image changes, it will be loaded, and then faded in:
                                                                image:
                                                                    const NetworkImage(
                                                                  "https://4.bp.blogspot.com/_iUQ4XXaHze0/TGei1KkmHJI/AAAAAAAAAAw/1ORJaOI2UgI/s1600/coimbatore.gif",
                                                                ),

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
                                                                    Alignment
                                                                        .center,
                                                                fit: BoxFit
                                                                    .cover,
                                                                scale: 2,

                                                                // shown behind everything:
                                                                // placeholder:  Center(
                                                                //     child:  SpinKitRipple(
                                                                //       color: Color(0xffde2127),
                                                                //       size: 50.0,
                                                                //     )
                                                                // ),

                                                                // shows progress while loading an image:
                                                                loadingBuilder: (context,
                                                                        progress,
                                                                        chunkEvent) =>
                                                                    const Center(
                                                                        child:
                                                                            SpinKitRipple(
                                                                  color: Color(
                                                                      0xffE2D9FA),
                                                                  size: 50.0,
                                                                )),

                                                                // displayed when an error occurs:
                                                                errorBuilder: (context,
                                                                        error) =>
                                                                    const Center(
                                                                        child:
                                                                            SpinKitRipple(
                                                                  color: Color(
                                                                      0xffE2D9FA),
                                                                  size: 50.0,
                                                                )),
                                                              )),
                                                        ],
                                                      ),
                                                      for(var i=0;i<providerdetailscontroller.providerdata.value.address!.length;i++)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left:5.0,right:5.0,top:2),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 4.0,
                                                                  horizontal:
                                                                      6.0),
                                                          // width: 180.w,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Icon(
                                                                IconlyLight
                                                                    .location,
                                                                size: 15,
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                             SizedBox(
                                                               width:Get.width*0.82,
                                                               child: Text(
                                                                 providerdetailscontroller
                                                                     .providerdata
                                                                     .value
                                                                     .address![i]
                                                                     .adAddresses,
                                                                 style: ThemeText
                                                                     .bodydata,
                                                                 textAlign:
                                                                 TextAlign
                                                                     .start,
                                                               )
                                                             )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 5),
                                            child: Container(
                                                // padding: const EdgeInsets.symmetric(
                                                //     horizontal: 3.0, vertical: 3.0),

                                                decoration: BoxDecoration(
                                                  // color:ThemeText.basiccolor, // Set your desired color here
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5), // Set your desired border radius here
                                                ),
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    //set border radius more than 50% of height and width to make circle
                                                  ),
                                                  shadowColor:
                                                      ThemeText.basiccolor,
                                                  elevation: 7,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5.0,
                                                                  horizontal:
                                                                      5.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children:  [
                                                              Text(
                                                                Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myProviders!.availability.toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: ThemeText.headingcolor,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
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
                                                        if (providerdetailscontroller
                                                                .providerdata
                                                                .value
                                                                .data!
                                                                .checkallday ==
                                                            "0")
                                                          Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5.0,
                                                                  horizontal:
                                                                      6.0),
                                                              // width: 180.w,
                                                              child: Column(
                                                                children: [
                                                                  if (providerdetailscontroller
                                                                          .providerdata
                                                                          .value
                                                                          .data!
                                                                          .prosTime["monday"] ==
                                                                      "1")
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                         "Mon",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "Start time (${providerdetailscontroller.providerdata.value.data!.prosTime["monday_opening"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "End time (${providerdetailscontroller.providerdata.value.data!.prosTime["monday_closing"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  if (providerdetailscontroller
                                                                          .providerdata
                                                                          .value
                                                                          .data!
                                                                          .prosTime["tuesday"] ==
                                                                      "1")
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                  if (providerdetailscontroller
                                                                          .providerdata
                                                                          .value
                                                                          .data!
                                                                          .prosTime["tuesday"] ==
                                                                      "1")
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                         "Tus",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "Start time (${providerdetailscontroller.providerdata.value.data!.prosTime["tuesday_opening"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "End time (${providerdetailscontroller.providerdata.value.data!.prosTime["tuesday_closing"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  if (providerdetailscontroller
                                                                          .providerdata
                                                                          .value
                                                                          .data!
                                                                          .prosTime["wednesday"] ==
                                                                      "1")
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                  if (providerdetailscontroller
                                                                          .providerdata
                                                                          .value
                                                                          .data!
                                                                          .prosTime["wednesday"] ==
                                                                      "1")
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                         "Wed",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "Start time (${providerdetailscontroller.providerdata.value.data!.prosTime["wednesday_opening"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "End time (${providerdetailscontroller.providerdata.value.data!.prosTime["wednesday_closing"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  if (providerdetailscontroller
                                                                          .providerdata
                                                                          .value
                                                                          .data!
                                                                          .prosTime["thursday"] ==
                                                                      "1")
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                  if (providerdetailscontroller
                                                                          .providerdata
                                                                          .value
                                                                          .data!
                                                                          .prosTime["thursday"] ==
                                                                      "1")
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          "Thu",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "Start time (${providerdetailscontroller.providerdata.value.data!.prosTime["thursday_opening"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "End time (${providerdetailscontroller.providerdata.value.data!.prosTime["thursday_closing"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  if (providerdetailscontroller
                                                                          .providerdata
                                                                          .value
                                                                          .data!
                                                                          .prosTime["friday"] ==
                                                                      "1")
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                  if (providerdetailscontroller
                                                                          .providerdata
                                                                          .value
                                                                          .data!
                                                                          .prosTime["friday"] ==
                                                                      "1")
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          "Fri",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "Start time (${providerdetailscontroller.providerdata.value.data!.prosTime["friday_opening"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "End time (${providerdetailscontroller.providerdata.value.data!.prosTime["friday_closing"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  if (providerdetailscontroller
                                                                          .providerdata
                                                                          .value
                                                                          .data!
                                                                          .prosTime["saturday"] ==
                                                                      "1")
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                  if (providerdetailscontroller
                                                                          .providerdata
                                                                          .value
                                                                          .data!
                                                                          .prosTime["saturday"] ==
                                                                      "1")
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          "Sat",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "Start time (${providerdetailscontroller.providerdata.value.data!.prosTime["saturday_opening"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "End time (${providerdetailscontroller.providerdata.value.data!.prosTime["saturday_closing"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  if (providerdetailscontroller
                                                                          .providerdata
                                                                          .value
                                                                          .data!
                                                                          .prosTime["sunday"] ==
                                                                      "1")
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                  if (providerdetailscontroller.providerdata.value.data!.prosTime["sunday"] == "1")
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          "Sun",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "Start time (${providerdetailscontroller.providerdata.value.data!.prosTime["sunday_opening"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        ),
                                                                        Text(
                                                                          "End time (${providerdetailscontroller.providerdata.value.data!.prosTime["sunday_closing"]})",
                                                                          style:
                                                                              ThemeText.bodydata,
                                                                        )

                                                                      ],
                                                                    ),
                                                                ],
                                                              ))
                                                        else
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                             Padding(padding:const EdgeInsets.only(left:5),
                                                             child:  Text(
                                                               Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myProviders!.availabilityContent.toString(),
                                                               style: ThemeText.bodydata,
                                                             ),
                                                               )
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 5),
                                            child: Container(
                                                // padding: const EdgeInsets.symmetric(
                                                //     horizontal: 3.0, vertical: 3.0),

                                                decoration: BoxDecoration(
                                                  // color:ThemeText.basiccolor, // Set your desired color here
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5), // Set your desired border radius here
                                                ),
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    //set border radius more than 50% of height and width to make circle
                                                  ),
                                                  shadowColor:
                                                      ThemeText.basiccolor,
                                                  elevation: 7,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
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
                                                                 Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.myProviders!.discription.toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: ThemeText.headingcolor,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
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
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5.0,
                                                                  horizontal:
                                                                      6.0),
                                                          // width: 180.w,
                                                          child: Text(
                                                            providerdetailscontroller
                                                                .providerdata
                                                                .value
                                                                .data!
                                                                .prosDescription,
                                                            style: ThemeText
                                                                .bodydata,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          /*   Padding(
                            padding: const EdgeInsets.only(left: 8,right: 8),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 5.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [


                                              const  Text(
                                                "Featured Services",
                                                style: TextStyle(
                                                  color: ThemeText.headingcolor,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                              Text(
                                                'View All',
                                                style: ThemeText.text,

                                                // endColor: ThemeText.basiccolor,
                                                //
                                                // duration: Duration(milliseconds: 500),
                                              ),

                                            ],
                                          ),
                                        ),

                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 6.0),
                                          child:  Divider(
                                            color: Color(0xffEEE7F7), //color of divider
                                            height: 5, //height spacing of divider
                                            thickness: 1, //thickness of divier line
                                            indent: 0, //spacing at the start of divider
                                            endIndent: 0, //spacing at the end of divider
                                          ),
                                        ),

                                        Container(
                                            margin: const EdgeInsets.symmetric(vertical: 0.0),
                                            height: 250.0,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: <Widget>[
                                                for (var i = 0; i < 5; i++)
                                                  InkWell(
                                                      onTap: (){
                                                        //    Get.toNamed(AppRoutes.serviceviewpage);
                                                      },
                                                      child: SizedBox(

                                                        width: MediaQuery.of(context).size.width*0.5,
                                                        child:  Card(
                                                          elevation: 5.0,
                                                          child: Column(
                                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                    BorderRadius.circular(5),
                                                                    child:  ClipRRect(
                                                                        borderRadius: BorderRadius.circular(5),
                                                                        child: ImageFade(
                                                                          // width:
                                                                          //     MediaQuery.of(context).size.width * 0.43,
                                                                          // whenever the image changes, it will be loaded, and then faded in:
                                                                          image: const NetworkImage(
                                                                            "https://c8.alamy.com/comp/DBFHM8/woman-having-hair-cut-in-salon-DBFHM8.jpg",
                                                                          ),
                                                                          // slow-ish fade for loaded images:
                                                                          duration: const Duration(milliseconds: 900),

                                                                          // if the image is loaded synchronously (ex. from memory), fade in faster:
                                                                          syncDuration:
                                                                          const Duration(milliseconds: 150),

                                                                          // supports most properties of Image:
                                                                          alignment: Alignment.center,
                                                                          fit: BoxFit.cover,
                                                                          scale: 2,

                                                                          // shown behind everything:
                                                                          // placeholder:  Center(
                                                                          //     child:  SpinKitRipple(
                                                                          //       color: Color(0xffde2127),
                                                                          //       size: 50.0,
                                                                          //     )
                                                                          // ),

                                                                          // shows progress while loading an image:
                                                                          loadingBuilder:
                                                                              (context, progress, chunkEvent) =>
                                                                          const Center(
                                                                              child: SpinKitRipple(
                                                                                color: Color(0xffE2D9FA),
                                                                                size: 50.0,
                                                                              )),

                                                                          // displayed when an error occurs:
                                                                          errorBuilder: (context, error) =>
                                                                          const Center(
                                                                              child: SpinKitRipple(
                                                                                color: Color(0xffE2D9FA),
                                                                                size: 50.0,
                                                                              )),
                                                                        )),
                                                                  ),

                                                                  Align(
                                                                    alignment: Alignment.topRight,
                                                                    child: Card(
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(50),
                                                                      ),
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.symmetric(
                                                                            horizontal: 3.0,
                                                                            vertical: 3.0),
                                                                        child: InkWell(
                                                                          onTap: () {


                                                                          },
                                                                          child:  const Icon(
                                                                            Icons.favorite_border_outlined,
                                                                            color:
                                                                            Color(0xffDE2127),
                                                                            size: 20,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              const SizedBox(height: 5),
                                                              SizedBox(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(left:5),
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        SizedBox(
                                                                          child: Text(
                                                                            "Cleanup",
                                                                            style: ThemeText.heading1,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(height: 5),
                                                                        Text(
                                                                          'Your service will take approximate 2 hrs',

                                                                          style: ThemeText.subconten,
                                                                          // endColor: ThemeText.basiccolor,
                                                                          //
                                                                          // duration: Duration(milliseconds: 500),
                                                                        ),

                                                                        const SizedBox(height: 5),
                                                                        Text(
                                                                          '\$ 500000',
                                                                          style: ThemeText.amount,
                                                                          // endColor: ThemeText.basiccolor,
                                                                          //
                                                                          // duration: Duration(milliseconds: 500),
                                                                        ),
                                                                        const SizedBox(height: 5),
                                                                        RatingBar.builder(
                                                                          ignoreGestures: true,
                                                                          tapOnlyMode: false,
                                                                          itemSize: 10,
                                                                          initialRating: 3,
                                                                          minRating: 1,
                                                                          direction: Axis.horizontal,
                                                                          allowHalfRating: false,
                                                                          itemCount: 5,
                                                                          itemPadding: const EdgeInsets.symmetric(
                                                                              horizontal: 2.0),
                                                                          itemBuilder: (context, _) => const Icon(
                                                                            Icons.star,
                                                                            color: Colors.amber,
                                                                          ),
                                                                          onRatingUpdate: (rating) {
                                                                            print(rating);
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                  )
                                              ],
                                            )),
                                        const SizedBox(
                                          height:20,
                                        ),

                                      ],
                                    ),
                                  ),
                                )
                            ),),*/
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          )
                        : Center(
                            child: LoadingAnimationWidget.twistingDots(
                              leftDotColor: ThemeText.appcolor,
                              rightDotColor: ThemeText.basiccolor,
                              size: 70,
                            ),
                          )),
          );
        });
      },
    ),

  );
}

DateTime? monday_start = DateTime.tryParse(DateFormat("hh:mm").format(DateTime.now()));
DateTime? monday_end = DateTime.tryParse(DateFormat.Hm().format(DateTime.now()));
DateTime? tues_start = DateTime.tryParse(DateFormat("hh:mm").format(DateTime.now()));
DateTime? tues_end = DateTime.tryParse(DateFormat.Hm().format(DateTime.now()));
DateTime? wed_start = DateTime.tryParse(DateFormat("hh:mm").format(DateTime.now()));
DateTime? wed_end = DateTime.tryParse(DateFormat.Hm().format(DateTime.now()));
DateTime? thurs_start = DateTime.tryParse(DateFormat("hh:mm").format(DateTime.now()));
DateTime? thurs_end = DateTime.tryParse(DateFormat.Hm().format(DateTime.now()));
DateTime? fri_start = DateTime.tryParse(DateFormat("hh:mm").format(DateTime.now()));
DateTime? fri_end = DateTime.tryParse(DateFormat.Hm().format(DateTime.now()));
DateTime? sat_start = DateTime.tryParse(DateFormat("hh:mm").format(DateTime.now()));
DateTime? sat_end = DateTime.tryParse(DateFormat.Hm().format(DateTime.now()));
DateTime? sun_start = DateTime.tryParse(DateFormat("hh:mm").format(DateTime.now()));
DateTime? sun_end = DateTime.tryParse(DateFormat.Hm().format(DateTime.now()));
/*provider time */
providertime() {
  Get.bottomSheet(
    isScrollControlled: true,
    StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Card(
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    'Choose Time',
                    style: ThemeText.title1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Start Time', style: ThemeText.title1),
                          TimePickerSpinner(

                            time: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 0),
                            is24HourMode: false,
                            normalTextStyle: TextStyle(
                                fontSize: 15, color: ThemeText.basiccolor),
                            highlightedTextStyle:  TextStyle(
                                fontSize: 15, color: ThemeText.appcolor),
                            spacing: 10,
                            itemHeight: 90,
                            isForce2Digits: true,
                            minutesInterval: 1,
                            onTimeChange: (time) {
                              if (ServiceproviderformState.selectdate == 1) {
                                setState(() {
                                  monday_start = time;
                                });
                              } else if (ServiceproviderformState.selectdate ==
                                  2) {
                                setState(() {
                                  tues_start = time;
                                });
                              } else if (ServiceproviderformState.selectdate ==
                                  3) {
                                setState(() {
                                  wed_start = time;
                                });
                              } else if (ServiceproviderformState.selectdate ==
                                  4) {
                                setState(() {
                                  thurs_start = time;
                                });
                              } else if (ServiceproviderformState.selectdate ==
                                  5) {
                                setState(() {
                                  fri_start = time;
                                });
                              } else if (ServiceproviderformState.selectdate ==
                                  6) {
                                setState(() {
                                  sat_start = time;
                                });
                              } else if (ServiceproviderformState.selectdate ==
                                  7) {
                                setState(() {
                                  sun_start = time;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('End Time', style: ThemeText.title1),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: TimePickerSpinner(

                              time:DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 21, 0),
                              is24HourMode: false,
                              normalTextStyle: TextStyle(
                                  fontSize: 15, color: ThemeText.basiccolor),
                              highlightedTextStyle:  TextStyle(
                                  fontSize: 15, color: ThemeText.appcolor),
                              spacing: 10,
                              itemHeight: 90,
                              isForce2Digits: true,
                              minutesInterval: 1,
                              onTimeChange: (time) {
                                if (ServiceproviderformState.selectdate == 1) {
                                  setState(() {
                                    monday_end = time;
                                  });
                                } else if (ServiceproviderformState
                                        .selectdate ==
                                    2) {
                                  setState(() {
                                    tues_end = time;
                                  });
                                } else if (ServiceproviderformState
                                        .selectdate ==
                                    3) {
                                  setState(() {
                                    wed_end = time;
                                  });
                                } else if (ServiceproviderformState
                                        .selectdate ==
                                    4) {
                                  setState(() {
                                    thurs_end = time;
                                  });
                                } else if (ServiceproviderformState
                                        .selectdate ==
                                    5) {
                                  setState(() {
                                    fri_end = time;
                                  });
                                } else if (ServiceproviderformState
                                        .selectdate ==
                                    6) {
                                  setState(() {
                                    sat_end = time;
                                  });
                                } else if (ServiceproviderformState
                                        .selectdate ==
                                    7) {
                                  setState(() {
                                    sun_end = time;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
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
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (states) {
                              return  ThemeText.appcolor;
                            },
                          ),
                        ),
                        child: Text(
                          "Apply".toUpperCase(),
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        onPressed: () {

                          if (Get.put(Providerinsertcontroller()).mondaydata ==
                                  true &&
                              ServiceproviderformState.selectdate == 1) {
                            Duration? diff =
                            monday_end?.difference(monday_start!);
                            if ((monday_start == monday_end) ||
                                (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Providerinsertcontroller())
                                      .mondaydata ==
                                  true) {
                                Get.put(Providerinsertcontroller()).monday =
                                    "Monday";
                                Get.put(Providerinsertcontroller()).mon_check =
                                    1;

                                Get.put(Providerinsertcontroller())
                                        .monday_start
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(monday_start!)
                                        .toString();
                                Get.put(Providerinsertcontroller())
                                        .monday_end
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(monday_end!)
                                        .toString();
                                Get.put(Providerinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          } else if (Get.put(Providerinsertcontroller())
                                      .tuesdaydata ==
                                  true &&
                              ServiceproviderformState.selectdate == 2) {
                            Duration? diff = tues_end?.difference(tues_start!);
                            if ((tues_start == tues_end) ||
                                (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Providerinsertcontroller())
                                      .tuesdaydata ==
                                  true) {
                                Get.put(Providerinsertcontroller()).tuesday =
                                    "Tuesday";
                                Get.put(Providerinsertcontroller()).tue_check =
                                    1;
                                Get.put(Providerinsertcontroller())
                                        .tuesday_start
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(tues_start!)
                                        .toString();
                                Get.put(Providerinsertcontroller())
                                        .tuesday_end
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(tues_end!)
                                        .toString();
                                Get.put(Providerinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          } else if (Get.put(Providerinsertcontroller())
                                      .wednesdaydata ==
                                  true &&
                              ServiceproviderformState.selectdate == 3) {
                            Duration? diff = wed_end?.difference(wed_start!);
                            if ((wed_start == wed_end) || (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Providerinsertcontroller())
                                      .wednesdaydata ==
                                  true) {
                                Get.put(Providerinsertcontroller()).wednesday =
                                    "Wednesday";
                                Get.put(Providerinsertcontroller()).wed_check =
                                    1;
                                Get.put(Providerinsertcontroller())
                                        .wednesday_start
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(wed_start!)
                                        .toString();
                                Get.put(Providerinsertcontroller())
                                        .wednesday_end
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(wed_end!)
                                        .toString();
                                Get.put(Providerinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          } else if (Get.put(Providerinsertcontroller())
                                      .thursdaydata ==
                                  true &&
                              ServiceproviderformState.selectdate == 4) {
                            Duration? diff = thurs_end?.difference(thurs_start!);
                            if ((thurs_start == thurs_end) ||
                                (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Providerinsertcontroller())
                                      .thursdaydata ==
                                  true) {
                                Get.put(Providerinsertcontroller()).thursday =
                                    "Thursday";
                                Get.put(Providerinsertcontroller())
                                    .thurs_check = 1;
                                Get.put(Providerinsertcontroller())
                                        .thursday_start
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(thurs_start!)
                                        .toString();
                                Get.put(Providerinsertcontroller())
                                        .thursday_end
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(thurs_end!)
                                        .toString();
                                Get.put(Providerinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          } else if (Get.put(Providerinsertcontroller())
                                      .fridaydata ==
                                  true &&
                              ServiceproviderformState.selectdate == 5) {
                            Duration? diff = fri_end?.difference(fri_start!);
                            if ((fri_start == fri_end) || (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Providerinsertcontroller())
                                      .fridaydata ==
                                  true) {
                                Get.put(Providerinsertcontroller()).friday =
                                    "Friday";
                                Get.put(Providerinsertcontroller()).fri_check =
                                    1;
                                Get.put(Providerinsertcontroller())
                                        .friday_start
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(fri_start!)
                                        .toString();
                                Get.put(Providerinsertcontroller())
                                        .friday_end
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(fri_end!)
                                        .toString();
                                Get.put(Providerinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          } else if (Get.put(Providerinsertcontroller())
                                      .saturdaydata ==
                                  true &&
                              ServiceproviderformState.selectdate == 6) {
                            Duration? diff = sat_end?.difference(sat_start!);
                            if ((sat_start == sat_end) || (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Providerinsertcontroller())
                                      .saturdaydata ==
                                  true) {
                                Get.put(Providerinsertcontroller()).saturday =
                                    "Saturday";
                                Get.put(Providerinsertcontroller()).sat_check =
                                    1;
                                Get.put(Providerinsertcontroller())
                                        .saturday_start
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(sat_start!)
                                        .toString();
                                Get.put(Providerinsertcontroller())
                                        .saturday_end
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(sat_end!)
                                        .toString();
                                Get.put(Providerinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          } else if (Get.put(Providerinsertcontroller())
                                      .sundaydata ==
                                  true &&
                              ServiceproviderformState.selectdate == 7) {
                            Duration? diff = sun_end?.difference(sun_start!);
                            if ((sun_start == sun_end) || (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Providerinsertcontroller())
                                      .sundaydata ==
                                  true) {
                                Get.put(Providerinsertcontroller()).sunday =
                                    "Sunday";
                                Get.put(Providerinsertcontroller()).sun_check =
                                    1;
                                Get.put(Providerinsertcontroller())
                                        .sunday_start
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(sun_start!)
                                        .toString();
                                Get.put(Providerinsertcontroller())
                                        .sunday_end
                                        .text =
                                    DateFormat('hh:mm a')
                                        .format(sun_end!)
                                        .toString();
                                Get.put(Providerinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          }
                        },
                      ),
                    ),
                  )
                ],
              )),
        );
      },
    ),
  );
}







/*Service time*/
Servicetime() {
  Get.bottomSheet(
    isScrollControlled: true,
    StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Card(
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Choose Time',
                    style: ThemeText.title1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Start Time', style: ThemeText.title1),
                          TimePickerSpinner(
                            is24HourMode: false,
                            normalTextStyle: TextStyle(
                                fontSize: 15, color: ThemeText.basiccolor),
                            highlightedTextStyle:  TextStyle(
                                fontSize: 15, color: ThemeText.appcolor),
                            spacing: 10,
                            itemHeight: 60,
                            isForce2Digits: true,
                            minutesInterval: 1,
                            onTimeChange: (time) {
                              if (CreateserviceState.selectdate == 1) {
                                setState(() {
                                  monday_start = time;
                                });
                              } else if (CreateserviceState.selectdate ==
                                  2) {
                                setState(() {
                                  tues_start = time;
                                });
                              } else if (CreateserviceState.selectdate ==
                                  3) {
                                setState(() {
                                  wed_start = time;
                                });
                              } else if (CreateserviceState.selectdate ==
                                  4) {
                                setState(() {
                                  thurs_start = time;
                                });
                              } else if (CreateserviceState.selectdate ==
                                  5) {
                                setState(() {
                                  fri_start = time;
                                });
                              } else if (CreateserviceState.selectdate ==
                                  6) {
                                setState(() {
                                  sat_start = time;
                                });
                              } else if (CreateserviceState.selectdate ==
                                  7) {
                                setState(() {
                                  sun_start = time;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('End Time', style: ThemeText.title1),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: TimePickerSpinner(
                              time: DateTime.now().add(const Duration(
                                minutes: 5,
                              )),
                              is24HourMode: false,
                              normalTextStyle: TextStyle(
                                  fontSize: 15, color: ThemeText.basiccolor),
                              highlightedTextStyle:  TextStyle(
                                  fontSize: 15, color: ThemeText.appcolor),
                              spacing: 10,
                              itemHeight: 60,
                              isForce2Digits: true,
                              minutesInterval: 1,
                              onTimeChange: (time) {
                                if (CreateserviceState.selectdate == 1) {
                                  setState(() {
                                    monday_end = time;
                                  });
                                } else if (CreateserviceState
                                    .selectdate ==
                                    2) {
                                  setState(() {
                                    tues_end = time;
                                  });
                                } else if (CreateserviceState
                                    .selectdate ==
                                    3) {
                                  setState(() {
                                    wed_end = time;
                                  });
                                } else if (CreateserviceState
                                    .selectdate ==
                                    4) {
                                  setState(() {
                                    thurs_end = time;
                                  });
                                } else if (CreateserviceState
                                    .selectdate ==
                                    5) {
                                  setState(() {
                                    fri_end = time;
                                  });
                                } else if (CreateserviceState
                                    .selectdate ==
                                    6) {
                                  setState(() {
                                    sat_end = time;
                                  });
                                } else if (CreateserviceState
                                    .selectdate ==
                                    7) {
                                  setState(() {
                                    sun_end = time;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
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
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (states) {
                              return  ThemeText.appcolor;
                            },
                          ),
                        ),
                        child: Text(
                          "Apply".toUpperCase(),
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        onPressed: () {

                          if (Get.put(Serviceinsertcontroller()).mondaydata ==
                              true &&
                              CreateserviceState.selectdate == 1) {
                            Duration? diff =
                            monday_end?.difference(monday_start!);
                            if ((monday_start == monday_end) ||
                                (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Serviceinsertcontroller())
                                  .mondaydata ==
                                  true) {
                                Get.put(Serviceinsertcontroller()).monday =
                                "Monday";
                                Get.put(Serviceinsertcontroller()).mon_check =
                                1;

                                Get.put(Serviceinsertcontroller())
                                    .monday_start
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(monday_start!)
                                        .toString();
                                Get.put(Serviceinsertcontroller())
                                    .monday_end
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(monday_end!)
                                        .toString();
                                Get.put(Serviceinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          } else if (Get.put(Serviceinsertcontroller())
                              .tuesdaydata ==
                              true &&
                              CreateserviceState.selectdate == 2) {
                            Duration? diff = tues_end?.difference(tues_start!);
                            if ((tues_start == tues_end) ||
                                (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Serviceinsertcontroller())
                                  .tuesdaydata ==
                                  true) {
                                Get.put(Serviceinsertcontroller()).tuesday =
                                "Tuesday";
                                Get.put(Serviceinsertcontroller()).tue_check =
                                1;
                                Get.put(Serviceinsertcontroller())
                                    .tuesday_start
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(tues_start!)
                                        .toString();
                                Get.put(Serviceinsertcontroller())
                                    .tuesday_end
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(tues_end!)
                                        .toString();
                                Get.put(Serviceinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          } else if (Get.put(Serviceinsertcontroller())
                              .wednesdaydata ==
                              true &&
                              CreateserviceState.selectdate == 3) {
                            Duration? diff = wed_end?.difference(wed_start!);
                            if ((wed_start == wed_end) || (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Serviceinsertcontroller())
                                  .wednesdaydata ==
                                  true) {
                                Get.put(Serviceinsertcontroller()).wednesday =
                                "Wednesday";
                                Get.put(Serviceinsertcontroller()).wed_check =
                                1;
                                Get.put(Serviceinsertcontroller())
                                    .wednesday_start
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(wed_start!)
                                        .toString();
                                Get.put(Serviceinsertcontroller())
                                    .wednesday_end
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(wed_end!)
                                        .toString();
                                Get.put(Serviceinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          } else if (Get.put(Serviceinsertcontroller())
                              .thursdaydata ==
                              true &&
                              CreateserviceState.selectdate == 4) {
                            Duration? diff = thurs_end?.difference(thurs_start!);
                            if ((thurs_start == thurs_end) ||
                                (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Serviceinsertcontroller())
                                  .thursdaydata ==
                                  true) {
                                Get.put(Serviceinsertcontroller()).thursday =
                                "Thursday";
                                Get.put(Serviceinsertcontroller())
                                    .thurs_check = 1;
                                Get.put(Serviceinsertcontroller())
                                    .thursday_start
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(thurs_start!)
                                        .toString();
                                Get.put(Serviceinsertcontroller())
                                    .thursday_end
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(thurs_end!)
                                        .toString();
                                Get.put(Serviceinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          } else if (Get.put(Serviceinsertcontroller())
                              .fridaydata ==
                              true &&
                              CreateserviceState.selectdate == 5) {
                            Duration? diff = fri_end?.difference(fri_start!);
                            if ((fri_start == fri_end) || (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Serviceinsertcontroller())
                                  .fridaydata ==
                                  true) {
                                Get.put(Serviceinsertcontroller()).friday =
                                "Friday";
                                Get.put(Serviceinsertcontroller()).fri_check =
                                1;
                                Get.put(Serviceinsertcontroller())
                                    .friday_start
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(fri_start!)
                                        .toString();
                                Get.put(Serviceinsertcontroller())
                                    .friday_end
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(fri_end!)
                                        .toString();
                                Get.put(Serviceinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          } else if (Get.put(Serviceinsertcontroller())
                              .saturdaydata ==
                              true &&
                              CreateserviceState.selectdate == 6) {
                            Duration? diff = sat_end?.difference(sat_start!);
                            if ((sat_start == sat_end) || (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Serviceinsertcontroller())
                                  .saturdaydata ==
                                  true) {
                                Get.put(Serviceinsertcontroller()).saturday =
                                "Saturday";
                                Get.put(Serviceinsertcontroller()).sat_check =
                                1;
                                Get.put(Serviceinsertcontroller())
                                    .saturday_start
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(sat_start!)
                                        .toString();
                                Get.put(Serviceinsertcontroller())
                                    .saturday_end
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(sat_end!)
                                        .toString();
                                Get.put(Serviceinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          } else if (Get.put(Serviceinsertcontroller())
                              .sundaydata ==
                              true &&
                              CreateserviceState.selectdate == 7) {
                            Duration? diff = sun_end?.difference(sun_start!);
                            if ((sun_start == sun_end) || (diff!.isNegative)) {
                              snack();
                            } else {
                              if (Get.put(Serviceinsertcontroller())
                                  .sundaydata ==
                                  true) {
                                Get.put(Serviceinsertcontroller()).sunday =
                                "Sunday";
                                Get.put(Serviceinsertcontroller()).sun_check =
                                1;
                                Get.put(Serviceinsertcontroller())
                                    .sunday_start
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(sun_start!)
                                        .toString();
                                Get.put(Serviceinsertcontroller())
                                    .sunday_end
                                    .text =
                                    DateFormat('hh:mm a')
                                        .format(sun_end!)
                                        .toString();
                                Get.put(Serviceinsertcontroller()).update();
                                Get.back();
                              }
                            }
                          }
                        },
                      ),
                    ),
                  )
                ],
              )),
        );
      },
    ),
  );
}





snack() {
  return Get.snackbar(
    "Time Zone",
    "Enter correct time Zone",
    //icon: Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.red,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.white,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

snack1(var sample, var snack, Color color) {
  return Get.snackbar(
    "$sample",
    "$snack",
    //icon: Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.TOP,
    backgroundColor: color,
    borderRadius: 10,
    margin: const EdgeInsets.all(15),
    colorText: Colors.white,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
