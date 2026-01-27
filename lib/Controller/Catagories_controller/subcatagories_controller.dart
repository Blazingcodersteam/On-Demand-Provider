
import '../../../Apiservice/api_service.dart';
import '../../Model/Catagories_Model/sub_catagories_list_model.dart';
import '/view/commonpage/export.dart';

import '../../Model/Catagories_Model/Catagories_list_model.dart';
import '../logincontroller.dart';
import '../Provider_Controller/providerlist_Controller.dart';

class SubCatagorieslistcontroller extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // Get.put(Providerlistcontroller()).providerlistscreen({
    //   "search": "",
    //   "user_id": Getstore.box.read("userid"),
    // }, "providers_list");
    // catagorieslistscreen("category_list");
  }

  // var SubcatagorieslistResponseStatus=false.obs;
  // var catagorieslistData = SubCatogoriesListModel().obs;
  //
  // Future Subcatagorieslistscreen(String endPoint) async {
  //   SubcatagorieslistResponseStatus.value = true;
  //   update();
  //   try {
  //     var homeResponse = await ApiService().get(endpoint:endPoint);
  //     if (homeResponse.statusCode == 200) {
  //       var result = SubCatogoriesListModel.fromJson(homeResponse.data);
  //       catagorieslistData.value = result;
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     var array = e.toString().split(': ');
  //     if (array.length > 1) {
  //       var secondArray = array[1].split(' [');
  //       if (secondArray.length > 1) {
  //         Get.snackbar('', secondArray[0],
  //             backgroundColor: Colors.white);
  //       } else {
  //         Get.snackbar('', 'something went wrong',
  //             backgroundColor: Colors.white);
  //       }
  //     } else {
  //       Get.snackbar('', 'something went wrong', backgroundColor: Colors.white);
  //     }
  //   } finally {
  //     SubcatagorieslistResponseStatus.value = false;
  //     update();
  //   }
  // }


  var SubcatagorieslistResponseStatus=false.obs;
  var subCatagorieslistData = SubCatogoriesListModel().obs;
  Future Subcatagorieslistscreen(Map<String, dynamic> postdata,String endPoint) async {
    SubcatagorieslistResponseStatus.value = true;
    update();
    print("catagorieslist:$postdata");
    try {
      var homeResponse = await ApiService().formData( queryParameters:postdata,endpoint:endPoint, );
      if (homeResponse.statusCode == 200) {
        print("homeResponse: ${homeResponse.data}" );
        var result = SubCatogoriesListModel.fromJson(homeResponse.data);
        subCatagorieslistData.value = result;
        print("subCatagorieslistData: ${subCatagorieslistData.value.status}" );
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
      SubcatagorieslistResponseStatus.value = false;
      update();
    }
  }

}