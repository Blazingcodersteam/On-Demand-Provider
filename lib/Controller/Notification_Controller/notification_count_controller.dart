
import '../../Apiservice/api_service.dart';
import '../../Model/Home_Model/Home_Model.dart';
import '../../Model/Notification_Model/notification_count_model.dart';
import '../../view/Commonpage/export.dart';
import '../logincontroller.dart';

class Notificationcountcontroller extends GetxController {
  @override
  void onInit() {
    notificationcountscreen(  {
      "user_id":Getstore.box.read("userid").toString(),
      "status":"",
    },
        "notification_count");
    super.onInit();
  }
  var notificationcountStatus=false.obs;
  var notificationcountdata = Notificationcountmodel().obs;
  Future notificationcountscreen(Map<String, dynamic> postdata,String endPoint) async {
    notificationcountStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Notificationcountmodel.fromJson(homeResponse.data);
        notificationcountdata.value = result;

        notificationcountStatus.value =true;
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
      notificationcountStatus.value = false;
      update();
    }
  }



}