


import '../../../Apiservice/api_service.dart';
import '/view/commonpage/export.dart';

import '../../Model/Catagories_Model/Catagories_list_model.dart';
import '../logincontroller.dart';
import '../Provider_Controller/providerlist_Controller.dart';

class Catagorieslistcontroller extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Get.put(Providerlistcontroller()).providerlistscreen({
      "search": "",
      "user_id": Getstore.box.read("userid"),
    }, "providers_list");
    catagorieslistscreen("category_list");

  }

  var catagorieslistResponseStatus=false.obs;
  var catagorieslistData = CatagorieslistModel().obs;

  Future catagorieslistscreen(String endPoint) async {
    catagorieslistResponseStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().get(endpoint:endPoint);
      if (homeResponse.statusCode == 200) {
        var result = CatagorieslistModel.fromJson(homeResponse.data);
        catagorieslistData.value = result;
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
      catagorieslistResponseStatus.value = false;
      update();
    }
  }

}