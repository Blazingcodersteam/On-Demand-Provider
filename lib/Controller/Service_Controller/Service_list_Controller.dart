
import '../../../Apiservice/api_service.dart';
import '/view/commonpage/export.dart';
import '../../Model/Service_Model/service_list_Model.dart';

class Servicelistcontroller extends GetxController {
  var servicelisteresponseStatus=false.obs;
  var servicedata = Servicelistmodel().obs;
  Future servicelistscreen(Map<String, dynamic> postdata,String endPoint) async {
    servicelisteresponseStatus.value=true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Servicelistmodel.fromJson(homeResponse.data);
        servicedata.value = result;
        servicelisteresponseStatus.value =true;
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
      servicelisteresponseStatus.value = false;
      update();
    }
  }
}