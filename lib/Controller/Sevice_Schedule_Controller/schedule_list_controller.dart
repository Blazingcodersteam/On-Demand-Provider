import '../../../Apiservice/api_service.dart';

import '../../Model/Service_Schedule_Model/schedule_list_model.dart';
import '/view/commonpage/export.dart';
class Schedulelistcontroller extends GetxController {
 String serviceId="";
  var sceduleListresponseStatus=false.obs;
  var schedulelistdata = Scedulelistmodel().obs;
  Future schedulelistscreen(Map<String, dynamic> postdata,String endPoint) async {
    sceduleListresponseStatus.value =true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Scedulelistmodel.fromJson(homeResponse.data);
        schedulelistdata.value = result;
        // print(serviceId);

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
      sceduleListresponseStatus.value = false;
      update();
    }
  }



}