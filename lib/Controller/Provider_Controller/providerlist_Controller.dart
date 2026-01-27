import '../../../Apiservice/api_service.dart';
import '../../Model/Provider_Model/Provider_list_Model.dart';
import '/view/commonpage/export.dart';
class Providerlistcontroller extends GetxController {
  var providerlisteresponseStatus=false.obs;
  var providerdata = ProviderlistModel().obs;
  Future providerlistscreen(Map<String, dynamic> postdata,String endPoint) async {
    providerlisteresponseStatus.value =true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = ProviderlistModel.fromJson(homeResponse.data);
        providerdata.value = result;
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
      providerlisteresponseStatus.value = false;
      update();
    }
  }
}