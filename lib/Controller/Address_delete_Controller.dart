import '../../Apiservice/api_service.dart';

import '../Model/Address_delete_Model.dart';
import '/view/commonpage/export.dart';
import 'addresslistcontroller.dart';
import 'logincontroller.dart';
class Addressdeletecontroller extends GetxController {


  var addressdeleteresponseStatus=false.obs;
  var addressdeletedata = Addressdeletemodel().obs;
  Future addressdeletescreen(Map<String, dynamic> postdata,String endPoint) async {
    addressdeleteresponseStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Addressdeletemodel.fromJson(homeResponse.data);
        addressdeletedata.value = result;
        print(addressdeletedata.value);
        addressdeleteresponseStatus.value =true;
        update();

        if(addressdeletedata.value.status==true) {
          Get.snackbar(
            "Address Delete Status",
            "${addressdeletedata.value.msg}",
            //icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            borderRadius: 5,
            margin: EdgeInsets.all(15),
            colorText: Colors.white,
            duration: Duration(seconds: 4),
            isDismissible: true,
            dismissDirection: DismissDirection.horizontal,
            forwardAnimationCurve: Curves.easeOutBack,
          );

          Get.put(Addresslistcontroller()).addresslistscreen({
            "user_id": Getstore.box.read("userid"),
          }, "list_address");
          Get.toNamed(AppRoutes.serviceproviderform);
        }



        else {
          Get.snackbar(
            "Address Delete Status",
            "${addressdeletedata.value.msg}",
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
      addressdeleteresponseStatus.value = false;
      update();
    }
  }



}