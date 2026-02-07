
import '../../Apiservice/api_service.dart';

import '../../Model/Booking_Model/employee_details_model.dart';
import '../../Model/Booking_Model/view_my_booking_details_model.dart';
import '../../view/Commonpage/export.dart';


class Mybookingdetailscontroller extends GetxController {
  var employee_id;
  var mybookingdetailsresponseStatus=false.obs;
  var mybookingdetailsdata = Viewbookingdetailsmodel().obs;
  Future mybookingdetailsscreen(Map<String, dynamic> postdata,String endPoint) async {
    mybookingdetailsresponseStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint,);
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Viewbookingdetailsmodel.fromJson(homeResponse.data);
        mybookingdetailsdata.value = result;

        mybookingdetailsresponseStatus.value =true;
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
      mybookingdetailsresponseStatus.value = false;
      update();
    }
  }






  var employeedetailsresponseStatus=false.obs;
  var employeedetailsdata = EmployeeDetailsModel().obs;
  Future employeedetailsscreen(Map<String, dynamic> postdata,String endPoint) async {
    employeedetailsresponseStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint,);
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = EmployeeDetailsModel.fromJson(homeResponse.data);
        employeedetailsdata.value = result;

        employeedetailsresponseStatus.value =true;
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
      employeedetailsresponseStatus.value = false;
      update();
    }
  }


}