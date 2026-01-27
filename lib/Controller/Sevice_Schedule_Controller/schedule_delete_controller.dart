import '../../Apiservice/api_service.dart';
import '/view/commonpage/export.dart';
class Scheduledeletecontroller extends GetxController {


  var scheduleDeleteresponseStatus=false.obs;
  var scheduleDeletedata;
  Future scheduleDeletescreen(Map<String, dynamic> postdata,String endPoint) async {
    scheduleDeleteresponseStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = homeResponse.data;
        scheduleDeletedata = result;
        if(scheduleDeletedata["status"]==true) {
          Get.back();
          Get.snackbar(
            "Schedule Status",
            "${scheduleDeletedata["msg"]}",
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
        }
        else {
          Get.snackbar(
            "Schedule Status",
            "${scheduleDeletedata["msg"]}",
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
      scheduleDeleteresponseStatus.value = false;
      update();
    }
  }



}