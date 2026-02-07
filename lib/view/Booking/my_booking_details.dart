import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Controller/Booking_Controller/booking_accept_reject_controller.dart';
import '../../Controller/Booking_Controller/view_my_booking_details_controller.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../Commonpage/export.dart';
class MybookingDetails extends StatefulWidget {
  const MybookingDetails({super.key});

  @override
  State<MybookingDetails> createState() => _MybookingDetailsState();
}

class _MybookingDetailsState extends State<MybookingDetails> {
  Mybookingdetailscontroller mybookingdetailscontroller =  Get.put(Mybookingdetailscontroller());
  GoogleMapController? googleMapController;
  // static  CameraPosition initialCameraPosition = const CameraPosition(target: LatLng(11.0168, 76.9558), zoom: 14);

  Set<Marker> markers = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mybookingdetailscontroller.employeedetailsscreen({}, "employee_list");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx((){

        if(mybookingdetailscontroller.mybookingdetailsresponseStatus.isFalse &&  Get.put(Bookingacceptrejectcontroller()).bookingacceptrejectresponseStatus.isFalse){
          return Scaffold(

            bottomSheet: Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,

              decoration: const BoxDecoration(
                color: Color(0xffE1E1E1),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
              ),
              child: Card(
                color: (mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.status ==mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.userCancelled || mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.status ==mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.completed)?ThemeText.basiccolor:Colors.white,
                elevation: 10,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.status==mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.pending)
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    height: 50.0,
                                    child: ElevatedButton(
                                      style:ButtonStyle(
                                        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                                          if (states.contains(MaterialState.disabled)) {
                                            return Colors.green;
                                          }
                                          return Colors.green;

                                        },
                                        ),
                                      ),
                                      onPressed: () {
                                        // print("venkat${int.parse(mybookingdetailscontroller.employee_id.toString())}");


                                        if(Get.put(Bookingacceptrejectcontroller()).durationformkey.currentState!.validate()) {
                                          Get.put(Bookingacceptrejectcontroller()).bookingacceptscreen({
                                            "booking_id":mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.id,
                                            "status":mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.accepted,
                                            "employee_id":int.parse(mybookingdetailscontroller.employee_id.toString())==null?int.parse(mybookingdetailscontroller.employee_id.toString()):mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.employeeId,
                                            }, "accept_status").whenComplete(() => Get.put(Mybookingdetailscontroller()).mybookingdetailsscreen({
                                            // "user_id": Getstore.box.read("userid"),
                                            "booking_id":mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.id,
                                          }, "view_booking_details"));
                                        }

                                      },


                                      child:(1<2)? Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                      "Accept",
                                            style: ThemeText.content,
                                          ),
                                        ],
                                      ):const SpinKitFadingCircle(
                                        color:Colors.white,
                                        size: 25.0,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    height: 50.0,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                                          if (states.contains(MaterialState.disabled)) {
                                            return Colors.red;
                                          }
                                          return Colors.red;

                                        },
                                        ),
                                      ),
                                      onPressed: () {

                                        Get.put(Bookingacceptrejectcontroller()).bookingacceptscreen({
                                          "booking_id":mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.id,
                                          "status":mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.rejected,
                                        }, "accept_status").whenComplete(() => Get.put(Mybookingdetailscontroller()).mybookingdetailsscreen({
                                          // "user_id": Getstore.box.read("userid"),
                                          "booking_id":mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.id,
                                        }, "view_booking_details"));


                                      },


                                      child:(1<2)? Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Reject",
                                            style: ThemeText.content,
                                          ),

                                        ],
                                      ):const SpinKitFadingCircle(
                                        color:Colors.white,
                                        size: 25.0,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          )

                        ],
                      )
                    else if(mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.status==mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.accepted)
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    height: 50.0,
                                    child: ElevatedButton(
                                      style:ButtonStyle(
                                        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                                          if (states.contains(MaterialState.disabled)) {
                                            return ThemeText.appcolor;
                                          }
                                          return ThemeText.appcolor;

                                        },
                                        ),
                                      ),
                                      onPressed: () {
                                        if(mybookingdetailscontroller.mybookingdetailsdata.value.data!.serviceData!.servicePriceUnit.toString()=="Fixed" && (mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.status != mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.completed)){
                                          Get.put(Bookingacceptrejectcontroller()).bookingacceptscreen({
                                            "booking_id":mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.id,
                                            "status":mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.completed,
                                            // "service_duration":Get.put(Bookingacceptrejectcontroller()).serviceDuration.text,
                                          }, "accept_status").whenComplete(() => Get.put(Mybookingdetailscontroller()).mybookingdetailsscreen({
                                            // "user_id": Getstore.box.read("userid"),
                                            "booking_id":mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.id,
                                          }, "view_booking_details"));
                                        }
                                        if(Get.put(Bookingacceptrejectcontroller()).durationformkey.currentState!.validate()) {
                                          Get.put(Bookingacceptrejectcontroller()).bookingacceptscreen({
                                            "booking_id":mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.id,
                                            "status":mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.completed,
                                            "service_duration":Get.put(Bookingacceptrejectcontroller()).serviceDuration.text,
                                          }, "accept_status").whenComplete(() => Get.put(Mybookingdetailscontroller()).mybookingdetailsscreen({
                                            // "user_id": Getstore.box.read("userid"),
                                            "booking_id":mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.id,
                                          }, "view_booking_details"));
                                        }




                                      },


                                      child:(1<2)? Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Complete Service",
                                            style: ThemeText.content,
                                          ),

                                        ],
                                      ):const SpinKitFadingCircle(
                                        color:Colors.white,
                                        size: 25.0,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    height: 50.0,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                                          if (states.contains(MaterialState.disabled)) {
                                            return Colors.red;
                                          }
                                          return Colors.red;

                                        },
                                        ),
                                      ),
                                      onPressed: () {


                                        Get.put(Bookingacceptrejectcontroller()).bookingacceptscreen({
                                          "booking_id":mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.id,
                                          "status":mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.rejected,
                                        }, "accept_status").whenComplete(() => Get.put(Mybookingdetailscontroller()).mybookingdetailsscreen({
                                          // "user_id": Getstore.box.read("userid"),
                                          "booking_id":mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.id,
                                        }, "view_booking_details"));

                                      },


                                      child:(1<2)? Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Reject",
                                            style: ThemeText.content,
                                          ),

                                        ],
                                      ):const SpinKitFadingCircle(
                                        color:Colors.white,
                                        size: 25.0,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          )

                        ],
                      )
                    else if(mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.status==mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.rejected)
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      height: 50.0,
                                      child: ElevatedButton(
                                        style:ButtonStyle(
                                          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                                            if (states.contains(MaterialState.disabled)) {
                                              return Colors.green;
                                            }
                                            return Colors.green;

                                          },
                                          ),
                                        ),
                                        onPressed: () {


                                          Get.put(Bookingacceptrejectcontroller()).bookingacceptscreen({
                                            "booking_id":mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.id,
                                            "status":mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.accepted,
                                          }, "accept_status").whenComplete(() => Get.put(Mybookingdetailscontroller()).mybookingdetailsscreen({
                                            // "user_id": Getstore.box.read("userid"),
                                            "booking_id":mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.id,
                                          }, "view_booking_details"));

                                        },


                                        child:(1<2)? Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Accept",
                                              style: ThemeText.content,
                                            ),

                                          ],
                                        ):const SpinKitFadingCircle(
                                          color:Colors.white,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      height: 50.0,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                                            if (states.contains(MaterialState.disabled)) {
                                              return const Color(0xffFF6B6A);
                                            }
                                            return const Color(0xffFF6B6A);

                                          },
                                          ),
                                        ),
                                        onPressed: () {




                                        },


                                        child:(1<2)? Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Rejected",
                                              style: ThemeText.content,
                                            ),

                                          ],
                                        ):const SpinKitFadingCircle(
                                          color:Colors.white,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            )

                          ],
                        )
                      else
                        Container(

                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 15),
                            child: Row(
                              children: [
                                if(mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.status ==mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.userCancelled)
                                  Text("Booking Cancelled by ${ mybookingdetailscontroller.mybookingdetailsdata.value.data!.usersData!.firstname}",style: ThemeText.bodydata.merge(const TextStyle(fontSize: 15)),),
                                if(mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.status ==mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.completed)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Image(
                                        width: 55,
                                        image: AssetImage("images/sucess.gif"),
                                      ),
                                      Text("Booking Completed",style: ThemeText.bodydata.merge(const TextStyle(fontSize: 15)),)
                                    ],
                                  ),
                              ],
                            )
                        )

                  ],
                ),
              ),
            ),
            body:CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  expandedHeight: 370,
                  elevation: 0,
                  // pinned: true,
                  floating: true,
                  iconTheme: IconThemeData(color: Get.theme.primaryColor),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  snap: false,
                  pinned: false,

                  flexibleSpace: FlexibleSpaceBar(
                    background: GoogleMap(
                      initialCameraPosition:  CameraPosition(target: LatLng(double.parse(mybookingdetailscontroller.mybookingdetailsdata.value.address![0].adLatitude.toString()),double.parse(mybookingdetailscontroller.mybookingdetailsdata.value.address![0].adLongitude.toString())), zoom: 14),
                      markers: markers,
                      zoomControlsEnabled: false,
                      mapType: MapType.normal,
                      onTap: (value){
                        // _getAddressFromLatLng(value);
                      },
                      onMapCreated: (GoogleMapController controller) {
                        googleMapController = controller;
                      },
                    ), //Images.network
                  ), //FlexibleSpaceBar

                  // backgroundColor: Colors.greenAccent[400],
                  leading:  Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 30,
                        ),
                      );
                    },
                  ), //IconButton
                  //<Widget>[]
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children:  [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), // Set your desired border radius here
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                              shadowColor: ThemeText.basiccolor,
                              elevation: 7,
                              child: Padding(
                                padding:const EdgeInsets.all(5.0),
                                child:   Row(
                                  children: [
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  mybookingdetailscontroller.mybookingdetailsdata.value.data!.serviceData!.firstname.toString()??"",
                                                  style:
                                                  TextStyle(
                                                    color:  ThemeText.secondarycolor,
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






                                          Row(

                                            children: [
                                              const Icon(Icons.person_outline, color:Colors.black,),
                                              const SizedBox(width: 8),
                                              Text(
                                                mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.prosName.toString()??"",
                                                style:
                                                TextStyle(
                                                  color:  ThemeText.secondarycolor,
                                                  fontSize:
                                                  16.0,
                                                  fontWeight:
                                                  FontWeight
                                                      .w600,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.place_outlined,color:Colors.black),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text( mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.address.toString() ?? '', maxLines: 2, overflow: TextOverflow.ellipsis, style: Get.textTheme.bodyText1),
                                              ),
                                            ],
                                            // spacing: 8,
                                            // crossAxisAlignment: WrapCrossAlignment.center,
                                          ),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: ThemeText.appcolor,
                                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.bookingDay.toString()??"",
                                              maxLines: 1,
                                              style:ThemeText.bodydata!.merge(
                                                const TextStyle(fontSize:14,height: 1.4,fontWeight:FontWeight.bold,color: Colors.white),
                                              ),
                                              softWrap: false,
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.fade),
                                          Text(mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.bookingTime.toString(),
                                              maxLines: 1,
                                              style: ThemeText.bodydata!.merge(
                                                const TextStyle( fontSize:17,height: 1.4,fontWeight:FontWeight.bold,color: Colors.white),
                                              ),
                                              softWrap: false,
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.fade),
                                          Text(mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.bookingDate.toString(),
                                              maxLines: 1,
                                              style: ThemeText.bodydata!.merge(
                                                const TextStyle(fontSize:14,height: 1.4,fontWeight:FontWeight.bold,color: Colors.white),
                                              ),
                                              softWrap: false,
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.fade),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                      if(mybookingdetailscontroller.mybookingdetailsdata.value.data!.serviceData!.servicePriceUnit.toString()=="Hourly" && (mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.status != mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.completed))
                        const SizedBox(
                          height: 20,
                        ),
                      if(mybookingdetailscontroller.mybookingdetailsdata.value.data!.serviceData!.servicePriceUnit.toString()=="Hourly" && (mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.status != mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.completed))
                        Form(
                          key: Get.put(Bookingacceptrejectcontroller()).durationformkey,
                          child:   Padding(
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
                                                "Service Duration to Complete" ,
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
                                          controller:Get.put(Bookingacceptrejectcontroller()).serviceDuration,

                                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                          autocorrect: true,
                                          keyboardType: TextInputType.phone,
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


                                          decoration:  Common.common("Example : 1",IconlyLight.time_circle),
                                        ),



                                      ],
                                    ),




                                  )),
                            ),
                          ),),
                      const SizedBox(
                        height: 20,
                      ),
                      if(mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.status==mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.pending)...[
                        Form(
                          key:Get.put(Bookingacceptrejectcontroller()).durationformkey,
                          child: Padding(
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
                                                "Assign the Employee" ,
                                                style: TextStyle(
                                                  color: ThemeText.headingcolor,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if(mybookingdetailscontroller.employeedetailsdata.value.data!=null)
                                          mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.employeeId==null?
                                        Container(
                                          padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
                                          child: DropdownButtonFormField2<dynamic>(
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              contentPadding: const EdgeInsets.all(10.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    width: 1, color: Colors.white),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              errorStyle: const TextStyle(color: Colors.red),
                                              errorBorder: OutlineInputBorder(
                                                borderSide:
                                                const BorderSide(width: 1, color: Colors.white),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderSide:
                                                const BorderSide(width: 1, color: Colors.white),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    width: 1, color:Colors.white),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              floatingLabelStyle:
                                              const TextStyle(color: Color(0xff7E7E7E)),
                                            ),
                                            isExpanded: true,
                                            hint: const Text(
                                              'Assign the Employee',
                                            ),
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                            iconStyleData: const IconStyleData(
                                              icon: Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                color: Colors.black,
                                              ),
                                              iconSize: 20,
                                            ),
                                            dropdownStyleData: DropdownStyleData(
                                              // maxHeight: 200,
                                              // width: 200,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              offset: const Offset(-10, -10),
                                              scrollbarTheme: ScrollbarThemeData(
                                                radius: const Radius.circular(5),
                                                thickness: MaterialStateProperty.all<double>(6),
                                                thumbVisibility:
                                                MaterialStateProperty.all<bool>(true),
                                              ),
                                            ),
                                            menuItemStyleData: const MenuItemStyleData(
                                              height: 40,
                                              padding: EdgeInsets.only(left: 14, right: 14),
                                            ),
                                            items: mybookingdetailscontroller.employeedetailsdata.value.data!
                                                .map((item) => DropdownMenuItem<dynamic>(
                                              value:  item.userId.toString(),
                                              child: Text(
                                                item.firstname.toString(),
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ))
                                                .toList(),
                                            value: mybookingdetailscontroller.employee_id,
                                            validator: (value) {
                                              if (value == null || value == " ") {
                                                return 'Assign the Employee';
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                mybookingdetailscontroller.employee_id = value;
                                              });
                                            },
                                          ),
                                        ):Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                          child: Row(

                                              mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.employeeName.toString()),
                                            ],
                                          ),
                                        )
                                        else
                                          Padding(padding:const EdgeInsets.only(left:10,right:10,top:10,bottom:10),
                                            child:Container(
                                              width: Get.width * 1,
                                              height: Get.height * 0.1,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: ThemeText.basiccolor,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: ThemeText.basiccolor,
                                                      spreadRadius: 3),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Employees not Added",
                                                  style: ThemeText.heading1,
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),




                                  )),
                            ),
                          ),
                        )
                      ],
                      const SizedBox(
                        height: 20,
                      ),






                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8),
                        child: Container(
                          // padding: const EdgeInsets.symmetric(
                          //     horizontal: 3.0, vertical: 3.0),

                            decoration: BoxDecoration(
                              // color:ThemeText.basiccolor, // Set your desired color here
                              borderRadius:
                              BorderRadius.circular(5), // Set your desired border radius here
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(5),
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Contact Us",
                                                style:
                                                TextStyle(
                                                  color: ThemeText.secondarycolor,
                                                  fontSize:
                                                  16.0,
                                                  fontWeight:
                                                  FontWeight
                                                      .w600,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "If you have any question!",
                                                style: ThemeText
                                                    .bodydata,
                                              ),
                                            ],
                                          ),
                                          Row(

                                            children:  [
                                              Container(
                                                width:40,
                                                height: 40,

                                                decoration: BoxDecoration(
                                                  color:ThemeText.basiccolor,
                                                  borderRadius: BorderRadius.circular(5.0),
                                                ),
                                                child: IconButton(
                                                  splashColor: Colors.white,
                                                  padding: const EdgeInsets.all(0),
                                                  icon:  Icon(IconlyLight.call,color:ThemeText.appcolor,size: 20),
                                                  onPressed: ()  async{
                                                    final url = Uri.parse("tel:// ${mybookingdetailscontroller.mybookingdetailsdata.value.data!.usersData!.mobileno.toString()}");
                                                    await launchUrl(url, mode: LaunchMode.externalApplication);
                                                  },
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                width:40,
                                                height: 40,

                                                decoration: BoxDecoration(
                                                  color:ThemeText.basiccolor,
                                                  borderRadius: BorderRadius.circular(5.0),
                                                ),
                                                child: IconButton(
                                                  splashColor: Colors.white,
                                                  padding: const EdgeInsets.all(0),
                                                  icon:  Icon(Icons.sms_outlined,color:ThemeText.appcolor,size: 20),
                                                  onPressed: ()  async{
                                                    final url = Uri.parse("sms:// ${mybookingdetailscontroller.mybookingdetailsdata.value.data!.usersData!.mobileno.toString()}");
                                                    await launchUrl(url, mode: LaunchMode.externalApplication);
                                                  },
                                                ),
                                              ),

                                            ],
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

                                  ],
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal:  5.0,vertical: 0.0),
                        child:   Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              // Set your desired border radius here
                            ),
                            height: Get.height*0.55,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              shadowColor:
                              ThemeText.basiccolor,
                              elevation: 7,
                              child: Padding(
                                padding:
                                const EdgeInsets.all(
                                    5.0),
                                child:Padding(
                                  padding:const EdgeInsets.symmetric(horizontal:  15.0,vertical: 0.0),
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Container(
                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                          child:  Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Payment Summary",
                                                style:    TextStyle(
                                                  color: ThemeText.secondarycolor,
                                                  fontSize:
                                                  16.0,
                                                  fontWeight:
                                                  FontWeight
                                                      .w600,
                                                ),
                                              ),
                                              if(mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.status ==mybookingdetailscontroller.mybookingdetailsdata.value.data!.dynamicStatus!.completed)
                                                if(mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.paymentStatus=="1")
                                                  Container(
                                                      width:70,
                                                      height:33,

                                                      decoration: BoxDecoration(
                                                        color:Colors.green,
                                                        borderRadius: BorderRadius.circular(5.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: const [
                                                          Text(
                                                            "Paid",style:TextStyle(color:Colors.white,fontSize: 14),
                                                          )
                                                        ],
                                                      )
                                                  )
                                                else if(mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.paymentStatus=="2")
                                                  Container(
                                                      width:70,
                                                      height:33,

                                                      decoration: BoxDecoration(
                                                        color:const Color(0xffF2A323),
                                                        borderRadius: BorderRadius.circular(5.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: const [
                                                          Text(
                                                            "Unpaid",style:TextStyle(color:Colors.white,fontSize: 14),
                                                          )
                                                        ],
                                                      )
                                                  )
                                                else
                                                  Container(
                                                      width:70,
                                                      height:33,
                                                      decoration: BoxDecoration(
                                                        color:Colors.red,
                                                        borderRadius: BorderRadius.circular(5.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: const [
                                                          Text(
                                                            "Failed",style:TextStyle(color:Colors.white,fontSize: 14),
                                                          )
                                                        ],
                                                      )
                                                  )
                                            ],
                                          )
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:  [
                                            SizedBox(
                                              child: Text(
                                                "Quantity",
                                                style: ThemeText
                                                    .bodydata,
                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.quantity.toString(),
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        child: Divider(
                                          color: Color(0xffEFEFF2),
                                          thickness: 2,
                                          height: 20,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:  [
                                            SizedBox(
                                              child: Text(
                                                "Booking Date",
                                                style: ThemeText
                                                    .bodydata,
                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.bookingDate.toString(),
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        child: Divider(
                                          color: Color(0xffEFEFF2),
                                          thickness: 2,
                                          height: 20,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:  [
                                            SizedBox(
                                              child: Text(
                                                "Booking Day",
                                                style: ThemeText
                                                    .bodydata,
                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.bookingDay.toString(),
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        child: Divider(
                                          color: Color(0xffEFEFF2),
                                          thickness: 2,
                                          height: 20,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:  [
                                            SizedBox(
                                              child: Text(
                                                "Booking Time",
                                                style: ThemeText
                                                    .bodydata,
                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.bookingTime.toString(),
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(
                                        child: Divider(
                                          color: Color(0xffEFEFF2),
                                          thickness: 2,
                                          height: 20,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:  [
                                            SizedBox(
                                              child: Text(
                                                "Discount Amount",
                                                style: ThemeText
                                                    .bodydata,
                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                "${Get.put(Settingscontroller()).settingsdata.value.data!.currencyData!.symbol.toString()} ${mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.discountAmount.toString()}",

                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        child: Divider(
                                          color: Color(0xffEFEFF2),
                                          thickness: 2,
                                          height: 20,
                                        ),
                                      ),

                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:  [
                                            SizedBox(
                                              child: Text(
                                                "Service Price Unit",
                                                style: ThemeText
                                                    .bodydata,
                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                mybookingdetailscontroller.mybookingdetailsdata.value.data!.serviceData!.servicePriceUnit.toString(),
                                                style:  TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w700,
                                                    color: ThemeText.appcolor
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        child: Divider(
                                          color: Color(0xffEFEFF2),
                                          thickness: 2,
                                          height: 20,
                                        ),
                                      ),
                                      if(mybookingdetailscontroller.mybookingdetailsdata.value.data!.serviceData!.servicePriceUnit.toString()=="Hourly")...[
                                        Container(
                                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:  [
                                              SizedBox(
                                                child: Text(
                                                  "Duration",
                                                  style: ThemeText
                                                      .bodydata,
                                                ),
                                              ),
                                              SizedBox(
                                                child: Text(
                                                  mybookingdetailscontroller.mybookingdetailsdata.value.data!.serviceData!.serviceDuration.toString(),
                                                  style:  TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight: FontWeight.w700,
                                                      color: ThemeText.appcolor
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          child: Divider(
                                            color: Color(0xffEFEFF2),
                                            thickness: 2,
                                            height: 20,
                                          ),
                                        ),
                                      ],
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:  [
                                            SizedBox(
                                              child: Text(
                                                "Amount",
                                                style: ThemeText
                                                    .bodydata,
                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                "${Get.put(Settingscontroller()).settingsdata.value.data!.currencyData!.symbol.toString()} ${mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.actualAmount.toString()}",
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        child: Divider(
                                          color: Color(0xffEFEFF2),
                                          thickness: 2,
                                          height: 20,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:  [
                                            SizedBox(
                                              child: Text(
                                                "Tax",
                                                style: ThemeText
                                                    .bodydata,
                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                "${Get.put(Settingscontroller()).settingsdata.value.data!.currencyData!.symbol.toString()} ${mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.taxValue.toString()}",
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        child: Divider(
                                          color: Color(0xffEFEFF2),
                                          thickness: 2,
                                          height: 20,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:  [
                                            SizedBox(
                                              child: Text(
                                                "Total",
                                                style: ThemeText
                                                    .bodydata,
                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(

                                                "${Get.put(Settingscontroller()).settingsdata.value.data!.currencyData!.symbol.toString()} ${mybookingdetailscontroller.mybookingdetailsdata.value.data!.bookingData!.totalPayableAmount.toString()}",
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),),


                      const SizedBox(
                        height:100,
                      ),
                    ],
                  ),
                )//SliverAppBar

              ], //<Widget>[]
            ) ,);
        }else{
          return  Container(
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


      }),
    );
  }
}
