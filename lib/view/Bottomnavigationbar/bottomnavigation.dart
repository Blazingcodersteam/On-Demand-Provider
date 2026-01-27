import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../Controller/Home_controller/home_controller.dart';
import '../../Controller/Notification_Controller/notification_count_controller.dart';
import '../../Controller/Provider_Controller/provider_list_filter.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/logincontroller.dart';
import '/Controller/Account_Controller/Account_update_controller.dart';
import '../commonpage/export.dart';



class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({Key? key, required this.item}) : super(key: key);
  final int item;
  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int selectedIndex=0;
  int currentPage=0;
  Homecontroller homecontroller = Get.put(Homecontroller());
  @override
  void initState() {
    super.initState();
    if(widget.item!=0) {
      setState(() {
        selectedIndex=widget.item;
        currentPage=widget.item;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: selectedIndex,
      onTap: (i) {
        setState(() => selectedIndex = i);
        if(selectedIndex==0){
          HomeState.advancedDrawerController.hideDrawer();
          Get.put(ProviderListfiltercontroller()).providerfilterscreen(
              {
                "status":"1",
              },
              "dynamic_option");
          Get.put(Notificationcountcontroller()).notificationcountscreen(  {
            "user_id":Getstore.box.read("userid").toString(),
            "status":"",
          },
              "notification_count");
          homecontroller.homescreen({
            "user_id": Getstore.box.read("userid").toString(),
            "home_filter":"",
          }, "home_page");
        }
        switch(selectedIndex){
          case 0:
            Get.toNamed(AppRoutes.home)!.then((data) {

              switch(currentPage){
                case 0:
                  setState(()=>selectedIndex=0);
                  break;
                case 1:
                  setState(()=>selectedIndex=1);
                  break;
                case 2:
                  setState(()=>selectedIndex=2);
                  break;
              }
            });
            break;
          case 1:
            Get.toNamed(AppRoutes.changepassword)!.then((data) {
              debugPrint(data);
              switch(currentPage){
                case 0:
                  setState(()=>selectedIndex=0);
                  break;
                case 1:
                  setState(()=>selectedIndex=1);
                  break;
                case 2:
                  setState(()=>selectedIndex=2);
                  break;
              }
            });
            break;
          case 2:
            Get.put(AccountupdateController()).accountscreen().then((data1) {
              Get.toNamed(AppRoutes.account)!.then((data) {
                debugPrint(data);
                switch(currentPage){
                  case 0:
                    setState((){
                      selectedIndex=0;
                    });
                    break;
                  case 1:
                    setState((){
                      selectedIndex=1;
                    });
                    break;
                  case 2:
                    setState((){
                      selectedIndex=2;
                    });
                    break;
                }
              });
            });

            break;
        }

      },
      items: [
        SalomonBottomBarItem(
          icon: const Icon(IconlyLight.home),
          title:  Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.menu!.home.toString()),
          selectedColor:  ThemeText.appcolor,
          unselectedColor: ThemeText.headingcolor,
        ),
        SalomonBottomBarItem(
          icon: const Icon(IconlyLight.password),
          title:  Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.menu!.changePassword.toString()),
          selectedColor:  ThemeText.appcolor,
          unselectedColor: ThemeText.headingcolor,
        ),
        SalomonBottomBarItem(
          icon: const Icon(IconlyLight.profile),
          title:  Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.menu!.account.toString()),
          selectedColor:  ThemeText.appcolor,
          unselectedColor: ThemeText.headingcolor,
        ),
      ],
    );
  }

}