import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../Controller/Review_list_Controller/review_detail_controller.dart';
import '../../Controller/Review_list_Controller/review_list_controller.dart';
import '../../Controller/logincontroller.dart';
import '../commonpage/export.dart';
class Reviews extends StatefulWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  var intialindex = 0;
  Reviewlistcontroller reviewlistcontroller = Get.put(Reviewlistcontroller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx((){
          if(reviewlistcontroller.revieweresponseStatus.isFalse){
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
                    'Reviews',
                    style: ThemeText.title1,
                  ),
                ),
                // bottomNavigationBar: const Bottomnavigation(
                //   item: 2,
                // ),
                body: FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: DefaultTabController(
                    initialIndex: intialindex,
                    length: 2,
                    child: Column(
                      children: <Widget>[

                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Container(
                              // height: Get.height*0.20,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: ThemeText.basiccolor,
                                borderRadius: BorderRadius.vertical(
                                    bottom: const Radius.circular(5)),
                                boxShadow: [
                                  BoxShadow(
                                      color: ThemeText.basiccolor.withOpacity(1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 50)),
                                ],
                              ),
                              margin: const EdgeInsets.only(bottom: 50),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${reviewlistcontroller.reviewlistdata.value.data!.reviewAnalytics!.reviewPercentage.toString()}.0",
                                        style: ThemeText.maintitle2),
                                    const SizedBox(height: 10),
                                    RatingBar.builder(
                                      ignoreGestures: true,
                                      tapOnlyMode: false,
                                      itemSize: 40,
                                      initialRating: double.parse(reviewlistcontroller.reviewlistdata.value.data!.reviewAnalytics!.reviewPercentage.toString()),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemPadding:
                                      const EdgeInsets.symmetric(horizontal: 2.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "Total Reviews (${reviewlistcontroller.reviewlistdata.value.data!.reviewAnalytics!.totalReview.toString()})".tr,
                                      style: ThemeText.heading3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:20),
                        ButtonsTabBar(
                          backgroundColor: ThemeText.basiccolor,
                          radius: 5.0,
                          contentPadding:const EdgeInsets.symmetric(horizontal: 25),
                          unselectedBackgroundColor: Color(0xffF0F1F3),
                          unselectedLabelStyle: ThemeText.buttontab,
                          labelStyle:ThemeText.textdata1,
                          onTap: (initialIndex) {

                            if(initialIndex==0){
                              intialindex=0;
                              reviewlistcontroller.reviewlistscreen({
                                "filter":"1",
                                 "user_id":Getstore.box.read("userid"),
                                //"user_id":"1",
                              }, "review_list");
                            }else if(initialIndex==1){
                              intialindex=1;

                              reviewlistcontroller.reviewlistscreen({
                                "filter":"2",
                                 "user_id":Getstore.box.read("userid"),
                                //"user_id":"1",
                              }, "review_list");
                            }


                            // print(intialindex);
                            // if(initialIndex==0){
                            //   intialindex=0;
                            //   homecontroller.homescreen({
                            //     "user_id": Getstore.box.read("userid"),
                            //     "home_filter":"2",
                            //   }, "home_page");
                            // }else if(initialIndex==1){
                            //   intialindex=1;
                            //
                            //   homecontroller.homescreen({
                            //     "user_id": Getstore.box.read("userid"),
                            //     "home_filter":"4",
                            //   }, "home_page");
                            // }else if(initialIndex==2){
                            //   intialindex=2;
                            //
                            //   homecontroller.homescreen({
                            //     "user_id": Getstore.box.read("userid"),
                            //     "home_filter":"5",
                            //   }, "home_page");
                            // }else{
                            //   intialindex=3;
                            //
                            //   homecontroller.homescreen({
                            //     "user_id": Getstore.box.read("userid"),
                            //     "home_filter":"3",
                            //   }, "home_page");
                            // }

                          },


                          tabs: const [
                            Tab(
                              // icon: Icon(Icons.directions_car),
                              text: "Today",
                            ),
                            Tab(
                              //  icon: Icon(Icons.directions_transit),
                              text: "Last 30 Days",
                            ),



                          ],
                        ),
                        SizedBox(height:20),
                        Expanded(
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              SingleChildScrollView(
                                child: Column(
                                  children:  [
                                    if(reviewlistcontroller.reviewlistdata.value.data!.reviewData!=null)
                                    for(var i=0;i<reviewlistcontroller.reviewlistdata.value.data!.reviewData!.length;i++)
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
                                                          // whenever the image changes, it will be loaded, and then faded in:
                                                          image:  NetworkImage(
                                                            reviewlistcontroller.reviewlistdata.value.data!.reviewData![i].customerImage.toString(),
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
                                                                reviewlistcontroller.reviewlistdata.value.data!.reviewData![i].customerName.toString(),
                                                                style: ThemeText.heading1,
                                                              ),
                                                            ),
                                                            Card(
                                                              color: Color(0xffEEE7F7),
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
                                                                    Text(reviewlistcontroller.reviewlistdata.value.data!.reviewData![i].rating.toString()+".0",style: ThemeText.textdata1,),
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
                                                              reviewlistcontroller.reviewlistdata.value.data!.reviewData![i].description.toString(),
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
                                                    "Review Reply",
                                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                                  ),
                                                  onPressed: () {
                                                    Get.put(Reviewdetailscontroller()).reviewdetailscreen(
                                                        {
                                                          "review_id":reviewlistcontroller.reviewlistdata.value.data!.reviewData![i].reviewId,
                                                        },"review_details"
                                                    );

                                                    Get.toNamed(AppRoutes.review_reply)!.then((value) =>   reviewlistcontroller.reviewlistscreen({
                                                      "filter":"1",
                                                      "user_id":Getstore.box.read("userid"),
                                                      //"user_id":"1",
                                                    }, "review_list"));
                                                    // Get.toNamed(AppRoutes.serviceproviderform);
                                                  },
                                                ),
                                              ),





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
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children:  [
                                    if(reviewlistcontroller.reviewlistdata.value.data!.reviewData!=null)
                                      for(var i=0;i<reviewlistcontroller.reviewlistdata.value.data!.reviewData!.length;i++)
                                        Padding(padding: const EdgeInsets.only(left:10,right:10,top:10),
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
                                                            // whenever the image changes, it will be loaded, and then faded in:
                                                            image:  NetworkImage(
                                                              reviewlistcontroller.reviewlistdata.value.data!.reviewData![i].customerImage.toString(),
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
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              SizedBox(
                                                                width:Get.width*0.40,
                                                                child:Text(
                                                                  reviewlistcontroller.reviewlistdata.value.data!.reviewData![i].customerName.toString(),
                                                                  style: ThemeText.heading1,
                                                                ),
                                                              ),
                                                              Card(
                                                                color: Color(0xffEEE7F7),
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
                                                                      Text(reviewlistcontroller.reviewlistdata.value.data!.reviewData![i].rating.toString()+".0",style: ThemeText.textdata1,),
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
                                                                reviewlistcontroller.reviewlistdata.value.data!.reviewData![i].description.toString(),
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
                                                      "Review Reply",
                                                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                                    ),
                                                    onPressed: () {
                                                      Get.put(Reviewdetailscontroller()).reviewdetailscreen(
                                                          {
                                                            "review_id":reviewlistcontroller.reviewlistdata.value.data!.reviewData![i].reviewId,
                                                          },"review_details"
                                                      );

                                                      Get.toNamed(AppRoutes.review_reply)!.then((value) =>   reviewlistcontroller.reviewlistscreen({
                                                        "filter":"2",
                                                        "user_id":Getstore.box.read("userid"),
                                                        //"user_id":"1",
                                                      }, "review_list"));
                                                      // Get.toNamed(AppRoutes.serviceproviderform);
                                                    },
                                                  ),
                                                ),



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
                              ),

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

        }));
  }
}
