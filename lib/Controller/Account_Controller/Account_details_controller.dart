


import '../../../Apiservice/api_service.dart';
import '/view/commonpage/export.dart';
import '../../Model/Account_Model/Account_detail_model.dart';

class AccountdetailsController extends GetxController {

  var accountdetailsResponseStatus=false.obs;
  var accountdetailData = Accountdetailmodel().obs;

  Future accountdetailscreen(Map<String, dynamic> loginRequest, String endPoint) async {
    accountdetailsResponseStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:loginRequest,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        var result = Accountdetailmodel.fromJson(homeResponse.data);
        accountdetailData.value = result;
      }
    } catch (e) {
      debugPrint(e.toString());
      var array = e.toString().split(': ');
      if (array.length > 1) {
        var secondArray = array[1].split(' [');
        if (secondArray.length > 1) {
          Get.snackbar('', secondArray[0],
              backgroundColor: Colors.white);
        } else {
          Get.snackbar('', 'something went wrong',
              backgroundColor: Colors.white);
        }
      } else {
        Get.snackbar('', 'something went wrong', backgroundColor: Colors.white);
      }
    } finally {
      accountdetailsResponseStatus.value = false;
      update();
    }
  }

}






