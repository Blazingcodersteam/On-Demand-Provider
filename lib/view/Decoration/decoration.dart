
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../commonpage/export.dart';

Settingscontroller settingscontroller = Get.put(Settingscontroller());




abstract class ThemeText {


  /*button*/
  static var buttoncommon=ButtonStyle(
    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
      if (states.contains(MaterialState.disabled)) {
        return appcolor;
      }
      return appcolor;

    },
    ),
  );
  /*button*/

  static   var basiccolor = Color(settingscontroller.basiccolor) ;
  static   var appcolor =  Color(settingscontroller.appcolor)  ;
  static   var secondarycolor = Color(settingscontroller.secondarycolor) ;
  static   var deleteicon =Color(settingscontroller.deleteicon);
  static   var contentcolor =Color(settingscontroller.contentcolor) ;
  static   var headingcolor =Color(settingscontroller.headingcolor) ;
  static   var secondarytextcolor =Color(settingscontroller.secontarytextcolor);
  static  TextStyle body = GoogleFonts.roboto(
    textStyle:  TextStyle(color: headingcolor,
        fontWeight:FontWeight.w300,fontSize:12,),
  );
  static  TextStyle headingtitle = GoogleFonts.roboto(
    textStyle:  TextStyle(color: headingcolor,
      fontWeight:FontWeight.bold,fontSize:22,),
  );
  static  TextStyle bodydata = GoogleFonts.roboto(
    textStyle:  TextStyle(color:headingcolor,
        fontWeight:FontWeight.w400,fontSize:12,),
  );
  static  TextStyle bodydata1 = GoogleFonts.roboto(
    textStyle:  TextStyle(color:ThemeText.secondarycolor,
        fontWeight:FontWeight.w500,fontSize:10,),
  );
  static  TextStyle bodydata2 = GoogleFonts.roboto(
    textStyle:  TextStyle(color: ThemeText.secondarycolor,
      fontWeight:FontWeight.w500,fontSize:12,),
  );
  static  TextStyle title = GoogleFonts.roboto(
    textStyle:  TextStyle(color: appcolor,
      fontWeight:FontWeight.bold,fontSize:16,),
  );
  static  TextStyle maintitle = GoogleFonts.roboto(
    textStyle:  TextStyle(color: ThemeText.secondarycolor,
      fontWeight:FontWeight.bold,fontSize:25,),
  );
  static  TextStyle maintitle2 = GoogleFonts.roboto(
    textStyle:  TextStyle(color: ThemeText.secondarycolor,
      fontWeight:FontWeight.w600,fontSize:35,),
  );
  static  TextStyle maintitle1 = GoogleFonts.roboto(
    textStyle:  TextStyle(color:appcolor,
      fontWeight:FontWeight.bold,fontSize:25,),
  );
  static  TextStyle title1 = GoogleFonts.roboto(
    textStyle:  TextStyle(color: ThemeText.secondarycolor,
      fontWeight:FontWeight.bold,fontSize:16,),
  );
  static  TextStyle buttontab = GoogleFonts.roboto(
    textStyle:  TextStyle(color: ThemeText.secondarycolor,
      fontWeight:FontWeight.w500,fontSize:14,),
  );
  static  TextStyle delete = GoogleFonts.roboto(
    textStyle:  TextStyle(color: deleteicon,
      fontWeight:FontWeight.w500,fontSize:14,),
  );


  static  TextStyle text = GoogleFonts.roboto(
    textStyle:  TextStyle(color: appcolor,
      fontWeight:FontWeight.w400,fontSize:12,),
  );
  static  TextStyle textdata = GoogleFonts.roboto(
    textStyle:  TextStyle(color: appcolor,
      fontWeight:FontWeight.w400,fontSize:16,),
  );
  static  TextStyle textdata1 = GoogleFonts.roboto(
    textStyle:  TextStyle(color: appcolor,
      fontWeight:FontWeight.w700,fontSize:14,),
  );
  static  TextStyle content = GoogleFonts.roboto(
    textStyle:  TextStyle(color: contentcolor,
      fontWeight:FontWeight.w800,fontSize:16,),
  );
  static  TextStyle content2 = GoogleFonts.roboto(
    textStyle:  TextStyle(color: contentcolor,
      fontWeight:FontWeight.w400,fontSize:16,letterSpacing: 1),
  );
  static  TextStyle content1 = GoogleFonts.roboto(
    textStyle:  TextStyle(color:contentcolor,
      fontWeight:FontWeight.w400,fontSize:12,letterSpacing: 1),
  );
  // static  TextStyle heading = GoogleFonts.roboto(
  //   textStyle: const TextStyle(color: Color(0xff242424),
  //       fontWeight:FontWeight.w700,fontSize:16,),
  // );
  static  TextStyle heading = GoogleFonts.roboto(
    textStyle:  TextStyle(color: headingcolor,
      fontWeight:FontWeight.w700,fontSize:18,),
  );
  static  TextStyle heading3 = GoogleFonts.roboto(
    textStyle:  TextStyle(color: headingcolor,
      fontWeight:FontWeight.w700,fontSize:16,),
  );
  static  TextStyle heading1 = GoogleFonts.roboto(
    textStyle:  TextStyle(color:headingcolor,
        fontWeight:FontWeight.w600,fontSize:15,),
  );
  static  TextStyle appbar = GoogleFonts.roboto(
    textStyle:  TextStyle(color:headingcolor,
        fontWeight:FontWeight.w700,fontSize:18,),
  );
  static  TextStyle seeall = GoogleFonts.roboto(
    textStyle:  TextStyle(color: appcolor,
        fontWeight:FontWeight.bold,fontSize:16,),

  );
  static  TextStyle datepic = GoogleFonts.roboto(
    textStyle:  TextStyle(color: appcolor,
        fontWeight:FontWeight.w400,fontSize:25,),

  );
  static  TextStyle subcontent = GoogleFonts.roboto(
    textStyle:  TextStyle(color: secondarytextcolor,
        fontWeight:FontWeight.bold,fontSize:12,),

  );
  static  TextStyle subcontent2 = GoogleFonts.roboto(
    textStyle:  TextStyle(color: secondarytextcolor,
        fontWeight:FontWeight.w500,fontSize:12,),

  );

  static  TextStyle amount = GoogleFonts.roboto(
    textStyle:  TextStyle(color:appcolor,
      fontWeight:FontWeight.w700,fontSize:18,),

  );
  static  TextStyle subcontent1 = GoogleFonts.roboto(
    textStyle: const TextStyle(color: Color(0xff56514B),
        fontWeight:FontWeight.w500,fontSize:14,),

  );
  // static  TextStyle subconten = GoogleFonts.roboto(
  //   textStyle: const TextStyle(color: Color(0xff757575),
  //     fontWeight:FontWeight.w400,fontSize:14,),
  //
  // );
  static  TextStyle subconten = GoogleFonts.roboto(
    textStyle:  TextStyle(color: secondarytextcolor,
      fontWeight:FontWeight.w400,fontSize:10,),

  );
  static  TextStyle quantity = GoogleFonts.roboto(
    textStyle:  TextStyle(color: secondarytextcolor,
      fontWeight:FontWeight.bold,fontSize:12,),

  );
  static  TextStyle retry = GoogleFonts.roboto(
    textStyle: const TextStyle(color: Color(0xffF7A000),
      fontWeight:FontWeight.bold,fontSize:14,),

  );

}

class Common{



  static common(String value,IconData icon ){
    return InputDecoration(
      prefixIcon:  Icon(icon, color:  Color(0xffADA4A5),size: 23,),
      fillColor: Colors.white,
      filled: true,
      errorStyle: const TextStyle(
        fontSize: 12.0,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          //color: Color(0xffDBE2EC),
          color: Colors.white,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          //color: Color(0xffDBE2EC),
          color: Colors.white,
          width: 1.0,
        ),
      ),
      focusedErrorBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          // color: Color(0xffDBE2EC),
          color: Colors.white,
          width: 1.0,
        ),
      ) ,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          // color: Color(0xffDBE2EC),
          color: Colors.white,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          // color: Color(0xffDBE2EC),
          color: Colors.white,
          width: 1.0,
        ),
      ),
      contentPadding: const EdgeInsets.only(
          left: 2, bottom: 11, top: 20, right: 15),
      hintText: value,
    );
  }




  static timetextfield(String value,){
    return  InputDecoration(

      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.all(10.0),
      enabledBorder: OutlineInputBorder(
        borderSide:  BorderSide(
            width: 1, color:ThemeText.basiccolor),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:  BorderSide(
            width: 1, color: ThemeText.appcolor),
        borderRadius: BorderRadius.circular(5),
      ),

      floatingLabelStyle: const TextStyle(
        color: Color(0xff293E6F),
        fontSize: 10,
      ),
      hintText: value,

    );
  }


}