
import '../../../Apiservice/api_service.dart';

import '../../Model/Review_list_Model/review_dynamic_option_model.dart';
import '/view/commonpage/export.dart';

class Reviewdynamiccontroller extends GetxController {
  var reviewdynamicresponseStatus=false.obs;
  var reviewdynamicdata = Reviewdynamicoption().obs;
  Future reviewdynamicoptionscreen(String endPoint) async {
    reviewdynamicresponseStatus.value=true;
    update();
    try {
      var homeResponse = await ApiService().get( endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Reviewdynamicoption.fromJson(homeResponse.data);
        reviewdynamicdata.value = result;
        reviewdynamicresponseStatus.value =true;
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
      reviewdynamicresponseStatus.value = false;
      update();
    }
  }
}