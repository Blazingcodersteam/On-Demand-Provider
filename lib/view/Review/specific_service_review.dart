import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Controller/Review_list_Controller/review_detail_controller.dart';
import '../../Controller/Review_list_Controller/review_dynamic_option_controller.dart';
import '../../Controller/Review_list_Controller/specific_review_controller.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/logincontroller.dart';
import '../commonpage/export.dart';

class Specificservicereview extends StatefulWidget {
  const Specificservicereview({Key? key}) : super(key: key);

  @override
  State<Specificservicereview> createState() => _SpecificservicereviewState();
}

class _SpecificservicereviewState extends State<Specificservicereview> {
  var intialindex = 0;
  Specificservicereviewcontroller specificservicereviewcontroller = Get.put(Specificservicereviewcontroller());
  Reviewdynamiccontroller reviewdynamiccontroller = Get.put(Reviewdynamiccontroller());
  bool reviewstatus=false;

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(reviewdynamiccontroller.reviewdynamicresponseStatus.isFalse)
      {
        return Scaffold(
          appBar: AppBar(
            backgroundColor:  ThemeText.basiccolor,
            elevation: 0,
            automaticallyImplyLeading: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(5),
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
              Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.review!.title.toString(),
              style: ThemeText.title1,
            ),
          ),
          body: DefaultTabController(
            initialIndex: intialindex,
            length: reviewdynamiccontroller.reviewdynamicdata.value.dynamicOption!.length,
            child: Column(
              children: <Widget>[
                const SizedBox(height:20),
                ButtonsTabBar(
                  backgroundColor: ThemeText.basiccolor,
                  radius: 5.0,
                  contentPadding:const EdgeInsets.symmetric(horizontal: 25),
                  unselectedBackgroundColor: const Color(0xffF0F1F3),
                  unselectedLabelStyle: ThemeText.buttontab,
                  labelStyle:ThemeText.textdata1,
                  onTap: (intialindex) {
                    for(var i=0;i< reviewdynamiccontroller.reviewdynamicdata.value.dynamicOption!.length;i++){
                      if(intialindex==i) {
                        if(reviewdynamiccontroller.reviewdynamicdata.value.dynamicOption![i].reviewStatus=="All"){
                          // setState(() {
                          //   status=1;
                          // });
                          specificservicereviewcontroller.specificservicereviewscreen({
                            "user_id":Getstore.box.read("userid").toString(),
                            "service_id":specificservicereviewcontroller.specificservicereviewdata.value.data!.serviceId,
                            "filter":"",
                          }, "review_page");
                        }else{
                          // setState(() {
                          //   status=0;
                          // });

                          specificservicereviewcontroller.specificservicereviewscreen({
                            "user_id":Getstore.box.read("userid").toString(),
                            "service_id":specificservicereviewcontroller.specificservicereviewdata.value.data!.serviceId,
                            "filter":reviewdynamiccontroller.reviewdynamicdata.value.dynamicOption![i].reviewStatusId,
                          }, "review_page");
                        }
                      }
                    }
                  },
                  tabs:  [
                    for(var i=0;i< reviewdynamiccontroller.reviewdynamicdata.value.dynamicOption!.length;i++)
                      Tab(
                        // icon: Icon(Icons.directions_car),
                        text: reviewdynamiccontroller.reviewdynamicdata.value.dynamicOption![i].reviewStatus,
                      ),],
                ),
                const SizedBox(height:20),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      for(var i=0;i< reviewdynamiccontroller.reviewdynamicdata.value.dynamicOption!.length;i++)
                       Obx((){
                         if(specificservicereviewcontroller.specificserviceresponseStatus.isFalse)
                         {
                           return  SingleChildScrollView(
                             child: Column(
                               children:  [

                                 if(specificservicereviewcontroller.specificservicereviewdata.value.data!.serviceReviews!.allReviwers !=null)
                                   for(var i=0;i<specificservicereviewcontroller.specificservicereviewdata.value.data!.serviceReviews!.allReviwers!.length;i++)

                           Padding(
                             padding: const EdgeInsets.only(left:10,right:10,top:10),
                             child:  Container(
                               padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                               decoration: BoxDecoration(
                                 border: Border.all(
                                   width: 1,
                                   color: ThemeText.basiccolor,
                                 ),
                                 borderRadius: BorderRadius.circular(5.0),
                               ),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children:  [
                                   // const Divider(
                                   //   color: Colors.green,
                                   //   thickness: 0.5,
                                   //   indent : 10,
                                   //   endIndent : 10,
                                   // ),

                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Container(
                                         margin: const EdgeInsets.only(top:6.0,bottom: 6.0),
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(5.0),
                                         ),
                                         child: ClipRRect(
                                             borderRadius: BorderRadius.circular(5),
                                             child: ImageFade(
                                               width: MediaQuery.of(context).size.width*0.25,
                                               height:Get.height*0.1,
                                               // whenever the image changes, it will be loaded, and then faded in:
                                               image: (specificservicereviewcontroller.specificservicereviewdata.value.data!.serviceReviews!.allReviwers![i].userImage !="")? NetworkImage(
                                                 specificservicereviewcontroller.specificservicereviewdata.value.data!.serviceReviews!.allReviwers![i].userImage.toString(),
                                               ):const NetworkImage("https://img.freepik.com/premium-photo/user-icon_867433-72.jpg"),

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

                                       Padding(
                                         padding: const EdgeInsets.only(
                                           left: 10,),
                                         child:  Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children:  [
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                                                 SizedBox(
                                                   width:Get.width*0.40,
                                                   child:Text(
                                                     specificservicereviewcontroller.specificservicereviewdata.value.data!.serviceReviews!.allReviwers![i].userName.toString(),
                                                     style: ThemeText.heading1,
                                                   ),
                                                 ),
                                                 Card(
                                                   color: const Color(0xffEEE7F7),
                                                   elevation: 0,
                                                   shape: RoundedRectangleBorder(
                                                     borderRadius:
                                                     BorderRadius.circular(5),
                                                   ),
                                                   child: Padding(
                                                     padding: const EdgeInsets.symmetric(
                                                         horizontal: 8.0,
                                                         vertical: 3.0),
                                                     child:Row(
                                                       children:  [
                                                         Icon(
                                                           IconlyLight.star,
                                                           color:ThemeText.appcolor,
                                                           size: 17,
                                                         ),
                                                         const SizedBox(
                                                           width: 5,
                                                         ),
                                                         Text(specificservicereviewcontroller.specificservicereviewdata.value.data!.serviceReviews!.allReviwers![i].rated.toString()+".0",style: ThemeText.textdata1,),
                                                         const SizedBox(
                                                           width: 5,
                                                         ),
                                                       ],
                                                     ),
                                                   ),
                                                 ),
                                               ],
                                             ),

                                             Row(
                                               children: [



                                                 Text(
                                                   specificservicereviewcontroller.specificservicereviewdata.value.data!.serviceReviews!.allReviwers![i].userCmt.toString(),
                                                   style: ThemeText.bodydata,
                                                   maxLines: 2,
                                                   // endColor: ThemeText.basiccolor,
                                                   //
                                                   // duration: Duration(milliseconds: 500),
                                                 ),
                                               ],
                                             ),


                                             const SizedBox(height: 7,),

                                           ],
                                         ),)
                                     ],
                                   ),


                                   Container(
                                     width: double.infinity,
                                     height: 40,
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
                                         Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.review!.reviewButton.toString(),
                                         style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                       ),
                                       onPressed: () {
                                         Get.put(Reviewdetailscontroller()).reviewdetailscreen(
                                             {
                                               "review_id":specificservicereviewcontroller.specificservicereviewdata.value.data!.serviceReviews!.allReviwers![i].reviewId,
                                             },"review_details"
                                         );

                                         Get.toNamed(AppRoutes.review_reply)!.then((value) =>   specificservicereviewcontroller.specificservicereviewscreen({
                                           "user_id":Getstore.box.read("userid").toString(),
                                           "service_id":specificservicereviewcontroller.specificservicereviewdata.value.data!.serviceId,
                                           "filter":"",
                                         }, "review_page"));
                                         // Get.toNamed(AppRoutes.serviceproviderform);
                                       },
                                     ),
                                   ),
                                   const SizedBox(height:10),

                                   if(specificservicereviewcontroller.specificservicereviewdata.value.data!.serviceReviews!.allReviwers![i].provider_reply !="")...[
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
                                             "Your Reply :",
                                             style: TextStyle(
                                               color: ThemeText.headingcolor,
                                               fontSize: 12.0,
                                               fontWeight:
                                               FontWeight.w600,
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
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
                                          SizedBox(
                                            width:Get.width*0.85,
                                            child:  Text(
                                              specificservicereviewcontroller.specificservicereviewdata.value.data!.serviceReviews!.allReviwers![i].provider_reply.toString(),
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
                                   ]












                                 ],
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
                           return  Center(
                             child: LoadingAnimationWidget.twistingDots(
                               leftDotColor: ThemeText.appcolor,
                               rightDotColor: ThemeText.basiccolor,
                               size: 70,
                             ),
                           );
                         }
          }),


                    ],
                  ),
                ),
              ],
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
