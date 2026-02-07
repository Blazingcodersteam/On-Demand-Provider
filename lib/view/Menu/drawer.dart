
import 'package:cached_network_image/cached_network_image.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../Controller/Booking_Controller/booking_controller.dart';
import '../../Controller/Home_controller/home_controller.dart';
import '../../Controller/Mail_verfication_Controller/mail_verfication_controller.dart';
import '../../Controller/Notification_Controller/notification_count_controller.dart';
import '../../Controller/Notification_Controller/notification_list_controller.dart';
import '../../Controller/Provider_Controller/provider_insert_controller.dart';
import '../../Controller/Provider_Controller/provider_list_filter.dart';
import '../../Controller/Review_list_Controller/review_list_controller.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '/Controller/Account_Controller/Account_update_controller.dart';
import '/Controller/Service_Controller/Service_list_Controller.dart';
import '/Controller/logincontroller.dart';
import '/Controller/Provider_Controller/providerlist_Controller.dart';
import '../commonpage/export.dart';
import '../commonpage/test.dart';


class Mydrawer extends StatefulWidget {
  const Mydrawer({Key? key}) : super(key: key);


  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Getstore.store();
    Get.put(AccountupdateController()).accountscreen();
  }
  Providerlistcontroller providerlistcontroller = Get.put(Providerlistcontroller());
  Notificationlistcontroller notificationlistcontroller = Get.put(Notificationlistcontroller());
  Homecontroller homecontroller = Get.put(Homecontroller());
  Reviewlistcontroller reviewlistcontroller = Get.put(Reviewlistcontroller());
  Bookingcontroller bookingcontroller = Get.put(Bookingcontroller());
  Notificationcountcontroller notificationcountcontroller = Get.put(Notificationcountcontroller());
  @override
  Widget build(BuildContext context) {
    return  SafeArea(

      child: ListTileTheme(
        textColor:  ThemeText.secondarycolor,
        iconColor:  ThemeText.secondarycolor,
        selectedTileColor: ThemeText.appcolor,
        child: ListView(
          // mainAxisSize: MainAxisSize.max,
          children: [

           InkWell(
             onTap: (){
               HomeState.advancedDrawerController.hideDrawer();
               Get.put(AccountupdateController()).accountscreen();
               Get.toNamed(AppRoutes.account);
             },
             child:  Container(
               width: 120.0,
               height: 120.0,
               margin: const EdgeInsets.only(
                 top: 24.0,
                 bottom: 0.0,
               ),
               child: Stack(
                 clipBehavior: Clip.none,
                 fit: StackFit.expand,
                 children:   [
                    if(Getstore.box.read("profile")=="")
                     ClipOval(
                       child: CircleAvatar(
                         backgroundColor: ThemeText.appcolor,
                         radius: 40.0,

                         child:  Center(

                             child: Text(

                               Getstore.box.read("firstname")[0].toString().toUpperCase(),
                               style: const TextStyle(
                                   color: Colors.white, fontSize: 40),
                             )),
                       ),
                     )
                   else
                     ClipOval(
                       child: CircleAvatar(
                         radius: 40,
                         // backgroundImage:NetworkImage(Chatprofilelist.chatprofiledetails?["data"]["profile_path"][a]),
                         backgroundColor: ThemeText.appcolor,
                         child: ClipOval(
                           child: CachedNetworkImage(
                             fit: BoxFit.fill,
                             imageUrl: Getstore.box.read("profile").toString(),
                             placeholder: (context, url) => const Center(
                                 child: SpinKitRipple(
                                   color: Color(0xffde2127),
                                   size: 50.0,
                                 )),
                             errorWidget: (context, url, error) =>
                                 Center(
                                     child: Text(
                                       Getstore.box.read("firstname")[0].toString().toUpperCase(),
                                       style: const TextStyle(
                                           color: Colors.white, fontSize: 40),
                                     ))
                           ),
                         ),
                       ),




                     )

                 ],
               ),
             ),
           ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Getstore.box.read("firstname").toString(),style: ThemeText.headingtitle,)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Getstore.box.read("email"),style: ThemeText.bodydata,)
              ],
            ),
            const SizedBox(
              height: 20,

            ),
            ListTile(
              onTap: () {
                Get.put(ProviderListfiltercontroller()).providerfilterscreen(
                    {
                      "status":"1",
                    },
                    "dynamic_option");
                Get.put(Mailverficationcontroller()).mailverficationscreen(
                    {
                      "user_id":Getstore.box.read("userid").toString(),
                    },
                    "check_mail_verification");
                homecontroller.homescreen({
                  "user_id": Getstore.box.read("userid").toString(),
                  "home_filter":"",
                }, "home_page");
                // HomeState.advancedDrawerController!.currentState?.close();
                HomeState.advancedDrawerController.hideDrawer();
                Get.toNamed(AppRoutes.home);
              },
              leading: const Icon(IconlyLight.home),
              title:  Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.menu!.home.toString()),
            ),
            ListTile(
              onTap: () {
                Get.put(AccountupdateController()).accountscreen();
                Get.toNamed(AppRoutes.account);
                HomeState.advancedDrawerController.hideDrawer();
              },
              leading: const Icon(IconlyLight.profile),
              title: Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.menu!.account.toString()),
            ),
            ListTile(
              onTap: () {
                Get.put(ProviderListfiltercontroller()).providerfilterscreen(
                  {
                    "status":"2",
                  },
                    "dynamic_option");
                providerlistcontroller.providerlistscreen({
                  "search": "",
                  "pros_accepted": "",
                  "user_id": Getstore.box.read("userid"),
                }, "providers_list");

                Get.toNamed(AppRoutes.myprovider)!.then((value) {   Get.put(ProviderListfiltercontroller()).providerfilterscreen(
                    {
                      "status":"1",
                    },
                    "dynamic_option");
                homecontroller.homescreen({
                  "user_id": Getstore.box.read("userid").toString(),
                  "home_filter":"",
                }, "home_page");
                });
                HomeState.advancedDrawerController.hideDrawer();
              },
              leading:  const Icon(IconlyLight.bag_2),
              title: Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.menu!.myProviders.toString()),
            ),
            ListTile(
              onTap: () {
                Get.put(ProviderListfiltercontroller()).providerfilterscreen(
                    {
                      "status":"3",
                    },
                    "dynamic_option");
                Get.put(Servicelistcontroller()).servicelistscreen({
                  "search": "",
                  "user_id": Getstore.box.read("userid"),
                }, "service_list_by_user");

               Get.toNamed(AppRoutes.myservice)!.then((value) {   Get.put(ProviderListfiltercontroller()).providerfilterscreen(
                   {
                     "status":"1",
                   },
                   "dynamic_option");
               homecontroller.homescreen({
                 "user_id": Getstore.box.read("userid").toString(),
                 "home_filter":"",
               }, "home_page");
               });
                HomeState.advancedDrawerController.hideDrawer();
               // Get.to(TimePickerDropdown());
              },
              leading:  const Icon(IconlyLight.bookmark),
              title: Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.menu!.myServices.toString()),
            ),
            ListTile(
              onTap: () {
                notificationcountcontroller.notificationcountscreen(  {
                  "user_id":Getstore.box.read("userid").toString(),
                  "status":"2",
                },
                    "notification_count");
                notificationlistcontroller.notificationlistscreen({
                 // "user_id": Getstore.box.read("userid"),
                  "user_id": Getstore.box.read("userid"),
                }, "notification_list")!.then((value) =>notificationcountcontroller.notificationcountscreen(  {
                  "user_id":Getstore.box.read("userid").toString(),
                  "status":"",
                },
                    "notification_count"));
                HomeState.advancedDrawerController.hideDrawer();
                Get.toNamed(AppRoutes.notification);
              },
              leading: const Icon(IconlyLight.notification),
              title: Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.menu!.notifications.toString()),
            ),
            ListTile(
              onTap: () {
                Get.put(ProviderListfiltercontroller()).providerfilterscreen(
                    {
                      "status":"1",
                    },
                    "dynamic_option");
                bookingcontroller.bookingscreen({
                  // "user_id": Getstore.box.read("userid"),
                  "user_id": Getstore.box.read("userid"),
                  "filter": "",
                }, "booking_list");

                Get.toNamed(AppRoutes.bookingpage);
                HomeState.advancedDrawerController.hideDrawer();
              },

              leading:  const Icon(Icons.book_outlined),
              title: Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.menu!.bookings.toString()),
            ),

            ListTile(
              onTap: () {
                HomeState.advancedDrawerController.hideDrawer();
                Get.toNamed(AppRoutes.changepassword);
              },
              leading:  const Icon(IconlyLight.password),
              title: Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.menu!.changePassword.toString()),
            ),
            ListTile(
              onTap: () {
                HomeState.advancedDrawerController.hideDrawer();
                Get.toNamed(AppRoutes.support);
              },
              leading:  const Icon(Icons.back_hand_outlined),
              title:  Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.menu!.support.toString()),
            ),
            ListTile(
              onTap: () {

                QuickAlert.show(

                    context: context,
                    confirmBtnColor: const Color(0xff4CB050),
                    type: QuickAlertType.confirm,
                    text: 'You Want to Logout ?',
                    onConfirmBtnTap: ()  {
                       Get.delete<Providerinsertcontroller>(force: true);

                      WidgetsBinding.instance.addPostFrameCallback((_){
                        Getstore.box.remove("userid");
                        Getstore.box.remove("firstname");
                        Getstore.box.remove("email");
                        Getstore.box.remove("phone");
                        Getstore.box.remove("role");
                        Getstore.box.remove("trainer_approve");
                        Getstore.box.remove("profile");
                        Getstore.box.remove("bio");
                        Getstore.box.remove("updated");
                        HomeState.advancedDrawerController.hideDrawer();
                        Get.put(LoginController()).otp_status = false.obs;
                        // Get.put(LoginController()).update();
                        Get.offAllNamed(AppRoutes.loginscreen);

                      });

                    });
              },
              leading:  const Icon(IconlyLight.logout),
              title: Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.menu!.logout.toString()),
            ),
            // Spacer(),
            // DefaultTextStyle(
            //   textAlign: TextAlign.center,
            //   style: ThemeText.text,
            //   child: Container(
            //     margin: const EdgeInsets.symmetric(
            //       vertical: 16.0,
            //     ),
            //     child: const Text('Terms of Service | Privacy Policy'),
            //   ),
            // ),
          ],
        ),
      ),
    );

  }
}

