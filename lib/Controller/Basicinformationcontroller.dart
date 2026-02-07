
import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

import '/view/commonpage/export.dart';
import 'Deviceid_store_Controller/deviceid_store_controller.dart';
import 'Provider_Controller/provider_insert_controller.dart';
import 'addresslistcontroller.dart';
import 'logincontroller.dart';

class BasicinformationController extends GetxController {
  @override
  void onInit() {
    getAndroidDeviceId();
    getFcmToken();
    super.onInit();
  }
  var status;
  var providerstatus;

   TextEditingController namecontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController phonecontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController biographycontroller = TextEditingController();
    TextEditingController addresscontroller = TextEditingController();
    TextEditingController lastnamecontroller = TextEditingController();
   var role;
   var basicinformationResponseStatus=false.obs;
   var basicinformationdata;
   Future BasicRegistration() async {
     basicinformationResponseStatus.value = true;
     update();
    var postUri = Uri.parse("https://demo.cloneifypro.com/ondemand_services/provider_api/item/register");
    http.MultipartRequest request =  http.MultipartRequest("POST", postUri);
// http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
//     'profile', imageFile.path);
     if(GeneralpageState.image !=null) {
       request.files.add(await http.MultipartFile.fromPath(
           'user_avatar', GeneralpageState.image!.path));
     }
    request.fields['firstname'] = namecontroller.text;
    request.fields['lastname'] = lastnamecontroller.text;
    request.fields['email'] = emailcontroller.text;
    request.fields['mobileno'] = phonecontroller.text;
    request.fields['password'] = passwordcontroller.text;
    // request.fields['user_roles'] = "3";
    // request.fields['user_address'] = addresscontroller.text;
    request.fields['user_bio'] = biographycontroller.text;
    http.StreamedResponse response = await request.send();
    print("hai");
    print(response);

    // listen for response
     status=1;
     update();
    response.stream.transform(utf8.decoder).listen((value) {
      print('value....');

      Getstore.box.erase();
      update();
      final body = json.decode(value);
      basicinformationdata=body;
      print("data");
      print(basicinformationdata);

      update();
      if(basicinformationdata["status"]==true){

        Getstore.store();
        update();
        basicinformationResponseStatus.value = false;
        update();

          Get.snackbar(
            "Information Status",
            "${basicinformationdata["msg"]}",
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
          if(basicinformationdata["provider_insert_status"]!=0){
            Get.put(Devicestorecontroller()).deviceidscreen(  {
              //
              "user_id":basicinformationdata["user_id"].toString(),
              "device_id":(fcmToken!=null)?fcmToken:"",
            },

                "update_device_id");
            update();
            Get.offNamed(AppRoutes.home);
          }
          else{
            Get.delete<Providerinsertcontroller>(force: true);
            Get.put(Addresslistcontroller()).addresslistscreen({
              "user_id": Getstore.box.read("userid").toString(),
            }, "list_address");
            providerstatus="1";
            // update();
            Get.put(Devicestorecontroller()).deviceidscreen(  {
              //
              "user_id":basicinformationdata["user_id"].toString(),
              "device_id":(fcmToken!=null)?fcmToken:"",
            },

                "update_device_id");
            update();
            Get.offNamed(AppRoutes.serviceproviderform);
          }

      }
      else{
        basicinformationResponseStatus.value = false;
        update();
        Get.snackbar(
          "Information Status",
          "${basicinformationdata["msg"]}",
          //icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          borderRadius:5,
          margin: EdgeInsets.all(15),
          colorText: Colors.white,
          duration: Duration(seconds: 4),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }



    });
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

