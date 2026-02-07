import '../../Controller/Booking_Controller/view_my_booking_details_controller.dart';
import '../../Controller/Notification_Controller/notification_delete_controller.dart';
import '../../Controller/Notification_Controller/notification_list_controller.dart';
import '../../Controller/Review_list_Controller/review_detail_controller.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/logincontroller.dart';
import '../commonpage/export.dart';

class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  Notificationlistcontroller notificationlistcontroller =
      Get.put(Notificationlistcontroller());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (notificationlistcontroller.notificationlistresponseStatus.isFalse &&
          Get.put(Notificationdeletecontroller())
              .notificationdeleteresponseStatus
              .isFalse) {
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
                  .notification!
                  .title
                  .toString(),
              style: ThemeText.title1,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Incoming Notifications",
                          style: ThemeText.heading,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Swipe item left to delete it",
                          style: ThemeText.bodydata,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: Get.height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        if (notificationlistcontroller
                                .notificationdata.value.data !=
                            null)
                          for (var i = 0;
                              i <
                                  notificationlistcontroller
                                      .notificationdata.value.data!.length;
                              i++)
                            InkWell(
                              onTap: () {
                                if (notificationlistcontroller.notificationdata
                                        .value.data![i].notificationType ==
                                    "booking") {
                                  Get.put(Mybookingdetailscontroller())
                                      .mybookingdetailsscreen({
                                    "booking_id": notificationlistcontroller
                                        .notificationdata
                                        .value
                                        .data![i]
                                        .bookingId,
                                  }, "view_booking_details");
                                  Get.toNamed(AppRoutes.bookingdetails);
                                } else if (notificationlistcontroller
                                        .notificationdata
                                        .value
                                        .data![i]
                                        .notificationType ==
                                    "review") {
                                  Get.put(Reviewdetailscontroller())
                                      .reviewdetailscreen({
                                    "review_id": notificationlistcontroller
                                        .notificationdata
                                        .value
                                        .data![i]
                                        .reviewId,
                                  }, "review_details");

                                  Get.toNamed(AppRoutes.review_reply)!.then(
                                      (value) => notificationlistcontroller
                                              .notificationlistscreen({
                                            "user_id":
                                                Getstore.box.read("userid"),
                                          }, "notification_list"));
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          5), // Set your desired border radius here
                                    ),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        //set border radius more than 50% of height and width to make circle
                                      ),
                                      shadowColor: ThemeText.basiccolor,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      elevation: 7,
                                      child: Dismissible(
                                        onDismissed: (direction) {
                                          Get.put(Notificationdeletecontroller())
                                              .notificationdeletescreen({
                                            "notification_id":
                                                notificationlistcontroller
                                                    .notificationdata
                                                    .value
                                                    .data![i]
                                                    .notificationId,
                                          }, "notification_delete").then(
                                                  (value) {
                                            notificationlistcontroller
                                                .notificationlistscreen({
                                              "user_id":
                                                  Getstore.box.read("userid"),
                                            }, "notification_list");
                                          });
                                        },
                                        background: Container(
                                          color: Colors.red,
                                          alignment: Alignment.centerRight,
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: const Icon(IconlyLight.delete,
                                              color: Colors.white),
                                        ),
                                        key: Key("$i"),
                                        child: Container(
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            gradient: (i % 2 == 0)
                                                ? const LinearGradient(colors: [
                                                    Color(0xffE4BFD3),
                                                    Color(0xffFFEEE1)
                                                  ])
                                                : const LinearGradient(colors: [
                                                    const Color(0xffDDE4BF),
                                                    Color(0xffD7E3F5)
                                                  ]),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 0.0,
                                                        horizontal: 5.0),
                                                    child: Text(
                                                      "${notificationlistcontroller.notificationdata.value.data![i].senderUserName.toString()} send a new message",
                                                      style: TextStyle(
                                                        color: ThemeText
                                                            .headingcolor,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 5.0),
                                                      child: SizedBox(
                                                        width: Get.width * 0.6,
                                                        child: Text(
                                                          notificationlistcontroller
                                                              .notificationdata
                                                              .value
                                                              .data![i]
                                                              .message
                                                              .toString(),
                                                          style: ThemeText
                                                              .bodydata,
                                                        ),
                                                      )),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: Container(
                                                  width: Get.width * 0.2,
                                                  height: Get.height * 0.10,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: ImageFade(
                                                      image: (notificationlistcontroller
                                                                  .notificationdata
                                                                  .value
                                                                  .data![i]
                                                                  .senderProfilePic !=
                                                              "")
                                                          ? NetworkImage(
                                                              notificationlistcontroller
                                                                  .notificationdata
                                                                  .value
                                                                  .data![i]
                                                                  .senderProfilePic
                                                                  .toString(),
                                                            )
                                                          : const NetworkImage(
                                                              "https://img.freepik.com/premium-photo/user-icon_867433-72.jpg"),
                                                      duration: const Duration(
                                                          milliseconds: 900),
                                                      syncDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  150),
                                                      alignment:
                                                          Alignment.center,
                                                      fit: BoxFit.contain,
                                                      scale: 2,
                                                      loadingBuilder: (context,
                                                              progress,
                                                              chunkEvent) =>
                                                           Center(
                                                              child:
                                                                  SpinKitRipple(
                                                                    color: ThemeText.appcolor,
                                                        size: 50.0,
                                                      )),
                                                      errorBuilder: (context,
                                                              error) =>
                                                           Center(
                                                              child:
                                                                  SpinKitRipple(
                                                                    color: ThemeText.appcolor,
                                                        size: 50.0,
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            )
                        else
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Image(
                                image: AssetImage("images/nodata.png"),
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
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
    });
  }
}
