
import 'package:firebase_auth/firebase_auth.dart';
import '/Controller/addresslistcontroller.dart';

import '../../../Apiservice/api_service.dart';
import '/view/commonpage/export.dart';
import '../../Model/Image_Model/Image_delete_Model.dart';


class ImagedeleteController extends GetxController {

  var imagedeleteStatus=false.obs;
  var imagedata = Imagedeletemodel().obs;

  Future imagedelete(Map<String, dynamic> loginRequest, String endPoint) async {
    imagedeleteStatus.value = true;
    update();
    try {
      debugPrint(loginRequest.toString());
      var homeResponse = await ApiService().formData( queryParameters:loginRequest,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        var result = Imagedeletemodel.fromJson(homeResponse.data);
        imagedata.value = result;
        // if (imagedata.value.status == true) {
        //   Get.snackbar(
        //     "Image delete Status",
        //     "${imagedata.value.msg}", // Message
        //     snackPosition: SnackPosition.BOTTOM,// Position
        //     backgroundColor: Colors.green, // Background color
        //     colorText: Colors.white, // Text color
        //     borderRadius: 10.0, // Border radius
        //     duration: const Duration(seconds: 3), // Duration
        //     animationDuration: const Duration(milliseconds: 500), // Animation duration
        //     margin: const EdgeInsets.all(10.0), // Margin
        //     padding: const EdgeInsets.all(20.0), // Padding
        //     dismissDirection: DismissDirection.horizontal, // Dismiss direction
        //     isDismissible: true, // Dismiss on tap
        //     showProgressIndicator: true, // Show progress indicator
        //     progressIndicatorBackgroundColor: Colors.black, // Progress indicator background color
        //     overlayBlur: 3.0, // Overlay blur
        //     overlayColor: Colors.black.withOpacity(0.5), // Overlay color
        //     onTap: (value) {
        //       print('Snackbar tapped');
        //     },
        //     shouldIconPulse: true, // Should icon pulse
        //     icon: Icon(Icons.info_outline), // Icon
        //     // mainButton: TextButton(
        //     //   onPressed: () {
        //     //     Get.back(); // Dismiss the snackbar
        //     //   },
        //     //   child: const Text(
        //     //     'Dismiss',
        //     //     style: TextStyle(color: Colors.yellow),
        //     //   ),
        //     // ), // Main button
        //   );
        //   update();
        // }
        // else {
        //   Get.snackbar(
        //     "Image delete Status",
        //     "${imagedata.value.msg}",
        //     //icon: Icon(Icons.person, color: Colors.white),
        //     snackPosition: SnackPosition.BOTTOM,
        //     backgroundColor: Colors.red,
        //     borderRadius: 20,
        //     margin: EdgeInsets.all(15),
        //     colorText: Colors.white,
        //     duration: Duration(seconds: 4),
        //     isDismissible: true,
        //     dismissDirection: DismissDirection.horizontal,
        //     forwardAnimationCurve: Curves.easeOutBack,
        //   );
        // }
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
      imagedeleteStatus.value = false;
      update();
    }
  }





}


