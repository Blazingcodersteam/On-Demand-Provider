


import '../../Apiservice/api_service.dart';

import '../../Model/Settings_Model/Settings_model.dart';
import '../../view/Commonpage/export.dart';
import '../User_Check_Controller/user_check_controller.dart';
import '../logincontroller.dart';

class Settingscontroller extends GetxController {

  @override
  void onInit() {
    if(Getstore.box.read("userid") != null){

      Get.put(Usercheckcontroller()).userscreen({
        "user_id":Getstore.box.read("userid").toString(),
      },"First_Check");
    }
    super.onInit();
  }
  var basiccolor;
  var appcolor ;
  var secondarycolor;
  var secontarytextcolor  ;
  var deleteicon ;
  var contentcolor;
  var headingcolor ;
  var settingsresponseStatus=false.obs;
  var settingsdata = Settingsmodel().obs;
  Future settingsscreen(String endPoint) async {
    settingsresponseStatus.value = true;

    update();

    try {
      var homeResponse = await ApiService().get(endpoint:endPoint);
      if (homeResponse.statusCode == 200) {
        var result = Settingsmodel.fromJson(homeResponse.data);
        settingsdata.value = result;
        if(settingsdata.value.status==true){
          basiccolor=int.parse(settingsdata.value.data!.color!.basiccolor!.replaceAll('#', '0xFF'));
          appcolor=int.parse(settingsdata.value.data!.color!.appcolor!.replaceAll('#', '0xFF'));
          secondarycolor=int.parse(settingsdata.value.data!.color!.secondarycolor!.replaceAll('#', '0xFF'));
          secontarytextcolor=int.parse(settingsdata.value.data!.color!.secontarytextcolor!.replaceAll('#', '0xFF'));
          deleteicon=int.parse(settingsdata.value.data!.color!.deleteicon!.replaceAll('#', '0xFF'));
          contentcolor=int.parse(settingsdata.value.data!.color!.contentcolor!.replaceAll('#', '0xFF'));
          headingcolor=int.parse(settingsdata.value.data!.color!.headingcolor!.replaceAll('#', '0xFF'));
          update();
        }


      }
    } catch (e) {
      // debugPrint(e.toString());
      var array = e.toString().split(':');
      if (array.length > 1) {
        var secondArray = array[1].split('[');
        if (secondArray.length > 1) {
          Get.snackbar('', secondArray[0], backgroundColor: Colors.white);
        } else {
          Get.snackbar('','something went wrong', backgroundColor: Colors.white);
        }
      } else {
        Get.snackbar('','something went wrong', backgroundColor: Colors.white);
      }
    } finally {
      settingsresponseStatus.value = false;
      update();
    }
  }



}