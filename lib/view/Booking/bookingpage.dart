import '../../Controller/Booking_Controller/booking_controller.dart';
import '../../Controller/Booking_Controller/view_my_booking_details_controller.dart';
import '../../Controller/Provider_Controller/provider_list_filter.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/logincontroller.dart';
import '../commonpage/export.dart';
import '../commonpage/loader.dart';
class Bookingpage extends StatefulWidget {
  const Bookingpage({Key? key}) : super(key: key);

  @override
  State<Bookingpage> createState() => _BookingpageState();
}

class _BookingpageState extends State<Bookingpage> {
  var intialindex = 0;
  Bookingcontroller bookingcontroller = Get.put(Bookingcontroller());
  ProviderListfiltercontroller providerListfiltercontroller = Get.put(ProviderListfiltercontroller());

  @override
  Widget build(BuildContext context) {
    return Obx((){
if(providerListfiltercontroller.providerfilterresponseStatus.isFalse)
      {
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
              Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.booking!.title.toString(),
              style: ThemeText.title1,
            ),
          ),
          bottomNavigationBar: const Bottomnavigation(
            item: 3,
          ),
          body: Container(
            height: Get.height*1,

            child:  DefaultTabController(
              initialIndex: intialindex,
              length: providerListfiltercontroller.providerlistfilterdata.value.dynamicOption!.length,
              child: Column(
                children: <Widget>[
                  ButtonsTabBar(
                    backgroundColor: ThemeText.basiccolor,
                    radius: 5.0,
                    contentPadding:const EdgeInsets.symmetric(horizontal: 25),
                    unselectedBackgroundColor: Color(0xffF0F1F3),
                    unselectedLabelStyle: ThemeText.buttontab,
                    labelStyle:ThemeText.textdata1,
                    onTap: (initialIndex) {
                      for(var i=0;i< providerListfiltercontroller.providerlistfilterdata.value.dynamicOption!.length;i++){
                        if(initialIndex==i) {
                          // setState(() {
                          //   intialindex1=i;
                          // });
                          if(providerListfiltercontroller.providerlistfilterdata.value.dynamicOption![i].statusName=="All"){
                            bookingcontroller.bookingscreen({
                              // "user_id": Getstore.box.read("userid"),
                              "user_id": Getstore.box.read("userid"),
                              "filter": "",
                            }, "booking_list");

                          }else{
                            // setState(() {
                            //   intialindex1=i;
                            // });
                            bookingcontroller.bookingscreen({
                              // "user_id": Getstore.box.read("userid"),
                              "user_id": Getstore.box.read("userid"),
                              "filter": providerListfiltercontroller.providerlistfilterdata.value.dynamicOption![i].mainStatusId,
                            }, "booking_list");

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
                      children: <Widget>[
                        for(var i=0;i< providerListfiltercontroller.providerlistfilterdata.value.dynamicOption!.length;i++)
                        Obx((){
                          if(bookingcontroller.bookingresponseStatus.isFalse)
                          {
                            return  SingleChildScrollView(
                              child: Column(
                                children:  [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  if(bookingcontroller.bookingdata.value.data !=null)
                                    for(var i=0;i<bookingcontroller.bookingdata.value.data!.length;i++)
                                      Padding(padding:const EdgeInsets.only(left: 6,right: 6,top:6,bottom: 6),
                                        child:    InkWell(
                                          onTap: (){


                                            Get.put(Mybookingdetailscontroller()).mybookingdetailsscreen({
                                              // "user_id": Getstore.box.read("userid"),
                                              "booking_id":bookingcontroller.bookingdata.value.data![i].bookingId,
                                            }, "view_booking_details");
                                            Get.toNamed(AppRoutes.bookingdetails);


                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: ThemeText.basiccolor,
                                              ),
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children:  [
                                                // const Divider(
                                                //   color: Colors.green,
                                                //   thickness: 0.5,
                                                //   indent : 10,
                                                //   endIndent : 10,
                                                // ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets.all(0.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(5.0),
                                                      ),
                                                      child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(5),
                                                          child: ImageFade(
                                                            width:
                                                            MediaQuery.of(context).size.width *
                                                                0.43,
                                                            height: Get.height*0.2,

                                                            // whenever the image changes, it will be loaded, and then faded in:
                                                            image:  NetworkImage(
                                                              bookingcontroller.bookingdata.value.data![i].serviceImage.toString(),
                                                            ),

                                                            // slow-ish fade for loaded images:
                                                            duration:
                                                            const Duration(milliseconds: 900),

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
                                                    Padding(padding: const EdgeInsets.only(
                                                      left: 10,),
                                                      child:  Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children:  [
                                                          Padding(padding: const EdgeInsets.only(
                                                            left: 0,),
                                                            child: Text(
                                                              bookingcontroller.bookingdata.value.data![i].serviceName.toString(),
                                                              style: ThemeText.heading1,
                                                            ),),
                                                          const SizedBox(height: 7,),

                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                IconlyLight.location,
                                                                size: 15,
                                                                color: Color(0xff242424),
                                                              ),
                                                              const SizedBox(width: 5),
                                                              SizedBox(
                                                                width:Get.width*0.4,
                                                                child: Text(
                                                                  bookingcontroller.bookingdata.value.data![i].address.toString(),
                                                                  style: ThemeText.bodydata,
                                                                  maxLines: 2,
                                                                  // endColor: ThemeText.basiccolor,
                                                                  //
                                                                  // duration: Duration(milliseconds: 500),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 7,),

                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                IconlyLight.calendar,
                                                                size: 15,
                                                                color: Color(0xff242424),
                                                              ),
                                                              const SizedBox(width: 5),
                                                              SizedBox(
                                                                width:Get.width*0.40,

                                                                child:Text(
                                                                  "Booked Date : ${bookingcontroller.bookingdata.value.data![i].bookedDate} , ${bookingcontroller.bookingdata.value.data![i].bookingTime}",
                                                                  style: ThemeText.bodydata,
                                                                  // endColor: ThemeText.basiccolor,
                                                                  //
                                                                  // duration: Duration(milliseconds: 500),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          const SizedBox(height: 7,),
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                Icons.note_alt_outlined,
                                                                size: 15,
                                                                color: Color(0xff242424),
                                                              ),
                                                              const SizedBox(width: 5),
                                                              Text(
                                                                "Booked by : ${bookingcontroller.bookingdata.value.data![i].customerName}",
                                                                style: ThemeText.bodydata,
                                                                // endColor: ThemeText.basiccolor,
                                                                //
                                                                // duration: Duration(milliseconds: 500),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 7,),
                                                          Row(
                                                            children: [

                                                              Text(
                                                                '${Get.put(Settingscontroller()).settingsdata.value.data!.currencyData!.symbol.toString()} ${bookingcontroller.bookingdata.value.data![i].totalAmount.toString()}',
                                                                style: ThemeText.amount,

                                                                // endColor: ThemeText.basiccolor,
                                                                //
                                                                // duration: Duration(milliseconds: 500),
                                                              ),
                                                              const SizedBox(width: 5),
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
                                  else
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Image(
                                          image:
                                          AssetImage("images/nodata.png"),
                                        )
                                      ],
                                    )


                                ],
                              ),
                            );
                          }else{
                            return const LoadingScreen();
                          }
                        }),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        );
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
