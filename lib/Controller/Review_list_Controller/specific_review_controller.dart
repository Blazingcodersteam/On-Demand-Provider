
import '../../../Apiservice/api_service.dart';


import '../../Model/Review_list_Model/specificservice_model.dart';
import '/view/commonpage/export.dart';

class Specificservicereviewcontroller extends GetxController {
  var specificserviceresponseStatus=false.obs;
  var specificservicereviewdata = Specificservicereviewmodel().obs;
  Future specificservicereviewscreen(Map<String, dynamic> postdata,String endPoint) async {
    specificserviceresponseStatus.value=true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Specificservicereviewmodel.fromJson(homeResponse.data);
        specificservicereviewdata.value = result;
        specificserviceresponseStatus.value =true;
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
      specificserviceresponseStatus.value = false;
      update();
    }
  }
}