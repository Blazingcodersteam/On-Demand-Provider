import '../../Apiservice/api_service.dart';
import '../../Model/Availability_Range_Model/avalability_range_list_model.dart';
import '../../view/Commonpage/export.dart';
import '../logincontroller.dart';

class Availabilityrangelistcontroller extends GetxController {


  @override
  void onInit() {
    availabilityrangescreen({
      "user_id": Getstore.box.read("userid"),
    }, "service_range_list");
    super.onInit();

  }
  var availabilityrangelistStatus=false.obs;
  var availabilityrangelistdata = Servicerangelistmodel().obs;
  Future availabilityrangescreen(Map<String, dynamic> postdata,String endPoint) async {
    availabilityrangelistStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        var result = Servicerangelistmodel.fromJson(homeResponse.data);
        availabilityrangelistdata.value = result;
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
      availabilityrangelistStatus.value = false;
      update();
    }
  }



}