

import '../../Apiservice/api_service.dart';

import '../../Model/Mail_verfication_Model/mail_verfication_model.dart';
import '../../view/Commonpage/export.dart';

class Mailverficationcontroller extends GetxController {





  var mailverficationStatus=false.obs;
  var maildata = Verifymailmodel().obs;
  Future mailverficationscreen(Map<String, dynamic> postdata,String endPoint) async {
    mailverficationStatus.value = true;
    update();
    try {
      var homeResponse = await ApiService().formData(queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        var result = Verifymailmodel.fromJson(homeResponse.data);
        maildata.value = result;
          print(maildata.value);
        mailverficationStatus.value =true;
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
      mailverficationStatus.value = false;
      update();
    }
  }



}

popupdeleteservice() {

  return Get.defaultDialog(
    titlePadding: const EdgeInsets.symmetric(vertical: 15.0),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
    title: 'Email Verfication',
    titleStyle:  ThemeText.heading,
    confirm: Container(
      height: 40.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: FloatingActionButton(
        onPressed: () {

          // Get.put(ServicedeleteController()).servicedelete({
          //   "service_id":id.toString()
          // }, "service_delete");
          /*    .whenComplete(() =>      Get.put(Servicelistcontroller()).servicelistscreen({
            "search": "",
            "user_id": Getstore.box.read("userid"),
          }, "service_list_by_user")).whenComplete(() => Get.offNamed(AppRoutes.myservice));
          Get.back();
        */


        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        mini: true,
        elevation: 5.0,
        child: const Text("Resend")
      ),
    ),
    cancel: Container(
      height: 40.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        mini: true,
        elevation: 5.0,
        child: const Icon(
          Icons.clear,
          color: Colors.red,
        ),
      ),
    ),
    content: const Text(
      'Check your Email and verify your Email',
      style: TextStyle(
          color: Color(0xff0F0F0F),
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          height: 2),
      textAlign: TextAlign.center,
    ),
    radius: 10.0,
  );
}