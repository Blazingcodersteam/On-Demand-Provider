import '../../../Apiservice/api_service.dart';
import '../../Model/Change_Password_Model/change_password_model.dart';
import '../../Model/Provider_Model/Provider_list_Model.dart';
import '/view/commonpage/export.dart';
class Changepaswordcontroller extends GetxController {
  TextEditingController previouspassword = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController confirmpasswordontroller = TextEditingController();
  var changepasswordresponseStatus=false.obs;
  var changepassworddata = Changepasswordmodel().obs;
  Future changepasswordscreen(Map<String, dynamic> postdata,String endPoint) async {
    changepasswordresponseStatus.value=false;
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint,);
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Changepasswordmodel.fromJson(homeResponse.data);
        changepassworddata.value = result;
        changepasswordresponseStatus.value =true;
        update();
        if(changepassworddata.value.status==true){
          Get.snackbar(
            "Change Password Status",
            "${changepassworddata.value.msg}",
            //icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            borderRadius: 5,
            margin: const EdgeInsets.all(15),
            colorText: Colors.white,
            duration: const Duration(seconds: 4),
            isDismissible: true,
            dismissDirection: DismissDirection.horizontal,
            forwardAnimationCurve: Curves.easeOutBack,
          );
          previouspassword.clear();
          newpasswordcontroller.clear();
          confirmpasswordontroller.clear();
        }else{
          Get.snackbar(
            "Change Password Status",
            "${changepassworddata.value.msg}",
            //icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            borderRadius: 5,
            margin: EdgeInsets.all(15),
            colorText: Colors.white,
            duration: Duration(seconds: 4),
            isDismissible: true,
            dismissDirection: DismissDirection.horizontal,
            forwardAnimationCurve: Curves.easeOutBack,
          );
        }
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
      changepasswordresponseStatus.value = false;
      update();
    }
  }
}