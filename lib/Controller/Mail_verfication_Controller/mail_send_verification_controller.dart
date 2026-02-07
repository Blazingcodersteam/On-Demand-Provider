import '../../Apiservice/api_service.dart';
import '../../Model/Mail_verfication_Model/mail_verfication_model.dart';
import '../../view/Commonpage/export.dart';
class Mailsendcontroller extends GetxController {
  var mailsendStatus=false.obs;
  var maildata;
  Future mailsendscreen(Map<String, dynamic> postdata,String endPoint) async {
    mailsendStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData(queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        var result= homeResponse.data;
        maildata = result;
        mailsendStatus.value =true;
        update();

        if (maildata["status"] == true) {
          // Getstore.box.erase();

       Get.snackbar(
            "Mail Status",
            maildata["msg"],
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
            "Mail Status",
            maildata["msg"],
            //icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            borderRadius: 5,
            margin: const EdgeInsets.all(15),
            colorText: Colors.white,
            duration: const Duration(seconds: 4),
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
      mailsendStatus.value = false;
      update();
    }
  }



}

