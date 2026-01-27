import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/User_Check_Controller/user_check_controller.dart';
import '../../Controller/logincontroller.dart';
import '../commonpage/export.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Settingscontroller settingscontroller = Get.put(Settingscontroller());
  Usercheckcontroller usercheckcontroller = Get.put(Usercheckcontroller());
  @override
  void initState() {
    Getstore.store();

    // print(settingscontroller.settingsresponseStatus);



    settingscontroller.settingsscreen("settings");

    print(settingscontroller.settingsresponseStatus);
  }
  @override
  Widget build(BuildContext context) {
    return  Obx(() {
      if(settingscontroller.settingsresponseStatus.isFalse && usercheckcontroller.usercheckresponseStatus.isFalse) {
        return SplashView(
          gradient:  LinearGradient(
            colors: [Colors.purple,ThemeText.appcolor],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          loadingIndicator:const SpinKitThreeBounce(
            color: Color(0xffE2D9FA),
            size: 50.0,
          ),
          logo:  ImageFade(
            width: MediaQuery.of(context).size.width*0.5,

            // whenever the image changes, it will be loaded, and then faded in:
            image:
             NetworkImage(Get.put(Settingscontroller()).settingsdata.value.data!.logoUrl.toString()+Get.put(Settingscontroller()).settingsdata.value.data!.siteLogo.toString(),),

            // slow-ish fade for loaded images:
            duration:
            const Duration(milliseconds: 900),

            // if the image is loaded synchronously (ex. from memory), fade in faster:
            syncDuration:
            const Duration(milliseconds: 150),

            // supports most properties of Image:
            alignment: Alignment.center,
            fit: BoxFit.cover,
            scale: 2,
            loadingBuilder: (context, progress, chunkEvent) =>
            const Center(
                child: SpinKitRipple(
                  color: Color(0xffE2D9FA),
                  size: 50.0,
                )),

            // displayed when an error occurs:
            errorBuilder: (context, error) =>
            const Center(
                child: SpinKitRipple(
                  color: Color(0xffE2D9FA),
                  size: 50.0,
                )),
          ),
          done:( Getstore.box.read("userid")==null)? Done( const Login()):Done( const Home()),

        );
      }else {
        return  Container(
          color: Colors.white,
          width: Get.width*1,
          height: Get.height*1,
        );
      }
    });
  }
}
