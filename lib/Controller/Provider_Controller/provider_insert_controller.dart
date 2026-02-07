import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../Avaliability_Range_Controller/availability_range_list_controller.dart';
import '/Controller/Provider_Controller/providerlist_Controller.dart';

import '/view/commonpage/export.dart';
import 'Provider_Details_controller.dart';
import '../addresslistcontroller.dart';
import '../logincontroller.dart';
Providerlistcontroller providerlistcontroller = Get.put(Providerlistcontroller());
Providerdetailscontroller providerdetailscontroller  = Get.put(Providerdetailscontroller());
Availabilityrangelistcontroller availabilityrangelistcontroller = Get.put(Availabilityrangelistcontroller());
class Providerinsertcontroller extends GetxController {
  var status;
  var provider_id;
  var selectedrange=[];
  List<dynamic> data=[];
   bool checkallday = false;
   var checkalldayinsert=0;
   bool mondaydata = false;
   bool tuesdaydata = false;
   bool wednesdaydata = false;
   bool thursdaydata = false;
   bool fridaydata = false;
   bool saturdaydata= false;
   bool sundaydata = false;

  TextEditingController monday_start = TextEditingController();
  TextEditingController monday_end = TextEditingController();
  TextEditingController tuesday_start = TextEditingController();
  TextEditingController tuesday_end = TextEditingController();
  TextEditingController wednesday_start = TextEditingController();
  TextEditingController wednesday_end = TextEditingController();
  TextEditingController thursday_start = TextEditingController();
  TextEditingController thursday_end= TextEditingController();
  TextEditingController friday_start = TextEditingController();
  TextEditingController friday_end = TextEditingController();
  TextEditingController saturday_start = TextEditingController();
  TextEditingController saturday_end = TextEditingController();
  TextEditingController sunday_start = TextEditingController();
  TextEditingController sunday_end = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController disc = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController alterphonenumber = TextEditingController();
  TextEditingController availablerange = TextEditingController();
  TextEditingController notes = TextEditingController();
   var selectedValues = [];
  var taxs = [];
   var  imagedata;
  List<String> ?filePaths;
  List<File>? imageFileList = [];
  var image_path;
  var monday;
  var tuesday;
  var wednesday;
  var thursday;
  var friday;
  var saturday;
  var sunday;
  var mon_check;
  var tue_check;
  var wed_check;
  var thurs_check;
  var fri_check;
  var sat_check;
  var sun_check;
  var providerinsertresponseStatus=false.obs;
  var providerupdateesponseStatus=false.obs;
  var providerinsertdata;
   var providertype;
  File? file;
  Future providerinsertscreen() async {
    providerinsertresponseStatus.value = true;
    update();
    var postUri = Uri.parse("https://demo.cloneifypro.com/ondemand_services/provider_api/item/providers_insert");
    http.MultipartRequest request =  http.MultipartRequest("POST", postUri);
// http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
//     'profile', imageFile.path);
    print(imageFileList.toString());
    for (var imageFile in imageFileList!) {
      var multipartFile = await http.MultipartFile.fromPath('pros_image[]', imageFile.path);
      request.files.add(multipartFile);
    }
if(provider_id!=null){
  request.fields['provider_id'] = provider_id.toString();
}
print(checkalldayinsert.toString());
    request.fields['pros_name'] = name.text;
    request.fields['pros_type'] = providertype;
    request.fields['pros_employee'] = Getstore.box.read("userid").toString();
    request.fields['pros_phone'] = phonenumber.text;
    request.fields['user_id'] = Getstore.box.read("userid").toString();
    request.fields['pros_mobile'] = alterphonenumber.text;
    request.fields['pros_address[]'] =selectedValues.join(',').toString();
    request.fields['pros_avail_range'] =selectedrange.join(',').toString();
    request.fields['pros_taxes'] = taxs.join(',').toString();
    request.fields['pros_description'] = disc.text;
    // request.fields['pros_accepted'] = passwordcontroller.text;
    // request.fields['pros_available'] = passwordcontroller.text;
    // request.fields['pros_featured'] = passwordcontroller.text;
    if(checkalldayinsert==0) {
     /* print(monday);
      print( monday_start.text);
      print( monday_end.text);
      print( tuesday);
      print( tuesday_start.text);
      print( tuesday_end.text);*/
      request.fields['monday'] = (mon_check==null)?"0":mon_check.toString();
      request.fields['monday_opening'] = monday_start.text;
      request.fields['monday_closing'] = monday_end.text;
      request.fields['tuesday'] = (tue_check==null)?"0":tue_check.toString();
      request.fields['tuesday_opening'] = tuesday_start.text;
      request.fields['tuesday_closing'] = tuesday_end.text;
      request.fields['wednesday'] =(wed_check==null)?"0":wed_check.toString();
      request.fields['wednesday_opening'] = wednesday_start.text;
      request.fields['wednesday_closing'] = wednesday_end.text;
      request.fields['thursday'] = (thurs_check==null)?"0":thurs_check.toString();
      request.fields['thursday_opening'] = thursday_start.text;
      request.fields['thursday_closing'] = thursday_end.text;
      request.fields['friday'] =(fri_check==null)?"0":fri_check.toString();
      request.fields['friday_opening'] = friday_start.text;
      request.fields['friday_closing'] = friday_end.text;
      request.fields['saturday'] =(sat_check==null)?"0":sat_check.toString();
      request.fields['saturday_opening'] = saturday_start.text;
      request.fields['saturday_closing'] = saturday_end.text;
      request.fields['sunday'] = (sun_check==null)?"0":sun_check.toString();
      request.fields['sunday_opening'] = sunday_start.text;
      request.fields['sunday_closing'] = sunday_end.text;
      // request.fields['check1'] =(mon_check==null)?"0":mon_check.toString();
      // request.fields['check2'] = (tue_check==null)?"0":tue_check.toString();
      // request.fields['check3'] =(wed_check==null)?"0":wed_check.toString();
      // request.fields['check4'] = (thurs_check==null)?"0":thurs_check.toString();
      // request.fields['check5'] = (fri_check==null)?"0":fri_check.toString();
      // request.fields['check6'] =(sat_check==null)?"0":sat_check.toString();
      // request.fields['check7'] =(sun_check==null)?"0":sun_check.toString();

    }else{
      request.fields['monday'] = "";
      request.fields['tuesday'] = "";
      request.fields['wednesday'] = "";
      request.fields['wednesday'] = "";
      request.fields['thursday'] = "";
      request.fields['friday'] = "";
      request.fields['saturday'] = "";
      request.fields['sunday'] = "";
      request.fields['monday_opening'] = "";
      request.fields['monday_closing'] = "";
      request.fields['tuesday_opening'] = "";
      request.fields['tuesday_closing'] ="";
      request.fields['wednesday_opening'] = "";
      request.fields['wednesday_closing'] = "";
      request.fields['thursday_opening'] = "";
      request.fields['thursday_closing'] = "";
      request.fields['friday_opening'] = "";
      request.fields['friday_closing'] = "";
      request.fields['saturday_opening'] = "";
      request.fields['saturday_closing'] ="";
      request.fields['sunday_opening'] = "";
      request.fields['sunday_closing'] = "";
    }
    request.fields['checkallday'] =checkalldayinsert.toString();
    print(request.toString());
    http.StreamedResponse response = await request.send();

    // listen for response
    // status=1;
    update();
    response.stream.transform(utf8.decoder).listen((value) {
      print('value....');
      final body = json.decode(value);
      providerinsertdata=body;
      print("data");
      print(providerinsertdata);
      update();
      if(providerinsertdata["status"]==true){
        providerinsertresponseStatus.value = false;
        update();
        Get.snackbar(
          "Provider Status",
          "${providerinsertdata["msg"]}",
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
      else{
        providerinsertresponseStatus.value = false;
        update();
        Get.snackbar(
          "Provider Status",
          "${providerinsertdata["msg"]}",
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


  Future providerupdatescreen() async {
    providerupdateesponseStatus.value = true;
    update();
    availabilityrangelistcontroller.availabilityrangescreen({
      "user_id": Getstore.box.read("userid"),
    }, "service_range_list").whenComplete(() {
      Get.put(Addresslistcontroller()).addresslistscreen({
        "user_id": Getstore.box.read("userid"),
      }, "list_address").whenComplete(() => providerdetailscontroller.providerdetailscreen({
        "provider_id":(provider_id!=null)?provider_id:"",
      }, "providers_details"))
          .whenComplete(() => {
        name.text=providerdetailscontroller.providerdata.value.data!.prosName.toString(),
        disc.text=providerdetailscontroller.providerdata.value.data!.prosDescription.toString(),
        phonenumber.text=providerdetailscontroller.providerdata.value.data!.prosPhone.toString(),
        alterphonenumber.text=providerdetailscontroller.providerdata.value.data!.prosMobile.toString(),
        availablerange.text=providerdetailscontroller.providerdata.value.data!.prosAvailRange.toString(),
        // availablerange.text=providerdetailscontroller.providerdata.value.data!.prosAvailRange.toString(),
        checkalldayinsert=int.parse(providerdetailscontroller.providerdata.value.data!.checkallday),
        Get.put(Providerinsertcontroller()).update(),
        if(checkalldayinsert==0)
          {
            if(providerdetailscontroller.providerdata.value.data!.prosTime["monday"]=="1"){
              monday= "1",
              mon_check=1,
              Get.put(Providerinsertcontroller()).mondaydata = true,
              monday_start.text = providerdetailscontroller.providerdata.value.data!.prosTime["monday_opening"].toString(),
              monday_end.text = providerdetailscontroller.providerdata.value.data!.prosTime["monday_closing"].toString(),
              Get.put(Providerinsertcontroller()).update(),
            },
            if(providerdetailscontroller.providerdata.value.data!.prosTime["tuesday"]=="1"){
              tuesday= "1",
              tue_check=1,
              Get.put(Providerinsertcontroller()).tuesdaydata = true,
              tuesday_start.text=providerdetailscontroller.providerdata.value.data!.prosTime["tuesday_opening"].toString(),
              tuesday_end.text=providerdetailscontroller.providerdata.value.data!.prosTime["tuesday_closing"].toString(),

              Get.put(Providerinsertcontroller()).update(),
            },
            if(providerdetailscontroller.providerdata.value.data!.prosTime["wednesday"]=="1"){
              wednesday= "1",
              wed_check=1,
              Get.put(Providerinsertcontroller()).wednesdaydata = true,
              wednesday_start.text=providerdetailscontroller.providerdata.value.data!.prosTime["wednesday_opening"].toString(),
              wednesday_end.text=providerdetailscontroller.providerdata.value.data!.prosTime["wednesday_closing"].toString(),
              Get.put(Providerinsertcontroller()).update(),
            },
            if(providerdetailscontroller.providerdata.value.data!.prosTime["thursday"]=="1"){
              thursday= "1",
              thurs_check=1,

              Get.put(Providerinsertcontroller()).thursdaydata = true,
              thursday_start.text=providerdetailscontroller.providerdata.value.data!.prosTime["thursday_opening"].toString(),
              thursday_end.text=providerdetailscontroller.providerdata.value.data!.prosTime["thursday_closing"].toString(),
              Get.put(Providerinsertcontroller()).update(),

            } ,
            if(providerdetailscontroller.providerdata.value.data!.prosTime["friday"]=="1"){
              friday="1",
              fri_check=1,
              Get.put(Providerinsertcontroller()).fridaydata = true,
              friday_start.text=providerdetailscontroller.providerdata.value.data!.prosTime["friday_opening"].toString(),
              friday_end.text=providerdetailscontroller.providerdata.value.data!.prosTime["friday_closing"].toString(),
              Get.put(Providerinsertcontroller()).update(),
            },
            if(providerdetailscontroller.providerdata.value.data!.prosTime["saturday"]=="1"){
              saturday="1",
              sat_check=1,
              Get.put(Providerinsertcontroller()).saturdaydata = true,
              saturday_start.text=providerdetailscontroller.providerdata.value.data!.prosTime["saturday_opening"].toString(),
              saturday_end.text=providerdetailscontroller.providerdata.value.data!.prosTime["saturday_closing"].toString(),
              Get.put(Providerinsertcontroller()).update(),
            },
            if(providerdetailscontroller.providerdata.value.data!.prosTime["sunday"]=="1"){
              sunday="1",
              fri_check=1,
              Get.put(Providerinsertcontroller()).sundaydata = true,
              sunday_start.text=providerdetailscontroller.providerdata.value.data!.prosTime["sunday_opening"].toString(),
              sunday_end.text=providerdetailscontroller.providerdata.value.data!.prosTime["sunday_closing"].toString(),
              Get.put(Providerinsertcontroller()).update(),

            },

          }else{
          checkallday=true,
          Get.put(Providerinsertcontroller()).update(),
        },
        providertype=providerdetailscontroller.providerdata.value.data!.prosType.toString(),
        taxs=providerdetailscontroller.providerdata.value.data!.prosTaxes.split(","),
        print("taxs: $taxs" ),
        imagedata =(providerdetailscontroller.providerdata.value.data!.prosFiles=="")?"": providerdetailscontroller.providerdata.value.data!.prosFiles.split("|||"),
        ServiceproviderformState.selectImages1(),
        update(),
        selectedValues=providerdetailscontroller.providerdata.value.data!.prosAddress.split(","),
        selectedrange=providerdetailscontroller.providerdata.value.data!.prosAvailRange.split(","),
        image_path=providerdetailscontroller.providerdata.value.imagePath,
        Get.put(Providerinsertcontroller()).update(),
        providerupdateesponseStatus.value = false,
        update(),
      });
    });


  }




}