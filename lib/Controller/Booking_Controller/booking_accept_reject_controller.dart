import '../../../Apiservice/api_service.dart';
import '../../Model/Notification_Model/notification_list_model.dart';

import '/view/commonpage/export.dart';
class Bookingacceptrejectcontroller extends GetxController {
  var bookingacceptrejectresponseStatus=false.obs;
  var bookingacceptrejectdata;
  final durationformkey = GlobalKey<FormState>();
  TextEditingController serviceDuration = TextEditingController();

  Future bookingacceptscreen(Map<String, dynamic> postdata,String endPoint) async {
    bookingacceptrejectresponseStatus.value =true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = homeResponse.data;
        bookingacceptrejectdata = result;

        if(bookingacceptrejectdata["status"]==true){

          Get.snackbar(
            "Booking Accept/Reject Status",
            bookingacceptrejectdata["msg"],
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

        }else{
          Get.snackbar(
            "Booking Accept/Reject Status",
            bookingacceptrejectdata["msg"],
            //icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            borderRadius: 5,
            margin: const EdgeInsets.all(15),
            colorText: Colors.white,
            duration: const Duration(seconds: 4),
            isDismissible: true,
            dismissDirection: DismissDirection.horizontal,
            forwardAnimationCurve: Curves.easeOutBack,
          );
        }
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
      bookingacceptrejectresponseStatus.value = false;
      update();
    }
  }
}