import '../../../Apiservice/api_service.dart';


import '../../Model/Provider_Model/provider_list_filter_model.dart';
import '/view/commonpage/export.dart';
class ProviderListfiltercontroller extends GetxController {

  var providerfilterresponseStatus=false.obs;
  var providerlistfilterdata = Providerlistfiltermodel().obs;
  Future providerfilterscreen(Map<String, dynamic> postdata,String endPoint) async {
    providerfilterresponseStatus.value =true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint,);
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Providerlistfiltermodel.fromJson(homeResponse.data);
        providerlistfilterdata.value = result;
        providerfilterresponseStatus.value =true;
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
      providerfilterresponseStatus.value = false;
      update();
    }
  }



}