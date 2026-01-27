import '../../../Apiservice/api_service.dart';

import '../../Model/Provider_Model/Publish_Unpublish_Model.dart';
import '/view/commonpage/export.dart';
class Publishunpublishcontroller extends GetxController {
  var publishunpublishresponseStatus=false.obs;
  var publishunpublishdata = PublishUnpublishmodel().obs;
  Future publishunpublishscreen(Map<String, dynamic> postdata,String endPoint) async {
    try {
      publishunpublishresponseStatus.value =true;
      update();
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = PublishUnpublishmodel.fromJson(homeResponse.data);
        publishunpublishdata.value = result;
        update();
        if( publishunpublishdata.value.status==true){
          Get.snackbar(
            "Publish Status",
            "${publishunpublishdata.value.msg}",
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
        }else{
          Get.snackbar(
            "Publish Status",
            "${publishunpublishdata.value.msg}",
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
        }





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
      publishunpublishresponseStatus.value = false;
      update();
    }
  }
}