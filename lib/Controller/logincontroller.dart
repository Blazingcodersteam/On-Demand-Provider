
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '/Controller/addresslistcontroller.dart';

import '../../Apiservice/api_service.dart';
import '/view/commonpage/export.dart';
import '../Model/login_Model.dart';
import 'Account_Controller/Account_update_controller.dart';
import 'Basicinformationcontroller.dart';
import 'Deviceid_store_Controller/deviceid_store_controller.dart';
import 'Home_controller/home_controller.dart';
import 'Provider_Controller/provider_insert_controller.dart';
import 'Provider_Controller/provider_tax_controller.dart';
import 'Provider_Controller/provider_type_controller.dart';
class LoginController extends GetxController {

  @override
  void onInit() {
    getAndroidDeviceId();
    getFcmToken();
    super.onInit();
  }
  RxBool otp_status=false.obs;
  bool isObscure = true;
  String verificationIddata = '';
  FirebaseAuth _auth = FirebaseAuth.instance;
  var formkey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController smsCodeController = TextEditingController();
  var loginResponseStatus=false.obs;
  var loginData = LoginModel().obs;

  Future login(Map<String, dynamic> loginRequest, String endPoint) async {
    loginResponseStatus.value = true;
    update();
    try {
      debugPrint(loginRequest.toString());
      var homeResponse = await ApiService().formData( queryParameters:loginRequest,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        var result = LoginModel.fromJson(homeResponse.data);
        loginData.value = result;
        if (loginData.value.status == true) {


          Get.snackbar(
            "Login Status",
            "${loginData.value.msg}",
            //icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            borderRadius: 5,
            margin: EdgeInsets.all(15),
            colorText: Colors.white,
            duration: Duration(seconds: 4),
            isDismissible: true,
            dismissDirection: DismissDirection.horizontal,
            forwardAnimationCurve: Curves.easeOutBack,
          ).future.whenComplete(() => Getstore.store().whenComplete(() => (loginData.value.providerInsertStatus!=0)?Get.offNamed(AppRoutes.home):
          {

              Get.put(Providertypecontroller()).providertypescreen("providers_type"),
              Get.put(Providertaxcontroller()).providertypescreen("tax_list"),

              // Get.delete<Providerinsertcontroller>(force: true),
            Get.put(Addresslistcontroller()).addresslistscreen({
            "user_id": loginData.value.data![0].userId,
          }, "list_address").whenComplete(() => Get.offNamed(AppRoutes.serviceproviderform),),
            Get.put(BasicinformationController()).providerstatus="1",
            Get.put(BasicinformationController()).update(),
            phoneNumberController.clear(),
    passwordcontroller.clear(),
          }));
          Get.put(Devicestorecontroller()).deviceidscreen(  {
            //
            "user_id":loginData.value.data![0].userId,
            "device_id":(fcmToken!=null)?fcmToken:"",
          },
              "update_device_id");
          phoneNumberController.clear();
          passwordcontroller.clear();

          update();

        }
        else {
          Get.snackbar(
            "Login Status",
            "${loginData.value.msg}",
            //icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            borderRadius: 5,
            margin: const EdgeInsets.all(15),
            colorText: Colors.white,
            duration: const Duration(seconds: 4),
            isDismissible: true,
            dismissDirection: DismissDirection.horizontal,
            forwardAnimationCurve: Curves.easeOutBack,

          );
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      var array = e.toString().split(': ');
      if (array.length > 1) {
        var secondArray = array[1].split(' [');
        if (secondArray.length > 1) {
          Get.snackbar('', secondArray[0],
              backgroundColor: Colors.white);
        } else {
          Get.snackbar('', 'something went wrong',
              backgroundColor: Colors.white);
        }
      } else {
        Get.snackbar('', 'something went wrong', backgroundColor: Colors.white);
      }
    } finally {
      loginResponseStatus.value = false;
      update();
    }
  }

  Future loginotp(Map<String, dynamic> loginRequest, String endPoint) async {
    loginResponseStatus.value = true;
    update();
    try {
      debugPrint(loginRequest.toString());
      var homeResponse = await ApiService().formData( queryParameters:loginRequest,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        var result = LoginModel.fromJson(homeResponse.data);
        loginData.value = result;
        if (loginData.value.status == true) {


          Get.snackbar(
            "Login Status",
            "${loginData.value.msg}",
            //icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            borderRadius: 5,
            margin: EdgeInsets.all(15),
            colorText: Colors.white,
            duration: Duration(seconds: 4),
            isDismissible: true,
            dismissDirection: DismissDirection.horizontal,
            forwardAnimationCurve: Curves.easeOutBack,
          ).future.whenComplete(() => Getstore.store().whenComplete(() => (loginData.value.providerInsertStatus!=0)?{
            Get.put(Homecontroller()).homescreen({
          "user_id": loginData.value.data![0].userId,
          "home_filter":"2",
          }, "home_page"),
            Get.offNamed(AppRoutes.home),
          }:{

            Get.put(Providertypecontroller()).providertypescreen("providers_type"),
            Get.put(Providertaxcontroller()).providertypescreen("tax_list"),

            Get.put(Addresslistcontroller()).addresslistscreen({
            "user_id": loginData.value.data![0].userId,
          }, "list_address").whenComplete(() => Get.offNamed(AppRoutes.serviceproviderform)),
            Get.put(BasicinformationController()).providerstatus="1",
    Get.put(BasicinformationController()).update(),

            phoneNumberController.clear(),
            passwordcontroller.clear(),
          })).whenComplete(() =>  Get.put(Devicestorecontroller()).deviceidscreen(  {
            //
            "user_id":loginData.value.data![0].userId,
            "device_id":(fcmToken!=null)?fcmToken:"",
          },

              "update_device_id"));


          update();
          phoneNumberController.clear();
          passwordcontroller.clear();
        }
        else {
          if(loginData.value.msg != "New user"){
            Get.offNamed(AppRoutes.loginscreen);
            Get.snackbar(
              "Login Status",
              "${loginData.value.msg}",
              //icon: Icon(Icons.person, color: Colors.white),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              borderRadius: 5,
              margin: EdgeInsets.all(15),
              colorText: Colors.white,
              duration: Duration(seconds: 4),
              isDismissible: true,
              dismissDirection: DismissDirection.horizontal,
              forwardAnimationCurve: Curves.easeOutBack,
            );
          }else{
            Get.offNamed(AppRoutes.general_information);
          }

        }
      }
    } catch (e) {
      debugPrint(e.toString());
      var array = e.toString().split(': ');
      if (array.length > 1) {
        var secondArray = array[1].split(' [');
        if (secondArray.length > 1) {
          Get.snackbar('', secondArray[0],
              backgroundColor: Colors.white);
        } else {
          Get.snackbar('', 'something went wrong',
              backgroundColor: Colors.white);
        }
      } else {
        Get.snackbar('', 'something went wrong', backgroundColor: Colors.white);
      }
    } finally {
      loginResponseStatus.value = false;
      update();
    }
  }

  //otp
  Future<dynamic> verifyPhoneNumber() async {
    try {
      await _auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 10),

        phoneNumber: '+91${phoneNumberController.text}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          print('Verification Completed');

        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification Failed: ${e.message}');
          print('+91${phoneNumberController.text}');
          Get.snackbar(
            "Otp Status",
            '${e.message}',
            //icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            borderRadius: 5,
            margin: EdgeInsets.all(15),
            colorText: Colors.white,
            duration: Duration(seconds: 4),
            isDismissible: true,
            dismissDirection: DismissDirection.horizontal,
            forwardAnimationCurve: Curves.easeOutBack,
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          print('Code Sent');
          verificationIddata = verificationId;
          print(verificationId);
          Get.snackbar(
            "Otp Status",
            "Otp Send to the Mobile Number +91${phoneNumberController.text}",
            //icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            borderRadius: 5,
            margin: EdgeInsets.all(15),
            colorText: Colors.white,
            duration: Duration(seconds: 4),
            isDismissible: true,
            dismissDirection: DismissDirection.horizontal,
            forwardAnimationCurve: Curves.easeOutBack,
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('Code Auto Retrieval Timeout');
        },

      );
    } catch (e) {
      print('Error: $e');
    }
  }



  void signInWithPhoneNumber(String smsCode) async {
    try {
      print("hai");
      print(verificationIddata);
      print(smsCode);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIddata,
        smsCode: smsCode,
      );
      print(credential);
      await signInWithPhoneNumberCredential(credential);
    } catch (e) {
      // Handle sign-in errors
      print("Sign In Error: $e");
      Get.snackbar(
        "Otp Status",
        "Sign In Error: $e",
        //icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 5,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }


  Future<void> signInWithPhoneNumberCredential(
      PhoneAuthCredential credential) async {
    try {



      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      print("User signed in: ${user?.uid}");
      if(user?.uid!=null){

        loginotp(  {
          "user_name":phoneNumberController.text,
        },
            "user_check");

      }

    } catch (e) {
      // Handle sign-in errors
      print(e);

      Get.snackbar(
        "Otp Status",
        "Sign In Error: $e",
        //icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 5,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );

    }
  }


  String deviceId = '';
  Future<String> getAndroidDeviceId() async {

    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.androidId;
    } catch (e) {
      print('Error getting Android device ID: $e');
    }
    return deviceId;
  }
  String? fcmToken;
  Future<void> getFcmToken() async {
    fcmToken= await FirebaseMessaging.instance.getToken();

  }


}






class Getstore{
  // static var cityname;
  // static var cityid;

  static var box = GetStorage();
  // static var box1 = GetStorage();

  static Future store() async{
    print( Getstore.box.read("firstname"));
      box.write('userid', (Get
          .put(BasicinformationController())
          .status != 1) ? Get
          .put(LoginController())
          .loginData
          .value
          .data![0].userId : Get
          .put(BasicinformationController())
          .basicinformationdata["user_id"]);
      box.write('firstname', (Get
          .put(BasicinformationController())
          .status != 1) ? Get
          .put(LoginController())
          .loginData
          .value
          .data![0].firstname + " " + Get
          .put(LoginController())
          .loginData
          .value
          .data![0].lastname : Get
          .put(BasicinformationController())
          .basicinformationdata["data"]["firstname"] + " " + Get
          .put(BasicinformationController())
          .basicinformationdata["data"]["lastname"]);
      box.write('email', (Get
          .put(BasicinformationController())
          .status != 1) ? Get
          .put(LoginController())
          .loginData
          .value
          .data![0].email : Get
          .put(BasicinformationController())
          .basicinformationdata["data"]["email"]);
      box.write('phone', (Get
          .put(BasicinformationController())
          .status != 1) ? Get
          .put(LoginController())
          .loginData
          .value
          .data![0].mobileno : Get
          .put(BasicinformationController())
          .basicinformationdata["data"]["mobileno"]);
      box.write('role', (Get
          .put(BasicinformationController())
          .status != 1) ? Get
          .put(LoginController())
          .loginData
          .value
          .data![0].role : Get
          .put(BasicinformationController())
          .basicinformationdata["data"]["role"]);
      box.write('trainer_approve', (Get
          .put(BasicinformationController())
          .status != 1) ? Get
          .put(LoginController())
          .loginData
          .value
          .data![0].trainerApprove : Get
          .put(BasicinformationController())
          .basicinformationdata["data"]["trainer_approve"]);
      box.write('profile', (Get
          .put(BasicinformationController())
          .status != 1) ? Get
          .put(LoginController())
          .loginData
          .value
          .data![0].userAvatar : Get
          .put(BasicinformationController())
          .basicinformationdata["data"]["user_avatar"]);
      box.write('bio', (Get
          .put(BasicinformationController())
          .status != 1) ? Get
          .put(LoginController())
          .loginData
          .value
          .data![0].userBio : Get
          .put(BasicinformationController())
          .basicinformationdata["data"]["user_bio"]);
      box.write('updated', (Get
          .put(BasicinformationController())
          .status != 1) ? Get
          .put(LoginController())
          .loginData
          .value
          .data![0].updated : Get
          .put(BasicinformationController())
          .basicinformationdata["data"]["updated"]);

/*    else{

      Getstore.box.write("firstname", Get.put(AccountupdateController()).accountupdateData["data"]["firstname"]+ " "+Get.put(AccountupdateController()).accountupdateData["data"]["lastname"] );
      Getstore.box.write("email", Get.put(AccountupdateController()).accountupdateData["data"]["email"] );
      Getstore.box.write("phone", Get.put(AccountupdateController()).accountupdateData["data"]["mobileno"] );
      Getstore.box.write("profile", Get.put(AccountupdateController()).accountupdateData["data"]["user_avatar"] );
      Getstore.box.write("bio", Get.put(AccountupdateController())accountupdateData["data"]["user_bio"] );
    }*/
   // box.write('updated', (Get.put(BasicinformationController()).status!=1)?Get.put(LoginController()).loginData.value.providerInsertStatus:Get.put(BasicinformationController()).basicinformationdata["provider_insert_status"]);


  }
  // static Future locationdata() async{
  //   box1.write('cityname', cityname);
  //   box1.write('cityid', cityid);
  // }



}