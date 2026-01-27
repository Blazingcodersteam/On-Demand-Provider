import '../../Apiservice/api_service.dart';
import '/view/commonpage/export.dart';
class Scheduleeditcontroller extends GetxController {
  bool timeselect=false;
  bool bookingstatus=false;
  var selectedValue;
  var scedule_id;
  var selectedDate;
  var selectedTime;
  var day;
  var slelectBookingstatus ="";
  String startTime="";
  String endTime="";
  var datas=[
    {
      "id":"1",
      "value": "Single Booking",
    },
    {
      "id":"2",
      "value": "Multiple Booking",
    }

  ];


  var scheduleEditresponseStatus=false.obs;
  var scheduleEditdata;
  Future scheduleEditscreen(Map<String, dynamic> postdata,String endPoint) async {
    scheduleEditresponseStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        // print(homeResponse.data);
        var result = homeResponse.data;
        scheduleEditdata = result;
        if(scheduleEditdata["status"]==true) {
          Get.back();
          Get.snackbar(
            "Schedule Status",
            "${scheduleEditdata["msg"]}",
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
        }
        else {
          Get.snackbar(
            "Schedule Status",
            "${scheduleEditdata["msg"]}",
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
      scheduleEditresponseStatus.value = false;
      update();
    }
  }

  getDayOfWeek(int day) {
    switch (day) {
      case 1:

        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';

    }
  }

}