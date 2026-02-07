
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../Catagories_controller/subcatagories_controller.dart';
import '/view/commonpage/export.dart';
import '../logincontroller.dart';
import 'Service_details_controller.dart';
import 'Service_list_Controller.dart';
class Serviceinsertcontroller extends GetxController {


  @override
  void onInit() {
    Get.put(SubCatagorieslistcontroller()).Subcatagorieslistscreen({
      "category_id": "",
      "sub_category_id": "",
    }, "fetch_categories");
    super.onInit();

  }

  final formkey = GlobalKey<FormState>();
  var catagories;
  var subCatagories;
  var childCatogories;
  List<dynamic> data=[];
  var  imagedata;
  var image_path;
  var providers;
  var priceunit;
  bool serviceenabled = false;
  bool serviceavailable = false;
  bool servicefeatured = false;
  var service_id;
  List<File>? imageFileList = [];
  bool checkallday = false;
  var checkalldayinsert=0;
  bool mondaydata = false;
  bool tuesdaydata = false;
  bool wednesdaydata = false;
  bool thursdaydata = false;
  bool fridaydata = false;
  bool saturdaydata= false;
  bool sundaydata = false;
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

  var monday_select="single";
  var tuesday_select="single";
  var wednesday_select="single";
  var thursday_select="single";
  var friday_select="single";
  var saturday_select="single";
  var sunday_select="single";
  var week_select="single";

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



  TextEditingController service_namecontroller = TextEditingController();
  TextEditingController service_descriptioncontroller = TextEditingController();
  TextEditingController service_discountcontroller = TextEditingController();
  TextEditingController service_customcontroller = TextEditingController();
  TextEditingController servce_pricecontroller = TextEditingController();
  TextEditingController servce_durationcontroller = TextEditingController();


  var serviceinsertresponseStatus=false.obs;
  var serviceupdateresponseStatus=false.obs;
  var servicedata;
  Future servicerinsertscreen(var catagories,var subCatagories,var childCatogories) async {
    serviceinsertresponseStatus.value = true;
    update();
    var postUri = Uri.parse("https://demo.cloneifypro.com/ondemand_services/provider_api/item/service_insert");
    http.MultipartRequest request =  http.MultipartRequest("POST", postUri);
// http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
//     'profile', imageFile.path);
    print(imageFileList);
    for (var imageFile in imageFileList!) {
      var multipartFile = await http.MultipartFile.fromPath('service_image[]', imageFile.path);
      request.files.add(multipartFile);
    }
    if(service_id!=null){
      request.fields['service_id'] = service_id.toString();
    }
    request.fields['service_name'] = service_namecontroller.text;

    request.fields['service_categories'] =catagories;
    // request.fields['service_categories'] =catagories.join(',').toString();


    request.fields['service_price'] = servce_pricecontroller.text;
    request.fields['service_discount'] = (service_discountcontroller.text.isEmpty)?"0":service_discountcontroller.text;
    request.fields['user_id'] = Getstore.box.read("userid").toString();
    request.fields['service_price_unit'] =priceunit;
    request.fields['service_custom'] = service_customcontroller.text;
    request.fields['service_duration'] = (priceunit=="Hourly")?servce_durationcontroller.text:"";
    request.fields['service_provider'] = providers;
    request.fields['service_description'] = service_descriptioncontroller.text;
    request.fields['service_enable'] = (serviceenabled==true)?"1":"0";
    request.fields['service_featured'] = (servicefeatured==true)?"1":"0";
    request.fields['service_available'] = (serviceavailable==true)?"1":"0";
    if(subCatagories != null) {
      request.fields['service_sub_categories'] = subCatagories;
    }
    if(childCatogories != null) {
      request.fields['service_child_categories'] = childCatogories;
    }


    request.fields['service_allday'] ="1";

    http.StreamedResponse response = await request.send();

    update();
    response.stream.transform(utf8.decoder).listen((value) {
      print('value....');
      final body = json.decode(value);
      servicedata=body;
      print(body.toString());
      update();

      if(servicedata["status"]==true){
        serviceinsertresponseStatus.value = false;
        update();
        Get.back();
        Get.snackbar(
          "Service Status",
          "${servicedata["msg"]}",
          //icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          borderRadius: 5,
          margin: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          forwardAnimationCurve: Curves.easeOutBack,
        );

        // Get.offUntil(
        //     MaterialPageRoute(builder: (context) => Myservice()),
        //         (route) => route.settings.name == '/myservice');
        // Get.offNamed(AppRoutes.myservice);
      }
      else{
        serviceinsertresponseStatus.value = false;
        update();
        Get.snackbar(
          "Service Status",
          "${servicedata["msg"]}",
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
    });
  }



  Future serviceupdatescreen() async {
    serviceupdateresponseStatus.value = true;
    update();

    Get.put(Servicedetailscontroller()).servicedetailscreen({
      "service_id":(service_id!=null)?service_id:"" ,
    }, "service_details").whenComplete(() => {
      service_namecontroller.text= Get.put(Servicedetailscontroller()).servicedata.value.data!["firstname"].toString(),
      service_descriptioncontroller.text= Get.put(Servicedetailscontroller()).servicedata.value.data!["biography"].toString(),
      service_discountcontroller.text= (Get.put(Servicedetailscontroller()).servicedata.value.data!["service_discount"]=="0")?"":Get.put(Servicedetailscontroller()).servicedata.value.data!["service_discount"].toString(),
      service_customcontroller.text= Get.put(Servicedetailscontroller()).servicedata.value.data!["service_custom"].toString(),
      servce_pricecontroller.text= Get.put(Servicedetailscontroller()).servicedata.value.data!["price"].toString(),
      servce_durationcontroller.text= Get.put(Servicedetailscontroller()).servicedata.value.data!["service_duration"].toString(),
      catagories= Get.put(Servicedetailscontroller()).servicedata.value.data!["category"].toString(),
      print("check1:$catagories"),

      subCatagories=Get.put(Servicedetailscontroller()).servicedata.value.data!["sub_category"].toString(),
      print("check2:$subCatagories"),
      childCatogories=Get.put(Servicedetailscontroller()).servicedata.value.data!["child_category"].toString(),
      update(),
      providers= Get.put(Servicedetailscontroller()).servicedata.value.data!["service_provider"].toString(),
      priceunit= Get.put(Servicedetailscontroller()).servicedata.value.data!["service_price_unit"].toString(),
      serviceenabled=(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_enable"]=="1")?true:false,
      serviceavailable=(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_available"]=="1")?true:false,
      servicefeatured=(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_featured"]=="1")?true:false,
      imagedata =(Get.put(Servicedetailscontroller()).servicedata.value.data!["service_image"]=="")?[]: Get.put(Servicedetailscontroller()).servicedata.value.data!["service_image"]?.split("|||"),
    imageFileList = [],
      update(),
      print(imagedata),
      CreateserviceState.selectImages1(),
      image_path=Get.put(Servicedetailscontroller()).servicedata.value.serviceImgPath,
      update(),


    if (catagories == null &&
    subCatagories == null) {
        print('serviceinsertcontroller.subCatagories1: ${subCatagories}'),
    print('serviceinsertcontroller.Catagories1: ${catagories}'),
    Get.put(SubCatagorieslistcontroller()).Subcatagorieslistscreen({
      "category_id": "",
      "sub_category_id": "",
    }, "fetch_categories").whenComplete(() {
      serviceupdateresponseStatus.value = false;
    }),
  } else {
    print('serviceinsertcontroller.subCatagories: ${subCatagories}'),
    print('serviceinsertcontroller.Catagories: ${catagories}'),
    Get.put(SubCatagorieslistcontroller()).Subcatagorieslistscreen({
    "category_id": catagories,
    "sub_category_id": subCatagories,
    }, "fetch_categories").whenComplete(() {
      serviceupdateresponseStatus.value = false;
    })
    },

      update(),
      print("check3:$catagories"),
      print("check4:$subCatagories"),
    });

  }




offallday(){
  Get.put(Serviceinsertcontroller()).checkalldayinsert=1;
  Get.put(Serviceinsertcontroller()).checkallday = true;
  Get.put(Serviceinsertcontroller()).update();
 // print(Get.put(Serviceinsertcontroller()).checkallday);
  Get.put(Serviceinsertcontroller()).mondaydata=false;
  Get.put(Serviceinsertcontroller()).tuesdaydata=false;
  Get.put(Serviceinsertcontroller()).wednesdaydata=false;
  Get.put(Serviceinsertcontroller()).thursdaydata=false;
  Get.put(Serviceinsertcontroller()).fridaydata=false;
  Get.put(Serviceinsertcontroller()).saturdaydata=false;
  Get.put(Serviceinsertcontroller()).sundaydata=false;
  Get.put(Serviceinsertcontroller()).monday_end.clear();
  Get.put(Serviceinsertcontroller()).monday_start.clear();
  Get.put(Serviceinsertcontroller()). monday="";
  Get.put(Serviceinsertcontroller()). mon_check=0;
  Get.put(Serviceinsertcontroller()).update();
  Get.put(Serviceinsertcontroller()).tuesday_start.clear();
  Get.put(Serviceinsertcontroller()).tuesday_end.clear();
  Get.put(Serviceinsertcontroller()). tuesday="";
  Get.put(Serviceinsertcontroller()). tue_check=0;
  Get.put(Serviceinsertcontroller()).update();
  Get.put(Serviceinsertcontroller()).wednesday_start.clear();
  Get.put(Serviceinsertcontroller()).wednesday_end.clear();
  Get.put(Serviceinsertcontroller()). wednesday="";
  Get.put(Serviceinsertcontroller()). wed_check=0;
  Get.put(Serviceinsertcontroller()).update();
  Get.put(Serviceinsertcontroller()).thursday_start.clear();
  Get.put(Serviceinsertcontroller()).thursday_end.clear();
  Get.put(Serviceinsertcontroller()). thursday="";
  Get.put(Serviceinsertcontroller()). thurs_check=0;
  Get.put(Serviceinsertcontroller()).update();
  Get.put(Serviceinsertcontroller()).friday_start.clear();
  Get.put(Serviceinsertcontroller()).friday_end.clear();
  Get.put(Serviceinsertcontroller()). friday="";
  Get.put(Serviceinsertcontroller()). fri_check=0;
  Get.put(Serviceinsertcontroller()).update();
  Get.put(Serviceinsertcontroller()).saturday_start.clear();
  Get.put(Serviceinsertcontroller()).saturday_end.clear();
  Get.put(Serviceinsertcontroller()). saturday="";
  Get.put(Serviceinsertcontroller()). sat_check=0;
  Get.put(Serviceinsertcontroller()).update();
  Get.put(Serviceinsertcontroller()).sunday_start.clear();
  Get.put(Serviceinsertcontroller()).sunday_end.clear();
  Get.put(Serviceinsertcontroller()). sunday="";
  Get.put(Serviceinsertcontroller()). sun_check=0;
  Get.put(Serviceinsertcontroller()).update();
}





}