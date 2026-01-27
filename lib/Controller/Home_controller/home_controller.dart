import '../../../Apiservice/api_service.dart';
import '../../Model/Home_Model/home_model.dart';
import '/view/commonpage/export.dart';
class Homecontroller extends GetxController {



  var homeresponseStatus=false.obs;
  var homedata = Homemodel().obs;
  Future homescreen(Map<String, dynamic> postdata,String endPoint) async {
    homeresponseStatus.value=false;
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Homemodel.fromJson(homeResponse.data);
        homedata.value = result;
        homeresponseStatus.value =true;
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
      homeresponseStatus.value = true;
      update();
    }
  }
}