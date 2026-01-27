import '../../Apiservice/api_service.dart';
import '../Model/Address_Add_Model.dart';
import '/view/commonpage/export.dart';
import 'addresslistcontroller.dart';
import 'logincontroller.dart';
class Addressaddcontroller extends GetxController {

  TextEditingController discController = TextEditingController();
var status;
  var latitude;
  var ad_area;
  var ad_city;
  var ad_district;
  var ad_state;
  var ad_pincode;
  var logitude;
  var address;
  var id;
  var addressaddresponseStatus=false.obs;
  var addressadddata = AddressaddModel().obs;
  Future addressaddscreen(Map<String, dynamic> postdata,String endPoint) async {
    addressaddresponseStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = AddressaddModel.fromJson(homeResponse.data);
        addressadddata.value = result;
        // print(addressadddata.value);
        // addressaddresponseStatus.value =false;
        // update();

if(addressadddata.value.status==true) {
  Get.snackbar(
    "Address Status",
    "${addressadddata.value.msg}",
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
    "user_id": Getstore.box.read("userid").toString(),
  }, "list_address");

  Get.back();
}
      else {
  Get.snackbar(
    "Address Status",
    "${addressadddata.value.msg}",
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
      addressaddresponseStatus.value = false;
      update();
    }
  }



}