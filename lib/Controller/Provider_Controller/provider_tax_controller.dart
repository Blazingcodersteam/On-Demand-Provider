import '../../../Apiservice/api_service.dart';


import '../../Model/Provider_Model/provider_tax_Model.dart';

import '/view/commonpage/export.dart';
class Providertaxcontroller extends GetxController {

  @override
  void onInit() {
    providertypescreen("tax_list");
    super.onInit();

  }
  var providertaxresponseStatus=false.obs;
  var providertaxdata = ProvidertaxModel().obs;
  Future providertypescreen(String endPoint) async {
    providertaxresponseStatus.value =true;
    update();
    try {
      var homeResponse = await ApiService().get(endpoint:endPoint);
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = ProvidertaxModel.fromJson(homeResponse.data);
        providertaxdata.value = result;

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
      providertaxresponseStatus.value = false;
      update();
    }
  }



}