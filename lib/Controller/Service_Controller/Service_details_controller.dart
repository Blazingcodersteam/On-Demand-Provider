import '../../../Apiservice/api_service.dart';
import '../../Model/Service_Model/Service_Details_Model.dart';
import '/view/commonpage/export.dart';
class Servicedetailscontroller extends GetxController {
  var ServicedetailresponseStatus=false.obs;
  var servicedata = Servicedetailsmodel().obs;
  Future servicedetailscreen(Map<String, dynamic> postdata,String endPoint) async {
    ServicedetailresponseStatus.value =true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Servicedetailsmodel.fromJson(homeResponse.data);
        servicedata.value = result;

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
      ServicedetailresponseStatus.value = false;
      update();
    }
  }



}