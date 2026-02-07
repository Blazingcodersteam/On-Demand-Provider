
import '../../../Apiservice/api_service.dart';
import '../../Model/Review_list_Model/Review_list_model.dart';
import '/view/commonpage/export.dart';
import '../../Model/Service_Model/service_list_Model.dart';

class Reviewlistcontroller extends GetxController {
  var revieweresponseStatus=false.obs;
  var reviewlistdata = Reviewlistmodel().obs;
  Future reviewlistscreen(Map<String, dynamic> postdata,String endPoint) async {
    revieweresponseStatus.value=true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Reviewlistmodel.fromJson(homeResponse.data);
        reviewlistdata.value = result;
        revieweresponseStatus.value =true;
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
      revieweresponseStatus.value = false;
      update();
    }
  }
}