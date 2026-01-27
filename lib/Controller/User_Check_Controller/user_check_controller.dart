import '../../../Apiservice/api_service.dart';
import '../../Model/Service_Model/Service_Details_Model.dart';
import '../../Model/User_Check_Model/user_check_model.dart';
import '../Provider_Controller/provider_insert_controller.dart';
import '../logincontroller.dart';
import '/view/commonpage/export.dart';
class Usercheckcontroller extends GetxController {
  @override
  void onInit() {
      if(Getstore.box.read("userid") != null){
    print("Hai");
    userscreen({
    "user_id":Getstore.box.read("userid").toString(),
    },"First_Check");
    }
    super.onInit();
  }
  var usercheckresponseStatus=false.obs;
  var userdata = Usercheckmodel().obs;
  Future userscreen(Map<String, dynamic> postdata,String endPoint) async {
    usercheckresponseStatus.value =true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Usercheckmodel.fromJson(homeResponse.data);
        userdata.value = result;

      }
      if(userdata.value.status==false){

        // Get.delete<Providerinsertcontroller>(force: true);

        Getstore.box.remove("userid");
        Getstore.box.remove("firstname");
        Getstore.box.remove("email");
        Getstore.box.remove("phone");
        Getstore.box.remove("role");
        Getstore.box.remove("trainer_approve");
        Getstore.box.remove("profile");
        Getstore.box.remove("bio");
        Getstore.box.remove("updated");
        // HomeState.advancedDrawerController.hideDrawer();
        Get.put(LoginController()).otp_status = false.obs;

        Get.forceAppUpdate();

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
      usercheckresponseStatus.value = false;
      update();
    }
  }



}