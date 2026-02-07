
import '../Basicinformationcontroller.dart';
import '/Controller/Account_Controller/Account_details_controller.dart';

import '/view/commonpage/export.dart';
import '../logincontroller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AccountupdateController extends GetxController {
  var data=0;
  var accountupdateResponseStatus=false.obs;
  var accountdetailsResponseStatus=false.obs;
  var accountupdateData;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController biography = TextEditingController();
  var image;

  Future accountupdate() async {
    accountupdateResponseStatus.value = true;
    update();

    var postUri = Uri.parse("https://demo.cloneifypro.com/ondemand_services/provider_api/item/profile_update");
    http.MultipartRequest request =  http.MultipartRequest("POST", postUri);
    // print(AccountState.imageFile!.path);
// http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
//     'profile', imageFile.path);
    if(AccountState.imageFile !=null) {
      request.files.add(await http.MultipartFile.fromPath('user_avatar',AccountState.imageFile!.path));
    }
    request.fields['firstname'] = firstname.text;
    request.fields['lastname'] = lastname.text;
    request.fields['email'] = email.text;
    request.fields['mobileno'] = phonenumber.text;
    request.fields['user_bio'] = biography.text;
    request.fields['user_id'] = Getstore.box.read("userid").toString();
    http.StreamedResponse response = await request.send();
    // print("hai");
    print(response);

    // listen for response

    update();
    response.stream.transform(utf8.decoder).listen((value) {


      update();
      final body = json.decode(value);
      accountupdateData=body;

      update();
      if(accountupdateData["status"]==true){
        Get
            .put(BasicinformationController())
            .status = 0;
        data=0;
        update();
        Getstore.box.erase();
        update();
        if(Get
            .put(BasicinformationController())
            .status == 0){
          Getstore.box.write("firstname" , Get.put(AccountupdateController()).accountupdateData["data"]["firstname"]+" " +Get.put(AccountupdateController()).accountupdateData["data"]["lastname"]);
          Getstore.box.write("profile" , Get.put(AccountupdateController()).accountupdateData["data"]["user_avatar"]);
          Getstore.box.write("userid" , Get.put(AccountupdateController()).accountupdateData["user_id"]);
          Getstore.box.write("phone" , Get.put(AccountupdateController()).accountupdateData["data"]["mobileno"]);
          Getstore.box.write("role" , Get.put(AccountupdateController()).accountupdateData["data"]["role"]);
          Getstore.box.write("bio" , Get.put(AccountupdateController()).accountupdateData["data"]["user_bio"]);
          Getstore.box.write("email" , Get.put(AccountupdateController()).accountupdateData["data"]["email"]);
          update();
          Get.forceAppUpdate();
          // Getstore.store();
        }

        // if((Get
        //     .put(BasicinformationController())
        //     .status != 1) ) {
        //
        // }
        // else{
        //   Get.put(BasicinformationController()).basicinformationdata["data"]["user_bio"]= Get.put(AccountupdateController()).accountupdateData["data"]["user_bio"];
        //   Get.put(BasicinformationController()).basicinformationdata["data"]["mobileno"]= Get.put(AccountupdateController()).accountupdateData["data"]["mobileno"];
        //   Get.put(BasicinformationController()).basicinformationdata["data"]["email"]= Get.put(AccountupdateController()).accountupdateData["data"]["email"];
        //   Get.put(BasicinformationController()).basicinformationdata["data"]["firstname"]= Get.put(AccountupdateController()).accountupdateData["data"]["firstname"];
        //   Get.put(BasicinformationController()).basicinformationdata["data"]["lastname"]= Get.put(AccountupdateController()).accountupdateData["data"]["lastname"];
        //   update();
        //   Getstore.store();
        // }






        print( Getstore.box.read("firstname"));
        // Getstore.store();
        print( Getstore.box.read("firstname"));




      //  accountscreen();


        Get.snackbar(
          "Account Status",
          "${accountupdateData["msg"]}",
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

        accountupdateResponseStatus.value = false;
        update();
      }
      else{
        accountupdateResponseStatus.value = false;
        update();
        Get.snackbar(
          "Account Status",
          "${accountupdateData["msg"]}",
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



    });
  }


  Future accountscreen() async {
    accountdetailsResponseStatus.value = true;
    update();
    Get.put(AccountdetailsController()).accountdetailscreen({
      "user_id":Getstore.box.read("userid").toString(),
    }, "profile").whenComplete(() => {
      firstname.text= Get.put(AccountdetailsController()).accountdetailData.value.data!.firstname.toString(),
      lastname.text= Get.put(AccountdetailsController()).accountdetailData.value.data!.lastname.toString(),
      email.text= Get.put(AccountdetailsController()).accountdetailData.value.data!.email.toString(),
      biography.text= Get.put(AccountdetailsController()).accountdetailData.value.data!.userBio.toString(),
      phonenumber.text= Get.put(AccountdetailsController()).accountdetailData.value.data!.mobileno.toString(),
      image= Get.put(AccountdetailsController()).accountdetailData.value.imagePath.toString()+Get.put(AccountdetailsController()).accountdetailData.value.data!.userAvatar.toString(),
      Get.put(AccountdetailsController()).update(),


    accountdetailsResponseStatus.value = false,
        update(),


    });






  }















}






