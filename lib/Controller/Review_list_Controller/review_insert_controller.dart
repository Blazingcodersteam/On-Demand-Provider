
import '../../../Apiservice/api_service.dart';

import '../../Model/Review_list_Model/review_details_model.dart';
import '/view/commonpage/export.dart';


class Reviewinsertcontroller extends GetxController {
  TextEditingController review = TextEditingController();
  var reviewinsertStatus=false.obs;
  var reviewinsertsdata;
  Future reviewinsertscreen(Map<String, dynamic> postdata,String endPoint) async {
    reviewinsertStatus.value=true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = homeResponse.data;
        reviewinsertsdata = result;
        reviewinsertStatus.value =true;
        update();
        if(reviewinsertsdata["status"]==true){
          Get.back();
          Get.snackbar(
            "Review Reply Status",
            "${reviewinsertsdata["msg"]}",
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
            "Review Reply Status",
            "${reviewinsertsdata["msg"]}",
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
      reviewinsertStatus.value = false;
      update();
    }
  }
}