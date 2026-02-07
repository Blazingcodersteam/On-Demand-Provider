import '../../Apiservice/api_service.dart';
import '../Model/Addresslistmodel.dart';

import '/view/commonpage/export.dart';
class Addresslistcontroller extends GetxController {

  // @override
  // void onInit() {
  //   providerlistscreen("/providers_list");
  //   super.onInit();
  //   print("hai how are you");
  // }
  var addresslistresponseStatus=false.obs;
  var addresslistdata = AddressList().obs;
  Future addresslistscreen(Map<String, dynamic> postdata,String endPoint) async {
    addresslistresponseStatus.value = true;
    update();
    try {

      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = AddressList.fromJson(homeResponse.data);
        addresslistdata.value = result;
        print(addresslistdata.value);
        addresslistresponseStatus.value =true;
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
      addresslistresponseStatus.value = false;
      update();
    }
  }



}