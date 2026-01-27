import '../../../Apiservice/api_service.dart';
import '../../Model/Notification_Model/notification_list_model.dart';
import '../../Model/Provider_Model/Provider_list_Model.dart';
import '/view/commonpage/export.dart';
class Notificationlistcontroller extends GetxController {
  var notificationlistresponseStatus=false.obs;
  var notificationdata = Notificationlistmodel().obs;
  Future notificationlistscreen(Map<String, dynamic> postdata,String endPoint) async {
    notificationlistresponseStatus.value =true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Notificationlistmodel.fromJson(homeResponse.data);
        notificationdata.value = result;
        // providerlisteresponseStatus.value =true;
        // update();
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
      notificationlistresponseStatus.value = false;
      update();
    }
  }
}