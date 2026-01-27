import '../../../Apiservice/api_service.dart';
import '../../Model/Provider_Model/providertype_Model.dart';
import '/view/commonpage/export.dart';
class Providertypecontroller extends GetxController {

  @override
  void onInit() {
    providertypescreen("providers_type");
    super.onInit();

  }
  var providertyperesponseStatus=false.obs;
  var providertypedata = ProvidersTypeModel().obs;
  Future providertypescreen(String endPoint) async {
    providertyperesponseStatus.value =true;
    update();
    try {

      var homeResponse = await ApiService().get(endpoint:endPoint);
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = ProvidersTypeModel.fromJson(homeResponse.data);
        providertypedata.value = result;

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
      providertyperesponseStatus.value = false;
      update();
    }
  }



}