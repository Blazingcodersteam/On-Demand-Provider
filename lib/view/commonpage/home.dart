import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:badges/badges.dart';

import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../../Controller/Booking_Controller/view_my_booking_details_controller.dart';
import '../../Controller/Home_controller/home_controller.dart';
import '../../Controller/Mail_verfication_Controller/mail_send_verification_controller.dart';
import '../../Controller/Mail_verfication_Controller/mail_verfication_controller.dart';
import '../../Controller/Notification_Controller/notification_count_controller.dart';
import '../../Controller/Notification_Controller/notification_list_controller.dart';
import '../../Controller/Provider_Controller/provider_list_filter.dart';

import '../../Controller/Settings_Controller/Settings_Controller.dart';

import '/Controller/logincontroller.dart';
import '../commonpage/export.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

import 'loader.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
 //  var text =
 //      "25/9, Chittaranjan Salai, Cenotaph 2nd Lane, Alwarpettai, Chennai – 600018, Tamil Nadu, India";
 // static GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
 //  var data = ["sasi", "bharathi"];
 static  final advancedDrawerController = AdvancedDrawerController();
  Notificationcountcontroller notificationcountcontroller = Get.put(Notificationcountcontroller());
  // final GlobalKey<AdvancedDrawerState> advancedDrawerKey =
  // GlobalKey<AdvancedDrawerState>();
 Mailverficationcontroller mailverficationcontroller = Get.put(Mailverficationcontroller());
  Homecontroller homecontroller = Get.put(Homecontroller());
 ProviderListfiltercontroller providerListfiltercontroller = Get.put(ProviderListfiltercontroller());
  var intialindex1 = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    providerListfiltercontroller.providerfilterscreen(
        {
          "status":"1",
        },
        "dynamic_option");
    mailverficationcontroller.mailverficationscreen(
        {
          "user_id":Getstore.box.read("userid").toString(),
        },
        "check_mail_verification");
    homecontroller.homescreen({
      "user_id": Getstore.box.read("userid"),
      "home_filter":"",
    }, "home_page");


  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          elevation:10,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Text("Exit App", style:ThemeText.heading),
              ),
            ],
          ),
          content:  Text('Are you sure you want to leave the app?',
            style: ThemeText.bodydata,textAlign: TextAlign.center,),
          actions: [
            ElevatedButton(
                style:ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: Colors.transparent,
                  elevation: 0,
                  padding: const EdgeInsets.all(8.0),

                ),
                onPressed: () => Navigator.of(context).pop(false),
                child:  Text(
                  "Cancel",
                  style: TextStyle(
                      fontSize: 12,
                      color: ThemeText.headingcolor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DM Sans'),
                )),
            ElevatedButton(
              style:ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5)),
      primary: ThemeText.appcolor,
      elevation: 0,
      padding: const EdgeInsets.all(6.0),

      ),

              onPressed: () => SystemNavigator.pop(),
              child: const Text(
                "Confirm",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffFFFFFF),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'DM Sans'),
              ),
            ),
          ],
        ),
      ) ??
          false; //if showDialouge had returned null, then return false
    }



    return WillPopScope(onWillPop: showExitPopup, child: SafeArea(
        child:AdvancedDrawer(

            backdrop: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [ThemeText.basiccolor, ThemeText.basiccolor.withOpacity(0.2)],
                ),
              ),
            ),
            controller: advancedDrawerController,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            animateChildDecoration: true,
            rtlOpening: false,

            // openScale:1,
            openScale:0.85,
            disabledGestures: false,
            childDecoration: const BoxDecoration(
              // NOTICE: Uncomment if you want to add shadow behind the page.
              // Keep in mind that it may cause animation jerks.
              // boxShadow: <BoxShadow>[
              //   BoxShadow(
              //     color: Colors.black12,
              //     blurRadius: 0.0,
              //   ),
              // ],
              borderRadius:  BorderRadius.all(Radius.circular(5)),
            ),
            drawer: const Mydrawer(),
            child: Obx((){
              if(homecontroller.homeresponseStatus.isTrue && providerListfiltercontroller.providerfilterresponseStatus.isFalse && mailverficationcontroller.mailverficationStatus.isFalse && Get.put(Mailsendcontroller()).mailsendStatus.isFalse)
             {
               return (mailverficationcontroller.maildata.value.data==1)?Scaffold(
                 drawer:(advancedDrawerController.value.visible)? const Mydrawer():null,
                 // backgroundColor: Color(0xffE2D9FA).withOpacity(0.9),

                 appBar: AppBar(
                   backgroundColor:  ThemeText.basiccolor,
                   elevation: 0,
                   automaticallyImplyLeading: false,
                   shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.vertical(
                       bottom: Radius.circular(5),

                     ),
                   ),
                   leading: IconButton(


                     onPressed:(){
                       // Getstore.store();
                       advancedDrawerController.showDrawer();
                     },
                     icon: ValueListenableBuilder<AdvancedDrawerValue>(
                       valueListenable: advancedDrawerController,
                       builder: (_, value, __) {
                         return AnimatedSwitcher(
                           duration: const Duration(milliseconds: 250),
                           child: Icon(
                             value.visible ? Icons.clear : Icons.menu,
                             key: ValueKey<bool>(value.visible),
                             color: Colors.black,
                             size: 30,
                           ),
                         );
                       },
                     ),
                   ),
                   actions:  [
                     Padding(
                         padding: const EdgeInsets.only(right: 20, top: 10),
                         child:InkWell(
                           onTap: (){
                             notificationcountcontroller.notificationcountscreen(  {
                               "user_id":Getstore.box.read("userid").toString(),
                               "status":"2",
                             },
                                 "notification_count");
                             Get.put(Notificationlistcontroller()).notificationlistscreen({
                               // "user_id": Getstore.box.read("userid"),
                               "user_id": Getstore.box.read("userid"),
                             }, "notification_list");
                             Get.toNamed(AppRoutes.notification)!.then((value) =>notificationcountcontroller.notificationcountscreen(  {
                               "user_id":Getstore.box.read("userid").toString(),
                               "status":"",
                             },
                                 "notification_count"));
                           },
                           child:  Badge(
                             badgeContent:  SizedBox(
                                 width: 15,
                                 height: 15, //badge size
                                 child: Center(
                                   //aligh badge content to center
                                   child: (notificationcountcontroller.notificationcountStatus.isFalse)?Text(notificationcountcontroller.notificationcountdata.value.notificationCount.toString(),
                                       style: const TextStyle(
                                           color: Colors.white, //badge font color
                                           fontSize: 10 //badge font size
                                       )): Center(
                                       child: SpinKitRipple(
                                         color: ThemeText.basiccolor,
                                         size: 20.0,
                                       )),
                                 )),
                             badgeColor: ThemeText.appcolor,
                             child:  Icon(
                               IconlyLight.notification,
                               size: 25,
                               color: ThemeText.headingcolor,
                             ), //badge background color
                           ),
                         )
                     )

                   ],
                   centerTitle: true,
                   title: Text(
                     'Home',
                     style: ThemeText.title1,
                   ),
                 ),
                 bottomNavigationBar: const Bottomnavigation(
                   item: 0,
                 ),

                 body: Padding(
                   padding:const EdgeInsets.only(left: 6,right: 6) ,
                   child: Column(

                     children: [
                       const SizedBox(
                         height: 15,
                       ),
                       Container(
                           margin: const EdgeInsets.symmetric(vertical: 0.0),
                           height: Get.height*0.150,

                           child: ListView(
                             scrollDirection: Axis.horizontal,
                             children: <Widget>[

                               InkWell(
                                 onTap: () {
                                   /*         Get.put(Providerlistcontroller()).providerlistscreen({
                                      "search": "",
                                      "user_id": Getstore.box.read("userid"),
                                    }, "providers_list");


                                    Get.toNamed(AppRoutes.myprovider);*/
                                 },
                                 child: Card(
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(5),
                                     // side: const BorderSide(
                                     //   color: Color(0xff383535),
                                     // ),
                                   ),
                                   elevation: 5,
                                   child: SizedBox(
                                     width: Get.width*0.33,


                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [

                                         Text(
                                           homecontroller.homedata.value.data!.calculationDatas!.totalEarnings.toString(),
                                           style: ThemeText.maintitle1,
                                           textAlign: TextAlign.center,
                                         ),

                                         const SizedBox(
                                           height: 10,
                                         ),


                                         Text(
                                           "Total Earnings",
                                           style: ThemeText.bodydata2,
                                           textAlign: TextAlign.center,
                                         ),
                                         const SizedBox(
                                           height: 10,
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                               InkWell(
                                 onTap: () {
                                   /* Get.put(Providerlistcontroller()).providerlistscreen({
                                      "search": "",
                                      "user_id": Getstore.box.read("userid"),
                                    }, "providers_list");


                                    Get.toNamed(AppRoutes.myprovider);*/
                                 },
                                 child: Card(
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(5),
                                     // side: const BorderSide(
                                     //   color: Color(0xff383535),
                                     // ),
                                   ),
                                   elevation: 5,
                                   child: SizedBox(
                                     width: Get.width*0.33,


                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [

                                         Text(
                                           homecontroller.homedata.value.data!.calculationDatas!.totalBookings.toString(),
                                           style: ThemeText.maintitle1,
                                           textAlign: TextAlign.center,
                                         ),

                                         const SizedBox(
                                           height: 10,
                                         ),
                                         Text(
                                           "Total Bookings",
                                           style: ThemeText.bodydata2,
                                           textAlign: TextAlign.center,
                                         ),
                                         const SizedBox(
                                           height: 10,
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                               InkWell(
                                 onTap: () {
                                   /*     Get.put(Providerlistcontroller()).providerlistscreen({
                                      "search": "",
                                      "user_id": Getstore.box.read("userid"),
                                    }, "providers_list");


                                    Get.toNamed(AppRoutes.myprovider);*/
                                 },
                                 child: Card(
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(5),
                                     // side: const BorderSide(
                                     //   color: Color(0xff383535),
                                     // ),
                                   ),
                                   elevation: 5,
                                   child: SizedBox(
                                     width: Get.width*0.33,


                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [

                                         Text(
                                           homecontroller.homedata.value.data!.calculationDatas!.providersTeams.toString(),
                                           style: ThemeText.maintitle1,
                                           textAlign: TextAlign.center,
                                         ),

                                         const SizedBox(
                                           height: 10,
                                         ),


                                         Text(
                                           "Providers Teams",
                                           style: ThemeText.bodydata2,
                                           textAlign: TextAlign.center,
                                         ),
                                         const SizedBox(
                                           height: 10,
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           )),
                       const SizedBox(
                         height: 15,
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 6, right: 6),
                         child: Card(
                           elevation: 4.0,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(5.0),
                           ),
                           child: Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(5.0),
                                 gradient:  LinearGradient(
                                   begin: Alignment.topCenter,
                                   end: Alignment.bottomCenter,
                                   colors: [
                                     const Color(0xff764BA2),
                                    ThemeText.appcolor,
                                   ],
                                 ),
                               ),
                               child: Padding(
                                 padding:
                                 const EdgeInsets.only(left: 8, right: 0),
                                 child: Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.spaceBetween,
                                   children: [
                                     SizedBox(
                                       width: MediaQuery.of(context).size.width *
                                           0.5,
                                       child: Column(
                                         children: [
                                           Text(
                                             homecontroller.homedata.value.data!.advertisementData!.description1.toString(),
                                             //"${Getstore.box.read("firstname").toString()}",

                                             style: ThemeText.content,
                                           ),
                                           const SizedBox(
                                             height: 20,
                                           ),
                                           Row(
                                             children: [
                                               Text(homecontroller.homedata.value.data!.advertisementData!.description2.toString(),
                                                   style: ThemeText.content1),
                                               const SizedBox(
                                                 width: 10,
                                               ),
                                               const Icon(
                                                 IconlyLight.arrow_right,
                                                 size: 20,
                                                 color: Colors.white,
                                               ),
                                             ],
                                           )
                                         ],
                                       ),
                                     ),
                                     SizedBox(
                                       width: MediaQuery.of(context).size.width *
                                           0.35,
                                       height:Get.height*0.17,
                                       child: ImageFade(

                                         width: MediaQuery.of(context).size.width *
                                             0.35,
                                         height:Get.height*0.17,

                                         // whenever the image changes, it will be loaded, and then faded in:
                                         image: NetworkImage(homecontroller.homedata.value.data!.advertisementData!.image.toString()),

                                         // slow-ish fade for loaded images:
                                         duration:
                                         const Duration(
                                             milliseconds:
                                             900),

                                         syncDuration:
                                         const Duration(
                                             milliseconds:
                                             150),

                                         fit: BoxFit.cover,
                                         loadingBuilder: (context,
                                             progress,
                                             chunkEvent) =>
                                             Center(
                                                 child: SpinKitRipple(
                                                   color: ThemeText.basiccolor,
                                                   size: 50.0,
                                                 )),
                                         errorBuilder:
                                             (context, error) =>
                                             Center(
                                                 child: SpinKitRipple(
                                                   color: ThemeText.basiccolor,
                                                   size: 50.0,
                                                 )),
                                       ),




                                     )
                                   ],
                                 ),
                               )),
                         ),
                       ),
                       const SizedBox(
                         height: 15,
                       ),

                       Container(
                         height: Get.height*0.45,

                         child:  DefaultTabController(
                           initialIndex: intialindex1,
                           length: providerListfiltercontroller.providerlistfilterdata.value.dynamicOption!.length,
                           child: Column(
                             children: <Widget>[
                               ButtonsTabBar(
                                 backgroundColor: ThemeText.basiccolor,
                                 radius: 5.0,
                                 contentPadding:const EdgeInsets.symmetric(horizontal: 25),
                                 unselectedBackgroundColor: const Color(0xffF0F1F3),
                                 unselectedLabelStyle: ThemeText.buttontab,
                                 labelStyle:ThemeText.textdata1,
                                 onTap: (intialindex) {
                                   for(var i=0;i< providerListfiltercontroller.providerlistfilterdata.value.dynamicOption!.length;i++){
                                     if(intialindex==i) {
                                       setState(() {
                                         intialindex1=i;
                                       });
                                       if(providerListfiltercontroller.providerlistfilterdata.value.dynamicOption![i].statusName=="All"){
                                         homecontroller.homescreen({
                                           "user_id": Getstore.box.read("userid"),
                                           "home_filter": "",
                                         }, "home_page");

                                       }else{
                                         setState(() {
                                           intialindex1=i;
                                         });
                                         homecontroller.homescreen({
                                           "user_id": Getstore.box.read("userid"),
                                           "home_filter": providerListfiltercontroller.providerlistfilterdata.value.dynamicOption![i].mainStatusId,
                                         }, "home_page");

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
                                   physics: const NeverScrollableScrollPhysics(),
                                   children: <Widget>[
                                     for(var i=0;i< providerListfiltercontroller.providerlistfilterdata.value.dynamicOption!.length;i++)
                                     Obx((){
                                       if(homecontroller.homedata.value.data!.homeFilterData !=null) {
                                         return SingleChildScrollView(
                                             child: Column(
                                                 children: [
                                                   const SizedBox(
                                                     height: 15,
                                                   ),
                                                   for(var i = 0; i <
                                                       homecontroller.homedata
                                                           .value.data!
                                                           .homeFilterData!
                                                           .length; i++)
                                                     Padding(
                                                       padding: const EdgeInsets
                                                           .only(left: 6,
                                                           right: 6,
                                                           top: 6,
                                                           bottom: 6),
                                                       child: InkWell(
                                                         onTap: () {
                                                           Get.put(
                                                               Mybookingdetailscontroller())
                                                               .mybookingdetailsscreen(
                                                               {
                                                                 // "user_id": Getstore.box.read("userid"),
                                                                 "booking_id": homecontroller
                                                                     .homedata
                                                                     .value
                                                                     .data!
                                                                     .homeFilterData![i]
                                                                     .bookingId,
                                                               },
                                                               "view_booking_details");
                                                           Get.toNamed(AppRoutes
                                                               .bookingdetails);
                                                         },
                                                         child: Container(
                                                           padding: const EdgeInsets
                                                               .symmetric(
                                                               horizontal: 5.0,
                                                               vertical: 5.0),
                                                           decoration: BoxDecoration(
                                                             border: Border.all(
                                                               width: 1,
                                                               color: ThemeText
                                                                   .basiccolor,
                                                             ),
                                                             borderRadius: BorderRadius
                                                                 .circular(5.0),
                                                           ),
                                                           child: Column(
                                                             mainAxisAlignment: MainAxisAlignment
                                                                 .spaceBetween,
                                                             children: [
                                                               // const Divider(
                                                               //   color: Colors.green,
                                                               //   thickness: 0.5,
                                                               //   indent : 10,
                                                               //   endIndent : 10,
                                                               // ),
                                                               Row(
                                                                 mainAxisAlignment: MainAxisAlignment
                                                                     .start,
                                                                 children: [
                                                                   Container(
                                                                     margin: const EdgeInsets
                                                                         .all(
                                                                         0.0),
                                                                     decoration: BoxDecoration(
                                                                       borderRadius: BorderRadius
                                                                           .circular(
                                                                           5.0),
                                                                     ),
                                                                     child: ClipRRect(
                                                                         borderRadius: BorderRadius
                                                                             .circular(
                                                                             5),
                                                                         child: ImageFade(
                                                                           width:
                                                                           MediaQuery
                                                                               .of(
                                                                               context)
                                                                               .size
                                                                               .width *
                                                                               0.43,
                                                                           height: Get
                                                                               .height *
                                                                               0.2,

                                                                           // whenever the image changes, it will be loaded, and then faded in:
                                                                           image: NetworkImage(
                                                                             homecontroller
                                                                                 .homedata
                                                                                 .value
                                                                                 .data!
                                                                                 .homeFilterData![i]
                                                                                 .serviceImage
                                                                                 .toString(),
                                                                           ),

                                                                           // slow-ish fade for loaded images:
                                                                           duration:
                                                                           const Duration(
                                                                               milliseconds: 900),

                                                                           // if the image is loaded synchronously (ex. from memory), fade in faster:
                                                                           syncDuration:
                                                                           const Duration(
                                                                               milliseconds: 150),

                                                                           // supports most properties of Image:
                                                                           alignment: Alignment
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
                                                                           loadingBuilder:
                                                                               (
                                                                               context,
                                                                               progress,
                                                                               chunkEvent) =>
                                                                           const Center(
                                                                               child: SpinKitRipple(
                                                                                 color: Color(
                                                                                     0xffE2D9FA),
                                                                                 size: 50.0,
                                                                               )),


                                                                           // displayed when an error occurs:
                                                                           errorBuilder: (
                                                                               context,
                                                                               error) =>
                                                                           const Center(
                                                                               child: SpinKitRipple(
                                                                                 color: Color(
                                                                                     0xffE2D9FA),
                                                                                 size: 50.0,
                                                                               )),
                                                                         )),
                                                                   ),
                                                                   Padding(
                                                                     padding: const EdgeInsets
                                                                         .only(
                                                                       left: 10,),
                                                                     child: Column(
                                                                       mainAxisAlignment: MainAxisAlignment
                                                                           .start,
                                                                       crossAxisAlignment: CrossAxisAlignment
                                                                           .start,
                                                                       children: [
                                                                         Padding(
                                                                           padding: const EdgeInsets
                                                                               .only(
                                                                             left: 0,),
                                                                           child: Text(
                                                                             homecontroller
                                                                                 .homedata
                                                                                 .value
                                                                                 .data!
                                                                                 .homeFilterData![i]
                                                                                 .serviceName
                                                                                 .toString(),
                                                                             style: ThemeText
                                                                                 .heading1,
                                                                           ),),
                                                                         const SizedBox(
                                                                           height: 7,),

                                                                         Row(
                                                                           children: [
                                                                             const Icon(
                                                                               IconlyLight
                                                                                   .location,
                                                                               size: 15,
                                                                               color: Color(
                                                                                   0xff242424),
                                                                             ),
                                                                             const SizedBox(
                                                                                 width: 5),
                                                                             SizedBox(
                                                                               width: Get
                                                                                   .width *
                                                                                   0.4,
                                                                               child: Text(
                                                                                 homecontroller
                                                                                     .homedata
                                                                                     .value
                                                                                     .data!
                                                                                     .homeFilterData![i]
                                                                                     .address
                                                                                     .toString(),
                                                                                 style: ThemeText
                                                                                     .bodydata,
                                                                                 maxLines: 2,
                                                                                 // endColor: ThemeText.basiccolor,
                                                                                 //
                                                                                 // duration: Duration(milliseconds: 500),
                                                                               ),
                                                                             ),
                                                                           ],
                                                                         ),
                                                                         const SizedBox(
                                                                           height: 7,),

                                                                         Row(
                                                                           children: [
                                                                             const Icon(
                                                                               IconlyLight
                                                                                   .calendar,
                                                                               size: 15,
                                                                               color: Color(
                                                                                   0xff242424),
                                                                             ),
                                                                             const SizedBox(
                                                                                 width: 5),
                                                                             SizedBox(
                                                                               width: Get
                                                                                   .width *
                                                                                   0.40,

                                                                               child: Text(
                                                                                 "Booked Date : ${homecontroller
                                                                                     .homedata
                                                                                     .value
                                                                                     .data!
                                                                                     .homeFilterData![i]
                                                                                     .bookedDate} , ${homecontroller
                                                                                     .homedata
                                                                                     .value
                                                                                     .data!
                                                                                     .homeFilterData![i]
                                                                                     .bookingTime}",
                                                                                 style: ThemeText
                                                                                     .bodydata,
                                                                                 // endColor: ThemeText.basiccolor,
                                                                                 //
                                                                                 // duration: Duration(milliseconds: 500),
                                                                               ),
                                                                             )
                                                                           ],
                                                                         ),
                                                                         const SizedBox(
                                                                           height: 7,),
                                                                         Row(
                                                                           children: [
                                                                             const Icon(
                                                                               Icons
                                                                                   .note_alt_outlined,
                                                                               size: 15,
                                                                               color: Color(
                                                                                   0xff242424),
                                                                             ),
                                                                             const SizedBox(
                                                                                 width: 5),
                                                                             Text(
                                                                               "Booked by : ${homecontroller
                                                                                   .homedata
                                                                                   .value
                                                                                   .data!
                                                                                   .homeFilterData![i]
                                                                                   .customerName}",
                                                                               style: ThemeText
                                                                                   .bodydata,
                                                                               // endColor: ThemeText.basiccolor,
                                                                               //
                                                                               // duration: Duration(milliseconds: 500),
                                                                             ),
                                                                           ],
                                                                         ),
                                                                         const SizedBox(
                                                                           height: 7,),
                                                                         Row(
                                                                           children: [

                                                                             Text(
                                                                               '\$ ${homecontroller
                                                                                   .homedata
                                                                                   .value
                                                                                   .data!
                                                                                   .homeFilterData![i]
                                                                                   .totalAmount
                                                                                   .toString()}',
                                                                               style: ThemeText
                                                                                   .amount,

                                                                               // endColor: ThemeText.basiccolor,
                                                                               //
                                                                               // duration: Duration(milliseconds: 500),
                                                                             ),
                                                                             const SizedBox(
                                                                                 width: 5),
                                                                             // if(homecontroller.homedata.value.data!.homeFilterData![i].paymentStatus=="1")
                                                                             // Text(
                                                                             //   '( paid )',
                                                                             //   style: ThemeText.bodydata,
                                                                             //   // endColor: ThemeText.basiccolor,
                                                                             //   //
                                                                             //   // duration: Duration(milliseconds: 500),
                                                                             // ),
                                                                           ],
                                                                         ),
                                                                       ],
                                                                     ),)


                                                                 ],
                                                               )


                                                             ],
                                                           ),
                                                         ),
                                                       ),
                                                     )
                                                 ]));
                                       }
                                       else{
                                         return SingleChildScrollView(
                                           child: Column(
                                             mainAxisAlignment:
                                             MainAxisAlignment.spaceBetween,
                                             children: const [
                                               Image(
                                                 image:
                                                 AssetImage("images/nodata.png"),
                                               )
                                             ],
                                           ),
                                         );
                                       }


                                     })


                                     // SingleChildScrollView(
                                     //   child: Column(
                                     //     children:  [
                                     //       const SizedBox(
                                     //         height: 15,
                                     //       ),
                                     //       if(homecontroller.homedata.value.data!.homeFilterData !=null)
                                     //         for(var i=0;i<homecontroller.homedata.value.data!.homeFilterData!.length;i++)
                                     //           Padding(padding:const EdgeInsets.only(left: 6,right: 6,top:6,bottom: 6),
                                     //             child:    InkWell(
                                     //               onTap: (){
                                     //                 Get.put(Mybookingdetailscontroller()).mybookingdetailsscreen({
                                     //                   // "user_id": Getstore.box.read("userid"),
                                     //                   "booking_id":homecontroller.homedata.value.data!.homeFilterData![i].bookingId,
                                     //                 }, "view_booking_details");
                                     //                 Get.toNamed(AppRoutes.bookingdetails);
                                     //               },
                                     //               child: Container(
                                     //                 padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                                     //                 decoration: BoxDecoration(
                                     //                   border: Border.all(
                                     //                     width: 1,
                                     //                     color: ThemeText.basiccolor,
                                     //                   ),
                                     //                   borderRadius: BorderRadius.circular(5.0),
                                     //                 ),
                                     //                 child: Column(
                                     //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     //                   children:  [
                                     //                     // const Divider(
                                     //                     //   color: Colors.green,
                                     //                     //   thickness: 0.5,
                                     //                     //   indent : 10,
                                     //                     //   endIndent : 10,
                                     //                     // ),
                                     //                     Row(
                                     //                       mainAxisAlignment: MainAxisAlignment.start,
                                     //                       children: [
                                     //                         Container(
                                     //                           margin: const EdgeInsets.all(0.0),
                                     //                           decoration: BoxDecoration(
                                     //                             borderRadius: BorderRadius.circular(5.0),
                                     //                           ),
                                     //                           child: ClipRRect(
                                     //                               borderRadius: BorderRadius.circular(5),
                                     //                               child: ImageFade(
                                     //                                 width:
                                     //                                 MediaQuery.of(context).size.width *
                                     //                                     0.43,
                                     //                                 height: Get.height*0.2,
                                     //
                                     //                                 // whenever the image changes, it will be loaded, and then faded in:
                                     //                                 image:  NetworkImage(
                                     //                                   homecontroller.homedata.value.data!.homeFilterData![i].serviceImage.toString(),
                                     //                                 ),
                                     //
                                     //                                 // slow-ish fade for loaded images:
                                     //                                 duration:
                                     //                                 const Duration(milliseconds: 900),
                                     //
                                     //                                 // if the image is loaded synchronously (ex. from memory), fade in faster:
                                     //                                 syncDuration:
                                     //                                 const Duration(milliseconds: 150),
                                     //
                                     //                                 // supports most properties of Image:
                                     //                                 alignment: Alignment.center,
                                     //                                 fit: BoxFit.cover,
                                     //                                 scale: 2,
                                     //
                                     //                                 // shown behind everything:
                                     //                                 // placeholder:  Center(
                                     //                                 //     child:  SpinKitRipple(
                                     //                                 //       color: Color(0xffde2127),
                                     //                                 //       size: 50.0,
                                     //                                 //     )
                                     //                                 // ),
                                     //
                                     //                                 // shows progress while loading an image:
                                     //                                 loadingBuilder:
                                     //                                     (context, progress, chunkEvent) =>
                                     //                                 const Center(
                                     //                                     child: SpinKitRipple(
                                     //                                       color: Color(0xffE2D9FA),
                                     //                                       size: 50.0,
                                     //                                     )),
                                     //
                                     //
                                     //                                 // displayed when an error occurs:
                                     //                                 errorBuilder: (context, error) =>
                                     //                                 const Center(
                                     //                                     child: SpinKitRipple(
                                     //                                       color: Color(0xffE2D9FA),
                                     //                                       size: 50.0,
                                     //                                     )),
                                     //                               )),
                                     //                         ),
                                     //                         Padding(padding: const EdgeInsets.only(
                                     //                           left: 10,),
                                     //                           child:  Column(
                                     //                             mainAxisAlignment: MainAxisAlignment.start,
                                     //                             crossAxisAlignment: CrossAxisAlignment.start,
                                     //                             children:  [
                                     //                               Padding(padding: const EdgeInsets.only(
                                     //                                 left: 0,),
                                     //                                 child: Text(
                                     //                                   homecontroller.homedata.value.data!.homeFilterData![i].serviceName.toString(),
                                     //                                   style: ThemeText.heading1,
                                     //                                 ),),
                                     //                               const SizedBox(height: 7,),
                                     //
                                     //                               Row(
                                     //                                 children: [
                                     //                                   const Icon(
                                     //                                     IconlyLight.location,
                                     //                                     size: 15,
                                     //                                     color: Color(0xff242424),
                                     //                                   ),
                                     //                                   const SizedBox(width: 5),
                                     //                                   SizedBox(
                                     //                                     width:Get.width*0.4,
                                     //                                     child: Text(
                                     //                                       homecontroller.homedata.value.data!.homeFilterData![i].address.toString(),
                                     //                                       style: ThemeText.bodydata,
                                     //                                       maxLines: 2,
                                     //                                       // endColor: ThemeText.basiccolor,
                                     //                                       //
                                     //                                       // duration: Duration(milliseconds: 500),
                                     //                                     ),
                                     //                                   ),
                                     //                                 ],
                                     //                               ),
                                     //                               const SizedBox(height: 7,),
                                     //
                                     //                               Row(
                                     //                                 children: [
                                     //                                   const Icon(
                                     //                                     IconlyLight.calendar,
                                     //                                     size: 15,
                                     //                                     color: Color(0xff242424),
                                     //                                   ),
                                     //                                   const SizedBox(width: 5),
                                     //                                   SizedBox(
                                     //                                     width:Get.width*0.40,
                                     //
                                     //                                     child:Text(
                                     //                                       "Booked Date : ${homecontroller.homedata.value.data!.homeFilterData![i].bookedDate} , ${homecontroller.homedata.value.data!.homeFilterData![i].bookingTime}",
                                     //                                       style: ThemeText.bodydata,
                                     //                                       // endColor: ThemeText.basiccolor,
                                     //                                       //
                                     //                                       // duration: Duration(milliseconds: 500),
                                     //                                     ),
                                     //                                   )
                                     //                                 ],
                                     //                               ),
                                     //                               const SizedBox(height: 7,),
                                     //                               Row(
                                     //                                 children: [
                                     //                                   const Icon(
                                     //                                     Icons.note_alt_outlined,
                                     //                                     size: 15,
                                     //                                     color: Color(0xff242424),
                                     //                                   ),
                                     //                                   const SizedBox(width: 5),
                                     //                                   Text(
                                     //                                     "Booked by : ${homecontroller.homedata.value.data!.homeFilterData![i].customerName}",
                                     //                                     style: ThemeText.bodydata,
                                     //                                     // endColor: ThemeText.basiccolor,
                                     //                                     //
                                     //                                     // duration: Duration(milliseconds: 500),
                                     //                                   ),
                                     //                                 ],
                                     //                               ),
                                     //                               const SizedBox(height: 7,),
                                     //                               Row(
                                     //                                 children: [
                                     //
                                     //                                   Text(
                                     //                                     '\$ ${homecontroller.homedata.value.data!.homeFilterData![i].totalAmount.toString()}',
                                     //                                     style: ThemeText.amount,
                                     //
                                     //                                     // endColor: ThemeText.basiccolor,
                                     //                                     //
                                     //                                     // duration: Duration(milliseconds: 500),
                                     //                                   ),
                                     //                                   const SizedBox(width: 5),
                                     //                                   if(homecontroller.homedata.value.data!.homeFilterData![i].paymentStatus=="1")
                                     //                                     Text(
                                     //                                       '( paid )',
                                     //                                       style: ThemeText.bodydata,
                                     //                                       // endColor: ThemeText.basiccolor,
                                     //                                       //
                                     //                                       // duration: Duration(milliseconds: 500),
                                     //                                     ),
                                     //                                 ],
                                     //                               ),
                                     //                             ],
                                     //                           ),)
                                     //
                                     //
                                     //                       ],
                                     //                     )
                                     //
                                     //
                                     //
                                     //                   ],
                                     //                 ),
                                     //               ),
                                     //             ),
                                     //           )
                                     //       else
                                     //         Column(
                                     //           mainAxisAlignment:
                                     //           MainAxisAlignment.spaceBetween,
                                     //           children: const [
                                     //             Image(
                                     //               image:
                                     //               AssetImage("images/nodata.png"),
                                     //             )
                                     //           ],
                                     //         )
                                     //
                                     //
                                     //     ],
                                     //   ),
                                     // ),
                                     // SingleChildScrollView(
                                     //   child: Column(
                                     //     children:  [
                                     //       const SizedBox(
                                     //         height: 15,
                                     //       ),
                                     //       if(homecontroller.homedata.value.data!.homeFilterData !=null)
                                     //         for(var i=0;i<homecontroller.homedata.value.data!.homeFilterData!.length;i++)
                                     //           Padding(padding:const EdgeInsets.only(left: 6,right: 6,top:6,bottom: 6),
                                     //             child:    InkWell(
                                     //               onTap: (){
                                     //                 Get.put(Mybookingdetailscontroller()).mybookingdetailsscreen({
                                     //                   // "user_id": Getstore.box.read("userid"),
                                     //                   "booking_id":homecontroller.homedata.value.data!.homeFilterData![i].bookingId,
                                     //                 }, "view_booking_details");
                                     //                 Get.toNamed(AppRoutes.bookingdetails);
                                     //               },
                                     //               child: Container(
                                     //                 padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                                     //                 decoration: BoxDecoration(
                                     //                   border: Border.all(
                                     //                     width: 1,
                                     //                     color: ThemeText.basiccolor,
                                     //                   ),
                                     //                   borderRadius: BorderRadius.circular(5.0),
                                     //                 ),
                                     //                 child: Column(
                                     //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     //                   children:  [
                                     //                     // const Divider(
                                     //                     //   color: Colors.green,
                                     //                     //   thickness: 0.5,
                                     //                     //   indent : 10,
                                     //                     //   endIndent : 10,
                                     //                     // ),
                                     //                     Row(
                                     //                       mainAxisAlignment: MainAxisAlignment.start,
                                     //                       children: [
                                     //                         Container(
                                     //                           margin: const EdgeInsets.all(0.0),
                                     //                           decoration: BoxDecoration(
                                     //                             borderRadius: BorderRadius.circular(5.0),
                                     //                           ),
                                     //                           child: ClipRRect(
                                     //                               borderRadius: BorderRadius.circular(5),
                                     //                               child: ImageFade(
                                     //                                 width:
                                     //                                 MediaQuery.of(context).size.width *
                                     //                                     0.43,
                                     //                                 height: Get.height*0.2,
                                     //
                                     //                                 // whenever the image changes, it will be loaded, and then faded in:
                                     //                                 image:  NetworkImage(
                                     //                                   homecontroller.homedata.value.data!.homeFilterData![i].serviceImage.toString(),
                                     //                                 ),
                                     //
                                     //                                 // slow-ish fade for loaded images:
                                     //                                 duration:
                                     //                                 const Duration(milliseconds: 900),
                                     //
                                     //                                 // if the image is loaded synchronously (ex. from memory), fade in faster:
                                     //                                 syncDuration:
                                     //                                 const Duration(milliseconds: 150),
                                     //
                                     //                                 // supports most properties of Image:
                                     //                                 alignment: Alignment.center,
                                     //                                 fit: BoxFit.cover,
                                     //                                 scale: 2,
                                     //
                                     //                                 // shown behind everything:
                                     //                                 // placeholder:  Center(
                                     //                                 //     child:  SpinKitRipple(
                                     //                                 //       color: Color(0xffde2127),
                                     //                                 //       size: 50.0,
                                     //                                 //     )
                                     //                                 // ),
                                     //
                                     //                                 // shows progress while loading an image:
                                     //                                 loadingBuilder:
                                     //                                     (context, progress, chunkEvent) =>
                                     //                                 const Center(
                                     //                                     child: SpinKitRipple(
                                     //                                       color: Color(0xffE2D9FA),
                                     //                                       size: 50.0,
                                     //                                     )),
                                     //
                                     //
                                     //                                 // displayed when an error occurs:
                                     //                                 errorBuilder: (context, error) =>
                                     //                                 const Center(
                                     //                                     child: SpinKitRipple(
                                     //                                       color: Color(0xffE2D9FA),
                                     //                                       size: 50.0,
                                     //                                     )),
                                     //                               )),
                                     //                         ),
                                     //                         Padding(padding: const EdgeInsets.only(
                                     //                           left: 10,),
                                     //                           child:  Column(
                                     //                             mainAxisAlignment: MainAxisAlignment.start,
                                     //                             crossAxisAlignment: CrossAxisAlignment.start,
                                     //                             children:  [
                                     //                               Padding(padding: const EdgeInsets.only(
                                     //                                 left: 0,),
                                     //                                 child: Text(
                                     //                                   homecontroller.homedata.value.data!.homeFilterData![i].serviceName.toString(),
                                     //                                   style: ThemeText.heading1,
                                     //                                 ),),
                                     //                               const SizedBox(height: 7,),
                                     //
                                     //                               Row(
                                     //                                 children: [
                                     //                                   const Icon(
                                     //                                     IconlyLight.location,
                                     //                                     size: 15,
                                     //                                     color: Color(0xff242424),
                                     //                                   ),
                                     //                                   const SizedBox(width: 5),
                                     //                                   SizedBox(
                                     //                                     width:Get.width*0.4,
                                     //                                     child: Text(
                                     //                                       homecontroller.homedata.value.data!.homeFilterData![i].address.toString(),
                                     //                                       style: ThemeText.bodydata,
                                     //                                       maxLines: 2,
                                     //                                       // endColor: ThemeText.basiccolor,
                                     //                                       //
                                     //                                       // duration: Duration(milliseconds: 500),
                                     //                                     ),
                                     //                                   ),
                                     //                                 ],
                                     //                               ),
                                     //                               const SizedBox(height: 7,),
                                     //
                                     //                               Row(
                                     //                                 children: [
                                     //                                   const Icon(
                                     //                                     IconlyLight.calendar,
                                     //                                     size: 15,
                                     //                                     color: Color(0xff242424),
                                     //                                   ),
                                     //                                   const SizedBox(width: 5),
                                     //                                   SizedBox(
                                     //                                     width:Get.width*0.40,
                                     //
                                     //                                     child:Text(
                                     //                                       "Booked Date : ${homecontroller.homedata.value.data!.homeFilterData![i].bookedDate} , ${homecontroller.homedata.value.data!.homeFilterData![i].bookingTime}",
                                     //                                       style: ThemeText.bodydata,
                                     //                                       // endColor: ThemeText.basiccolor,
                                     //                                       //
                                     //                                       // duration: Duration(milliseconds: 500),
                                     //                                     ),
                                     //                                   )
                                     //                                 ],
                                     //                               ),
                                     //                               const SizedBox(height: 7,),
                                     //                               Row(
                                     //                                 children: [
                                     //                                   const Icon(
                                     //                                     Icons.note_alt_outlined,
                                     //                                     size: 15,
                                     //                                     color: Color(0xff242424),
                                     //                                   ),
                                     //                                   const SizedBox(width: 5),
                                     //                                   Text(
                                     //                                     "Booked by : ${homecontroller.homedata.value.data!.homeFilterData![i].customerName}",
                                     //                                     style: ThemeText.bodydata,
                                     //                                     // endColor: ThemeText.basiccolor,
                                     //                                     //
                                     //                                     // duration: Duration(milliseconds: 500),
                                     //                                   ),
                                     //                                 ],
                                     //                               ),
                                     //                               const SizedBox(height: 7,),
                                     //                               Row(
                                     //                                 children: [
                                     //
                                     //                                   Text(
                                     //                                     '\$ ${homecontroller.homedata.value.data!.homeFilterData![i].totalAmount.toString()}',
                                     //                                     style: ThemeText.amount,
                                     //
                                     //                                     // endColor: ThemeText.basiccolor,
                                     //                                     //
                                     //                                     // duration: Duration(milliseconds: 500),
                                     //                                   ),
                                     //                                   const SizedBox(width: 5),
                                     //                                   // if(homecontroller.homedata.value.data!.homeFilterData![i].paymentStatus=="1")
                                     //                                   // Text(
                                     //                                   //   '( paid )',
                                     //                                   //   style: ThemeText.bodydata,
                                     //                                   //   // endColor: ThemeText.basiccolor,
                                     //                                   //   //
                                     //                                   //   // duration: Duration(milliseconds: 500),
                                     //                                   // ),
                                     //                                 ],
                                     //                               ),
                                     //                             ],
                                     //                           ),)
                                     //
                                     //
                                     //                       ],
                                     //                     )
                                     //
                                     //
                                     //
                                     //                   ],
                                     //                 ),
                                     //               ),
                                     //             ),
                                     //           )
                                     //       else
                                     //         Column(
                                     //           mainAxisAlignment:
                                     //           MainAxisAlignment.spaceBetween,
                                     //           children: const [
                                     //             Image(
                                     //               image:
                                     //               AssetImage("images/nodata.png"),
                                     //             )
                                     //           ],
                                     //         )
                                     //
                                     //
                                     //     ],
                                     //   ),
                                     // ),
                                     // SingleChildScrollView(
                                     //   child: Column(
                                     //     children:  [
                                     //       const SizedBox(
                                     //         height: 15,
                                     //       ),
                                     //       if(homecontroller.homedata.value.data!.homeFilterData !=null)
                                     //         for(var i=0;i<homecontroller.homedata.value.data!.homeFilterData!.length;i++)
                                     //           Padding(padding:const EdgeInsets.only(left: 6,right: 6,top:6,bottom: 6),
                                     //             child:    InkWell(
                                     //               onTap: (){
                                     //                 Get.put(Mybookingdetailscontroller()).mybookingdetailsscreen({
                                     //                   // "user_id": Getstore.box.read("userid"),
                                     //                   "booking_id":homecontroller.homedata.value.data!.homeFilterData![i].bookingId,
                                     //                 }, "view_booking_details");
                                     //                 Get.toNamed(AppRoutes.bookingdetails);
                                     //               },
                                     //               child: Container(
                                     //                 padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                                     //                 decoration: BoxDecoration(
                                     //                   border: Border.all(
                                     //                     width: 1,
                                     //                     color: ThemeText.basiccolor,
                                     //                   ),
                                     //                   borderRadius: BorderRadius.circular(5.0),
                                     //                 ),
                                     //                 child: Column(
                                     //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     //                   children:  [
                                     //                     // const Divider(
                                     //                     //   color: Colors.green,
                                     //                     //   thickness: 0.5,
                                     //                     //   indent : 10,
                                     //                     //   endIndent : 10,
                                     //                     // ),
                                     //                     Row(
                                     //                       mainAxisAlignment: MainAxisAlignment.start,
                                     //                       children: [
                                     //                         Container(
                                     //                           margin: const EdgeInsets.all(0.0),
                                     //                           decoration: BoxDecoration(
                                     //                             borderRadius: BorderRadius.circular(5.0),
                                     //                           ),
                                     //                           child: ClipRRect(
                                     //                               borderRadius: BorderRadius.circular(5),
                                     //                               child: ImageFade(
                                     //                                 width:
                                     //                                 MediaQuery.of(context).size.width *
                                     //                                     0.43,
                                     //                                 height: Get.height*0.2,
                                     //
                                     //                                 // whenever the image changes, it will be loaded, and then faded in:
                                     //                                 image:  NetworkImage(
                                     //                                   homecontroller.homedata.value.data!.homeFilterData![i].serviceImage.toString(),
                                     //                                 ),
                                     //
                                     //                                 // slow-ish fade for loaded images:
                                     //                                 duration:
                                     //                                 const Duration(milliseconds: 900),
                                     //
                                     //                                 // if the image is loaded synchronously (ex. from memory), fade in faster:
                                     //                                 syncDuration:
                                     //                                 const Duration(milliseconds: 150),
                                     //
                                     //                                 // supports most properties of Image:
                                     //                                 alignment: Alignment.center,
                                     //                                 fit: BoxFit.cover,
                                     //                                 scale: 2,
                                     //
                                     //                                 // shown behind everything:
                                     //                                 // placeholder:  Center(
                                     //                                 //     child:  SpinKitRipple(
                                     //                                 //       color: Color(0xffde2127),
                                     //                                 //       size: 50.0,
                                     //                                 //     )
                                     //                                 // ),
                                     //
                                     //                                 // shows progress while loading an image:
                                     //                                 loadingBuilder:
                                     //                                     (context, progress, chunkEvent) =>
                                     //                                 const Center(
                                     //                                     child: SpinKitRipple(
                                     //                                       color: Color(0xffE2D9FA),
                                     //                                       size: 50.0,
                                     //                                     )),
                                     //
                                     //
                                     //                                 // displayed when an error occurs:
                                     //                                 errorBuilder: (context, error) =>
                                     //                                 const Center(
                                     //                                     child: SpinKitRipple(
                                     //                                       color: Color(0xffE2D9FA),
                                     //                                       size: 50.0,
                                     //                                     )),
                                     //                               )),
                                     //                         ),
                                     //                         Padding(padding: const EdgeInsets.only(
                                     //                           left: 10,),
                                     //                           child:  Column(
                                     //                             mainAxisAlignment: MainAxisAlignment.start,
                                     //                             crossAxisAlignment: CrossAxisAlignment.start,
                                     //                             children:  [
                                     //                               Padding(padding: const EdgeInsets.only(
                                     //                                 left: 0,),
                                     //                                 child: Text(
                                     //                                   homecontroller.homedata.value.data!.homeFilterData![i].serviceName.toString(),
                                     //                                   style: ThemeText.heading1,
                                     //                                 ),),
                                     //                               const SizedBox(height: 7,),
                                     //
                                     //                               Row(
                                     //                                 children: [
                                     //                                   const Icon(
                                     //                                     IconlyLight.location,
                                     //                                     size: 15,
                                     //                                     color: Color(0xff242424),
                                     //                                   ),
                                     //                                   const SizedBox(width: 5),
                                     //                                   SizedBox(
                                     //                                     width:Get.width*0.4,
                                     //                                     child: Text(
                                     //                                       homecontroller.homedata.value.data!.homeFilterData![i].address.toString(),
                                     //                                       style: ThemeText.bodydata,
                                     //                                       maxLines: 2,
                                     //                                       // endColor: ThemeText.basiccolor,
                                     //                                       //
                                     //                                       // duration: Duration(milliseconds: 500),
                                     //                                     ),
                                     //                                   )
                                     //                                 ],
                                     //                               ),
                                     //                               const SizedBox(height: 7,),
                                     //
                                     //                               Row(
                                     //                                 children: [
                                     //                                   const Icon(
                                     //                                     IconlyLight.calendar,
                                     //                                     size: 15,
                                     //                                     color: Color(0xff242424),
                                     //                                   ),
                                     //                                   const SizedBox(width: 5),
                                     //                                   SizedBox(
                                     //                                     width:Get.width*0.40,
                                     //
                                     //                                     child:Text(
                                     //                                       "Booked Date : ${homecontroller.homedata.value.data!.homeFilterData![i].bookedDate} , ${homecontroller.homedata.value.data!.homeFilterData![i].bookingTime}",
                                     //                                       style: ThemeText.bodydata,
                                     //                                       // endColor: ThemeText.basiccolor,
                                     //                                       //
                                     //                                       // duration: Duration(milliseconds: 500),
                                     //                                     ),
                                     //                                   )
                                     //                                 ],
                                     //                               ),
                                     //                               const SizedBox(height: 7,),
                                     //                               Row(
                                     //                                 children: [
                                     //                                   const Icon(
                                     //                                     Icons.note_alt_outlined,
                                     //                                     size: 15,
                                     //                                     color: Color(0xff242424),
                                     //                                   ),
                                     //                                   const SizedBox(width: 5),
                                     //                                   Text(
                                     //                                     "Booked by : ${homecontroller.homedata.value.data!.homeFilterData![i].customerName}",
                                     //                                     style: ThemeText.bodydata,
                                     //                                     // endColor: ThemeText.basiccolor,
                                     //                                     //
                                     //                                     // duration: Duration(milliseconds: 500),
                                     //                                   ),
                                     //                                 ],
                                     //                               ),
                                     //                               const SizedBox(height: 7,),
                                     //                               Row(
                                     //                                 children: [
                                     //
                                     //                                   Text(
                                     //                                     '\$ ${homecontroller.homedata.value.data!.homeFilterData![i].totalAmount.toString()}',
                                     //                                     style: ThemeText.amount,
                                     //
                                     //                                     // endColor: ThemeText.basiccolor,
                                     //                                     //
                                     //                                     // duration: Duration(milliseconds: 500),
                                     //                                   ),
                                     //                                   const SizedBox(width: 5),
                                     //                                   // if(homecontroller.homedata.value.data!.homeFilterData![i].paymentStatus=="1")
                                     //                                   // Text(
                                     //                                   //   '( paid )',
                                     //                                   //   style: ThemeText.bodydata,
                                     //                                   //   // endColor: ThemeText.basiccolor,
                                     //                                   //   //
                                     //                                   //   // duration: Duration(milliseconds: 500),
                                     //                                   // ),
                                     //                                 ],
                                     //                               ),
                                     //                             ],
                                     //                           ),)
                                     //
                                     //
                                     //                       ],
                                     //                     )
                                     //
                                     //
                                     //
                                     //                   ],
                                     //                 ),
                                     //               ),
                                     //             ),
                                     //           )
                                     //       else
                                     //         Column(
                                     //           mainAxisAlignment:
                                     //           MainAxisAlignment.spaceBetween,
                                     //           children: const [
                                     //             Image(
                                     //               image:
                                     //               AssetImage("images/nodata.png"),
                                     //             )
                                     //           ],
                                     //         )
                                     //
                                     //
                                     //     ],
                                     //   ),
                                     // ),

                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       )
                     ],
                   ),
                 ),): SafeArea(
                   child: AdvancedDrawer(
                       backdrop: Container(
                         width: double.infinity,
                         height: double.infinity,
                         decoration: BoxDecoration(
                           gradient: LinearGradient(
                             begin: Alignment.topLeft,
                             end: Alignment.bottomRight,
                             colors: [
                               ThemeText.basiccolor,
                               ThemeText.basiccolor.withOpacity(0.2)
                             ],
                           ),
                         ),
                       ),
                       controller: advancedDrawerController,
                       animationCurve: Curves.easeInOut,
                       animationDuration: const Duration(milliseconds: 300),
                       animateChildDecoration: true,
                       rtlOpening: false,

                       // openScale:1,
                       openScale: 0.85,
                       disabledGestures: false,
                       childDecoration: const BoxDecoration(
                         // NOTICE: Uncomment if you want to add shadow behind the page.
                         // Keep in mind that it may cause animation jerks.
                         // boxShadow: <BoxShadow>[
                         //   BoxShadow(
                         //     color: Colors.black12,
                         //     blurRadius: 0.0,
                         //   ),
                         // ],
                         borderRadius: BorderRadius.all(Radius.circular(16)),
                       ),
                       drawer: const Mydrawer(),
                       child: Scaffold(
                           drawer: ( advancedDrawerController.value.visible)
                               ? const Mydrawer()
                               : null,
                           appBar: AppBar(
                             backgroundColor: ThemeText.basiccolor,
                             elevation: 0,
                             automaticallyImplyLeading: false,
                             /*    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(0),
        ),
      ),*/
                             leading: IconButton(
                               onPressed: () {
                                 advancedDrawerController.hideDrawer();
                               },
                               icon: ValueListenableBuilder<AdvancedDrawerValue>(
                                 valueListenable:  advancedDrawerController,
                                 builder: (_, value, __) {
                                   return const AnimatedSwitcher(
                                     duration: Duration(milliseconds: 250),
                                     child:Text(""),
                                   );
                                 },
                               ),
                             ),

                             centerTitle: true,
                             title: Text(
                               Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.mailVerification!.heading.toString(),
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
                                           Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.mailVerification!.heading.toString(),style: ThemeText.heading,),
                                           const  SizedBox(height:20),
                                           // Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceBookingConformation!.bookingSuccessfully.toString(),style: ThemeText.heading3,),
                                           // const SizedBox(height:30),
                                           Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.mailVerification!.content.toString(),style: ThemeText.bodydata,
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

                                                     Get.put(Homecontroller()).homescreen(  {
                                                       "location":"",
                                                     },
                                                         "home_page");
                                                     // Get.offNamed(AppRoutes.home);



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
                                                               child:  Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.mailVerification!.button1.toString(),
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
                                                           children:  [

                                                             Padding(padding:  const EdgeInsets.only(left: 5,),
                                                               child:  Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.mailVerification!.button2.toString(),
                                                                   style:  const TextStyle(
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
                           ))));
             }else{
                return const LoadingScreen();
              }
            })),),);
  }
}
