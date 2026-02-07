
import '../../Apiservice/api_service.dart';
import '../../Model/Booking_Model/bookings_model.dart';
import '../../view/Commonpage/export.dart';


class Bookingcontroller extends GetxController {

  var bookingresponseStatus=false.obs;
  var bookingdata = Bookingmodel().obs;
  Future bookingscreen(Map<String, dynamic> postdata,String endPoint) async {
    bookingresponseStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint,);
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = Bookingmodel.fromJson(homeResponse.data);
        bookingdata.value = result;

        bookingresponseStatus.value =true;
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
      bookingresponseStatus.value = false;
      update();
    }
  }


}