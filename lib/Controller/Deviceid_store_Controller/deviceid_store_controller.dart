
import '../../Apiservice/api_service.dart';
import '../../Model/Deviceid_Model/deviceid_store_model.dart';
import '../../view/Commonpage/export.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Devicestorecontroller extends GetxController {
/*  @override
  void onInit() {
    homescreen(  {
      "location":"",
    },
        "home_page");
    super.onInit();
  }*/
  var devicestoreresponseStatus=false.obs;
  var deviceiddata = Deviceidstoremodel().obs;
  Future deviceidscreen(Map<String, dynamic> postdata,String endPoint) async {
    devicestoreresponseStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Deviceidstoremodel.fromJson(homeResponse.data);
        deviceiddata.value = result;

        devicestoreresponseStatus.value =true;
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
      var array = e.toString().split(':');
      if (array.length > 1) {
        var secondArray = array[1].split('[');
        if (secondArray.length > 1) {
          Get.snackbar('', secondArray[0],
              backgroundColor: Colors.white);
        } else {
          Get.snackbar('','something went wrong',
              backgroundColor: Colors.white);
        }
      } else {
        Get.snackbar('','something went wrong', backgroundColor: Colors.white);
      }
    } finally {
      devicestoreresponseStatus.value = false;
      update();
    }
  }



}