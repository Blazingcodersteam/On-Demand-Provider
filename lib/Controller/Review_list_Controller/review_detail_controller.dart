




import '../../../Apiservice/api_service.dart';

import '../../Model/Review_list_Model/review_details_model.dart';
import '/view/commonpage/export.dart';
import 'review_insert_controller.dart';


class Reviewdetailscontroller extends GetxController {
  var reviewdetailsStatus=false.obs;
  var reviewdetailsdata = Reviewdetailsmodel().obs;
  Future reviewdetailscreen(Map<String, dynamic> postdata,String endPoint) async {
    reviewdetailsStatus.value=true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Reviewdetailsmodel.fromJson(homeResponse.data);
        reviewdetailsdata.value = result;
        reviewdetailsStatus.value =true;
        update();
        if(reviewdetailsdata.value.status==true){
          Get.put(Reviewinsertcontroller()).review.text=(reviewdetailsdata.value.data!.providerReply !=null)?reviewdetailsdata.value.data!.providerReply.toString():"";
          Get.put(Reviewinsertcontroller()).update();
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
      reviewdetailsStatus.value = false;
      update();
    }
  }
}