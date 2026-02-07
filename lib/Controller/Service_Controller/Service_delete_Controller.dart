
import 'package:fluttertoast/fluttertoast.dart';

import '/Controller/Provider_Controller/provider_insert_controller.dart';

import '../../../Apiservice/api_service.dart';
import '/view/commonpage/export.dart';
import '../../Model/Provider_Model/providerdeletemodel.dart';
import '../../Model/login_Model.dart';

import '../logincontroller.dart';
class ServicedeleteController extends GetxController {
  var servicedeleteResponseStatus=false.obs;
  var servicedeleteData = ProviderdeleteModel().obs;

  Future servicedelete(Map<String, dynamic> loginRequest, String endPoint) async {
    servicedeleteResponseStatus.value = true;
    update();
    try {
      debugPrint(loginRequest.toString());
      var homeResponse = await ApiService().formData( queryParameters:loginRequest,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        var result = ProviderdeleteModel.fromJson(homeResponse.data);
        servicedeleteData.value = result;
        if (servicedeleteData.value.status == true) {
          servicelistcontroller.servicelistscreen({
            "user_id": Getstore.box.read("userid").toString(),
          }, "service_list_by_user");
          Get.back();
          Get.back();




          Get.snackbar(
            "Service Status",
            "${servicedeleteData.value.msg}",
            //icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            borderRadius: 5,
            margin: const EdgeInsets.all(15),
            colorText: Colors.white,
            duration: const Duration(seconds: 4),
            isDismissible: true,
            dismissDirection: DismissDirection.horizontal,
            forwardAnimationCurve: Curves.easeOutBack,
          );
          update();


        }
        else {
          Get.snackbar(
            "Service Status",
            "${servicedeleteData.value.msg}",
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
      servicedeleteResponseStatus.value = false;
      update();
    }
  }



















}






