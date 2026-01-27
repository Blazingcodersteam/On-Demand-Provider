

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../Booking/my_booking_details.dart';
import '../Services/servicetime.dart';
import '../Support/support.dart';
import '../commonpage/Addressmap.dart';
import '../commonpage/export.dart';
import '../commonpage/otp_screen.dart';

class AppRoutes {

  //static const String initialRoute = '/test';
  static const String introduction = '/introduction';
  static const String loginscreen = '/loginscreen';
  static const String home = '/home';
  static const String registration = '/registration';
  static const String account = '/Account';
  static const String splashscreen = '/splash_screen';
  static const String changepassword = '/change_password';
  static const String myservice = '/myservice';
  static  const String myprovider = '/myproviders';
  static const String forgotpassword = '/forgot_password';
  static const String notification = '/Notification';
  static const String createservice = '/createservice';
  static const String addoption = '/addoption';
  static const String reviews = '/review';
  static const String serviceproviderform = '/serviceproviderform';
  static const String addressmap = '/Addressmap';
  static const String otp_screen = '/otp_screen';
  static const String review_reply = '/review_reply';
  static const String general_information = '/general_information';
  static const String availability_range = '/availability_range';
  static const String bookingdetails = '/my_booking_details';
  static const String bookingpage = '/bookingpage.dart';
  static const String  specificservicereview= '/specific_service_review.dart';
  static const String  servicesschedule= '/servicetime.dart';
  static const String  serviceAddchedulePage= '/service_schedule_add.dart';
  static const String  serviceEditschedulePage= '/service_schedule_edit.dart';
  static const String  support= '/support.dart';




  static List<GetPage> pages = [

    GetPage(
      name: loginscreen,
      page: () =>   const Login(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: support,
      page: () =>  const Support(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 500),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: serviceEditschedulePage,
      page: () =>   const Editschedule(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name:serviceAddchedulePage,
      page: () =>   const AddSchedulepage(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: servicesschedule,
      page: () => const  Serviceschedule(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: specificservicereview,
      page: () =>  const Specificservicereview(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 500),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: bookingpage,
      page: () =>   const Bookingpage(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: bookingdetails,
      page: () =>   const MybookingDetails(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: availability_range,
      page: () =>   const Availabilityrange(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: general_information,
      page: () =>   const Generalpage(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: home,
      page: () =>   const Home(),
      transition: Transition.fadeIn,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: registration,
      page: () =>   const Registration(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: account,
      page: () =>   const Account(),
     transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: splashscreen,
      page: () =>   const Splashscreen(),
     transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: changepassword,
      page: () =>   const Changepassword (),
     transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: myservice,
      page: () =>   const Myservice(),
     transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: myprovider,
      page: () =>   const Myprovider(),
     transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: forgotpassword,
      page: () =>   const Forgotpassword(),
     transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: notification,
      page: () =>   const Notify(),
     transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: createservice,
      page: () =>   const Createservice(),
     transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),

    GetPage(
      name: addoption,
      page: () =>   const Addoption(),
     transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: reviews,
      page: () =>   const Reviews(),
     transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: serviceproviderform,
      page: () =>   const Serviceproviderform(),
     transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds:300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: addressmap,
      page: () =>   const Maplocation(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: otp_screen,
      page: () =>   Otpscreen(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: review_reply,
      page: () =>   const Reviewreply(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(milliseconds: 300),
      bindings: const [
        // LoginBinding(),
      ],
    ),

  ];
}