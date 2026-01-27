
import '../../../Apiservice/api_service.dart';
import '/view/commonpage/export.dart';
import '../logincontroller.dart';
class FeaturedController extends GetxController {
  var featureenableResponseStatus=false.obs;
  var featuredData;

  Future featureenable(Map<String, dynamic> loginRequest, String endPoint) async {
    featureenableResponseStatus.value = true;
    update();
    try {
      debugPrint(loginRequest.toString());
      var homeResponse = await ApiService().formData( queryParameters:loginRequest,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        var result = homeResponse.data;
        featuredData = result;
        if (featuredData["status"] == true) {
          servicelistcontroller.servicelistscreen({
            "user_id": Getstore.box.read("userid").toString(),
          }, "service_list_by_user");
          Get.back();
          Get.back();

          Get.snackbar(
            "Featured Status",
            "${featuredData["msg"]}",
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
          update();


        }
        else {
          Get.snackbar(
            "Featured Status",
            "${featuredData["msg"]}",
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
      var array = e.toString().split(': ');
      if (array.length > 1) {
        var secondArray = array[1].split(' [');
        if (secondArray.length > 1) {
          Get.snackbar('', secondArray[0],
              backgroundColor: Colors.white);
        } else {
          Get.snackbar('', 'something went wrong',
              backgroundColor: Colors.white);
        }
      } else {
        Get.snackbar('', 'something went wrong', backgroundColor: Colors.white);
      }
    } finally {
      featureenableResponseStatus.value = false;
      update();
    }
  }


}






