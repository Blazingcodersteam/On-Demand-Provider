import '../../Apiservice/api_service.dart';
import '../Model/Addresslistmodel.dart';

import '/view/commonpage/export.dart';
import 'Avaliability_Range_Controller/availability_range_list_controller.dart';
import 'logincontroller.dart';
class Availabilityrangecontroller extends GetxController {


  var availabilityRangeStatus=false.obs;
  var availabilitydata;
  Future availabilityscreen(Map<String, dynamic> postdata,String endPoint) async {
    availabilityRangeStatus.value = true;
    update();
    try {

      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = homeResponse.data;
        availabilitydata = result;

        availabilityRangeStatus.value =true;
        update();
        print(availabilitydata);

        if(availabilitydata["Status"]==true){
          Get.put(Availabilityrangelistcontroller()).availabilityrangescreen({
            "user_id": Getstore.box.read("userid"),
          }, "service_range_list");

          Get.snackbar(
            "Service Availability Status",
            "${availabilitydata["msg"]}",
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
            "Service Availability Status",
            "${availabilitydata["msg"]}",
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
      availabilityRangeStatus.value = false;
      update();
    }
  }



}