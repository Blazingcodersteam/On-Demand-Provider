import '../../../Apiservice/api_service.dart';


import '../../Model/Provider_Model/Provider_Details_Model.dart';
import '/view/commonpage/export.dart';
class Providerdetailscontroller extends GetxController {


  var providerdetailresponseStatus=false.obs;
  var providerdata = ProviderdetailsModel().obs;
  Future providerdetailscreen(Map<String, dynamic> postdata,String endPoint) async {
    providerdetailresponseStatus.value =true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = ProviderdetailsModel.fromJson(homeResponse.data);
        providerdata.value = result;

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
      providerdetailresponseStatus.value = false;
      update();
    }
  }



}