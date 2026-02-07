import 'package:animate_do/animate_do.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../Controller/Review_list_Controller/review_detail_controller.dart';
import '../../Controller/Review_list_Controller/review_insert_controller.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../commonpage/export.dart';

class Reviewreply extends StatefulWidget {
  const Reviewreply({Key? key}) : super(key: key);

  @override
  State<Reviewreply> createState() => _ReviewreplyState();
}

class _ReviewreplyState extends State<Reviewreply> {
  List<dynamic> sasi = [
    {
      "sasi": "kumar",
      "age": 10,
    }
  ];
  Map<String, dynamic> sasikumar = {
    "name": 10.38484,
  };

  final _formkey = GlobalKey<FormState>();
  Reviewdetailscontroller reviewdetailscontroller =
      Get.put(Reviewdetailscontroller());
  Reviewinsertcontroller reviewinsertcontroller =
      Get.put(Reviewinsertcontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      if (reviewdetailscontroller.reviewdetailsStatus.isFalse &&
          reviewinsertcontroller.reviewinsertStatus.isFalse) {
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
                  .reviewReply!
                  .title
                  .toString(),
              style: ThemeText.title1,
            ),
          ),
          // bottomNavigationBar: const Bottomnavigation(
          //   item: 2,
          // ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        // height: Get.height*0.20,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: ThemeText.basiccolor,
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(5)),
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
                              Text(
                                  "${reviewdetailscontroller.reviewdetailsdata.value.data!.rating}.0",
                                  style: ThemeText.maintitle2),
                              const SizedBox(height: 10),
                              RatingBar.builder(
                                ignoreGestures: true,
                                tapOnlyMode: false,
                                itemSize: 40,
                                initialRating: double.parse(
                                    reviewdetailscontroller
                                        .reviewdetailsdata.value.data!.rating
                                        .toString()),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                    duration: const Duration(seconds: 1),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formkey,
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
                                                      .reviewReply!
                                                      .title
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
                                            controller:
                                                reviewinsertcontroller.review,
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
                                                    .reviewReply!
                                                    .title
                                                    .toString(),
                                                Icons.insert_comment_outlined),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: double.infinity,
                              height: 50,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                                      return ThemeText.appcolor;
                                    },
                                  ),
                                ),
                                child:  Text(
                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.reviewReply!.saveButton.toString(),
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                onPressed: () {
                                  reviewinsertcontroller.reviewinsertscreen({
                                    "review_id": reviewdetailscontroller
                                        .reviewdetailsdata.value.data!.reviewId,
                                    "provider_reply":
                                        reviewinsertcontroller.review.text,
                                  }, "review_reply");

                                  Get.toNamed(AppRoutes.review_reply);
                                  // Get.toNamed(AppRoutes.serviceproviderform);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return Container(
          color: Colors.white,
          height: Get.height * 1,
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
