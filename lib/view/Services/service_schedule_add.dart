
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:intl/intl.dart';
import 'package:time_range/time_range.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/Sevice_Schedule_Controller/schedule_add_controller.dart';
import '../../Controller/Sevice_Schedule_Controller/schedule_list_controller.dart';
import '../../Controller/logincontroller.dart';
import '../commonpage/export.dart';
class AddSchedulepage extends StatefulWidget {
  const AddSchedulepage({Key? key}) : super(key: key);

  @override
  State<AddSchedulepage> createState() => _AddSchedulepageState();
}

class _AddSchedulepageState extends State<AddSchedulepage> {

  Scheduleaddcontroller scheduleaddcontroller = Get.put(Scheduleaddcontroller());

  @override
  void initState() {
    if(scheduleaddcontroller.selectedDate==null){
      scheduleaddcontroller.selectedDate=DateFormat('yyyy-MM-dd').format(DateTime.now());
      scheduleaddcontroller.selectedValue=scheduleaddcontroller.getDayOfWeek(DateTime.now().weekday);
      scheduleaddcontroller.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(scheduleaddcontroller.scheduleAddresponseStatus.isFalse){
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,

                backgroundColor: ThemeText.basiccolor,
                elevation: 0,
                // elevation:10,
                // backgroundColor: const Color(0xff00D6C7),
                automaticallyImplyLeading: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(0),
                  ),
                ),
                leading: Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 30,
                      ),
                    );
                  },
                ),

                title: Text(
                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.addScheduleTitle.toString(),
                  style: ThemeText.appbar,
                ),
              ),
              bottomSheet: Container(
                height: 100.0,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xffE1E1E1),
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50.0,
                          child: ElevatedButton(
                            style: ThemeText.buttoncommon,
                            onPressed: () {

                              if((scheduleaddcontroller.startTime !="" && scheduleaddcontroller.endTime !="") && (scheduleaddcontroller.slelectBookingstatus !="")){
                                setState(() {
                                  scheduleaddcontroller.timeselect = false;
                                  scheduleaddcontroller.bookingstatus=false;
                                  scheduleaddcontroller.update();
                                  scheduleaddcontroller.scheduleAddscreen({
                                    "service_id":Get.put(Schedulelistcontroller()).serviceId,
                                    "schedule_day":scheduleaddcontroller.selectedValue.toString(),
                                    "schedule_date": scheduleaddcontroller.selectedDate.toString(),
                                    "start_time":scheduleaddcontroller.startTime,
                                    "end_time":scheduleaddcontroller.endTime,
                                    "multiple_status":scheduleaddcontroller.slelectBookingstatus,
                                    "user_id":Getstore.box.read("userid").toString(),
                                  }, "schedule_add")!.then((value){
                                    Get.put(Schedulelistcontroller()).schedulelistscreen({
                                      "service_id":Get.put(Schedulelistcontroller()).serviceId,
                                      "date_filter":scheduleaddcontroller.selectedDate.toString(),
                                      // "service_id":"1",
                                      // "date_filter":"2024-04-24",
                                    }, "schedule_list");
                                  });
                                });
                              }else{
                                if(scheduleaddcontroller.startTime =="" && scheduleaddcontroller.endTime =="") {
                                  setState(() {
                                    scheduleaddcontroller.timeselect=true;
                                    scheduleaddcontroller.update();
                                  });
                                } else{
                                  scheduleaddcontroller.timeselect=false;
                                  scheduleaddcontroller.update();
                                }
                                if(scheduleaddcontroller.slelectBookingstatus ==""){
                                  setState(() {
                                    scheduleaddcontroller.bookingstatus=true;
                                    scheduleaddcontroller.update();
                                  });
                                }else{
                                  setState(() {
                                    scheduleaddcontroller.bookingstatus=false;
                                    scheduleaddcontroller.update();
                                  });
                                }
                              }
                              // Get.toNamed(AppRoutes.addressmap);

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.saveButton.toString().toUpperCase(),
                                  style: ThemeText.content,
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              bottomNavigationBar: const Bottomnavigation(item: 3,),
              body: Padding(
                  padding: const EdgeInsets.all(8),
                  child:SingleChildScrollView(
                    child: Column(

                      children:[
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.heading.toString(),style: ThemeText.heading,),
                          ],
                        ),

                        const SizedBox(height: 15,),

                        Card(
                          elevation: 0,
                          child:   DatePicker(
                            DateTime.now(),
                            initialSelectedDate:  DateTime.now(),
                            selectionColor:  ThemeText.basiccolor,
                            selectedTextColor: Colors.white,
                            monthTextStyle:ThemeText.bodydata1,
                            dateTextStyle:ThemeText.datepic,
                            dayTextStyle: ThemeText.bodydata1,
                            deactivatedColor:const Color(0xffFFC247),
                            inactiveDates: [ DateTime.parse("2024-04-15"),DateTime.parse("2023-12-18")],
                            onDateChange: (date) {
                              // New date selected
                              setState(() {
                                scheduleaddcontroller.selectedDate=DateFormat('yyyy-MM-dd').format(date) ;

                                scheduleaddcontroller.selectedValue= scheduleaddcontroller.getDayOfWeek(date.weekday);
                                scheduleaddcontroller.update();
                              });
                            },
                          ),
                        ),
                        // const SizedBox(height: 15,),
                        // Card(
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(5),
                        //     // side: const BorderSide(
                        //     //   color: Color(0xff383535),
                        //     // ),
                        //   ),
                        //   color: const Color(0xffF5F5F5),
                        //   elevation: 0,
                        //   child: SizedBox(
                        //       width: MediaQuery.of(context).size.width * 1,
                        //       child: Padding(
                        //         padding: const EdgeInsets.only(
                        //             left: 8, right: 8, top: 15,bottom: 15),
                        //         child: Row(
                        //           crossAxisAlignment:
                        //           CrossAxisAlignment.start,
                        //           children: [
                        //             Icon(IconlyLight.bookmark,size: 25,color: ThemeText.basiccolor,),
                        //             const SizedBox(width: 5),
                        //             Column(
                        //               crossAxisAlignment:
                        //               CrossAxisAlignment.start,
                        //               children: [
                        //                 SizedBox(
                        //                   width: MediaQuery.of(context).size.width*0.8,
                        //                   child:  Text(
                        //                     "A DatePickerContentControl provides a callect a date.the drop-down arrow in the control. ",
                        //                     style: ThemeText.subcontent1,
                        //
                        //                   ),
                        //                 ),
                        //                 const SizedBox(height: 5),
                        //
                        //               ],
                        //             )
                        //           ],
                        //         ),
                        //       )),
                        // ),


                        const SizedBox(height: 30,),
                        TimeRange(
                            fromTitle: SizedBox(
                              height: 30,
                              child: Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.timeToStart.toString(),style: ThemeText.heading,),
                            ),
                            toTitle: SizedBox(
                              height: 30,
                              child: Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.timeToEnd.toString(),style: ThemeText.heading,),
                            ),
                            titlePadding: 0,
                            textStyle:  ThemeText.subcontent,
                            activeTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            borderColor:  ThemeText.basiccolor,
                            backgroundColor: Colors.transparent,
                            activeBorderColor:  ThemeText.basiccolor,
                            activeBackgroundColor:  ThemeText.basiccolor,
                            firstTime: const TimeOfDay(hour:1, minute: 00),
                            lastTime: const TimeOfDay(hour: 24, minute: 00),



                            timeStep: 60,
                            timeBlock: 60,
                            onRangeCompleted: (range) {
                              setState(() {
                                scheduleaddcontroller.selectedTime=_formatTimeRange(range!);
                                scheduleaddcontroller.update();
                              });
                            }
                        ),
                        const SizedBox(height: 30,),

                        if(scheduleaddcontroller.timeselect==true)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Padding(
                                  padding:EdgeInsets.only(left:6),
                                  child:Text("Select the Schedule Time",style: TextStyle(color:Colors.red,fontSize: 12),)
                              )
                            ],
                          ),
                        const SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.bookingStatus.toString(),
                                style: TextStyle(
                                  color: ThemeText.headingcolor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for(var i=0;i<scheduleaddcontroller.datas.length;i++)
                              RadioListTile(

                                activeColor: ThemeText.appcolor,
                                title:Text(
                                  scheduleaddcontroller.datas[i]["value"].toString(),
                                  style: ThemeText.buttontab,
                                  textAlign: TextAlign.start,
                                ),
                                value: scheduleaddcontroller.datas[i]["id"].toString(),
                                groupValue:scheduleaddcontroller.slelectBookingstatus,
                                onChanged: (value){
                                  setState(() {
                                    scheduleaddcontroller.slelectBookingstatus = value.toString();
                                    scheduleaddcontroller.update();
                                  });
                                },
                              ),

                            if(scheduleaddcontroller.bookingstatus==true)
                               Padding(
                                  padding:EdgeInsets.only(left:6),
                                  child:Text("Select ${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.bookingStatus.toString()}",style: TextStyle(color:Colors.red,fontSize: 12),)
                              ),
                            const SizedBox(height: 100,),
                          ],
                        )

                      ],
                    ),
                  )
              )
          ),
        );
      } else{
        return Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: ThemeText.appcolor,
                  rightDotColor: ThemeText.basiccolor,
                  size: 70,
                ),
              ),
            ],
          ),
        );
      }
    });
  }
  String _formatTimeRange(TimeRangeResult range) {
    scheduleaddcontroller.startTime = _formatTime(range.start);
    scheduleaddcontroller.endTime  = _formatTime(range.end);
    scheduleaddcontroller.update();
    return '${scheduleaddcontroller.startTime} - ${scheduleaddcontroller.endTime}';
  }

  String _formatTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    return DateFormat('h:mm a').format(dt);
  }

}
