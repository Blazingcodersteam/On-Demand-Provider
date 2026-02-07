
import '../../Apiservice/api_service.dart';

import '../../Model/Booking_Model/view_my_booking_details_model.dart';
import '../../view/Commonpage/export.dart';


class Fogotpasswordcontroller extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  var forgotpasswordStatus=false.obs;
  var forgotpassworddata;
  Future forgotpasswordscreen(Map<String, dynamic> postdata,String endPoint) async {
    forgotpasswordStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint,);
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result =homeResponse.data;
        forgotpassworddata = result;

        forgotpasswordStatus.value =true;
        update();
        if(forgotpassworddata["Status"]==true){
Get.back();
          Get.snackbar(
            "Forgot Password Status",
            "${forgotpassworddata["msg"]}",
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
        else{
          Get.snackbar(
            "Forgot Password Status",
            "${forgotpassworddata["msg"]}",
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
      forgotpasswordStatus.value = false;
      update();
    }
  }


}