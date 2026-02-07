import 'package:animate_do/animate_do.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:time_range/time_range.dart';
import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/Sevice_Schedule_Controller/schedule_delete_controller.dart';
import '../../Controller/Sevice_Schedule_Controller/schedule_edit_controller.dart';
import '../../Controller/Sevice_Schedule_Controller/schedule_list_controller.dart';
import '../Commonpage/export.dart';
class Serviceschedule extends StatefulWidget {
  const Serviceschedule({Key? key}) : super(key: key);
  @override
  State<Serviceschedule> createState() => _ServicescheduleState();
}

class _ServicescheduleState extends State<Serviceschedule> {
  var _selectedValue;
  var selectedTime;
  var day;
  Schedulelistcontroller schedulelistcontroller = Get.put(Schedulelistcontroller());
  Scheduledeletecontroller scheduledeletecontroller = Get.put(Scheduledeletecontroller());
  getDayOfWeek(int day) {
    switch (day) {
      case 1:

        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';

    }
  }
  @override
  Widget build(BuildContext context) {
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
                Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.title.toString(),
                style: ThemeText.appbar,
              ),
            ),
            floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,
            floatingActionButton: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FloatingActionButton(
                  // isExtended: true,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: ThemeText.appcolor,
                  onPressed: () {
                    Get.toNamed(AppRoutes.serviceAddchedulePage);
                  },
                  child: const Icon(Icons.add),
                )),


            bottomNavigationBar: const Bottomnavigation(item: 3,),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: DynMouseScroll(
                durationMS: 500,
                animationCurve: Curves.ease,
                builder: (context, controller, physics) => Column(

                  children:[
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.heading.toString(),style: ThemeText.heading,),
                      ],
                    ),
                    // const SizedBox(height: 5,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Your service will take approximate 2 hrs',
                    //
                    //       style:
                    //       ThemeText.subconten,
                    //
                    //     ),
                    //   ],
                    // ),
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
                            // _selectedValue = date;
                            _selectedValue= getDayOfWeek(date.weekday);
                            schedulelistcontroller.schedulelistscreen({

                              "service_id":Get.put(Schedulelistcontroller()).serviceId,
                              "date_filter":DateFormat('yyyy-MM-dd').format(date),
                            }, "schedule_list");
                            print(_selectedValue);

                          });
                        },
                      ),
                    ),
                    Obx((){
                      if(schedulelistcontroller.sceduleListresponseStatus.isFalse &&scheduledeletecontroller.scheduleDeleteresponseStatus.isFalse) {
                      return  SizedBox(
                          height: Get.height*0.62,
                          child:SingleChildScrollView(
                              child:Column(
                                children: [
                                  if(schedulelistcontroller.schedulelistdata.value.data !=null)
                                    for(var i=0;i<schedulelistcontroller.schedulelistdata.value.data!.length;i++)
                                      FadeInUp(
                                        duration: const Duration(seconds: 1),

                                        child:   Padding(
                                            padding:const EdgeInsets.only(top:10,bottom:10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(
                                                  color: ThemeText.basiccolor, // Set border color
                                                  width: 1, // Set border width
                                                ),

                                              ),
                                              child:  InkWell(
                                                onTap: (){
                                                },
                                                child:  SizedBox(
                                                  width:MediaQuery.of(context).size.width * 1,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Row(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                SizedBox(
                                                                  width: 100,
                                                                  child: ClipRRect(
                                                                    borderRadius:
                                                                    BorderRadius.circular(10),
                                                                    child: Image.network(
                                                                      schedulelistcontroller.schedulelistdata.value.data![i].serviceimage.toString(),
                                                                      width: Get.width*0.2,
                                                                      height: Get.height*0.12,
                                                                      errorBuilder: (context, error, stackTrace) {
                                                                        return  Center(
                                                                          child: SpinKitRipple(
                                                                            color:ThemeText.appcolor,
                                                                            size: 50.0,
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              // width:0.7.sw,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment.start,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                                children: [
                                                                  Padding(

                                                                    padding: const EdgeInsets.only(
                                                                        left: 8, right: 5),
                                                                    child: Row(
                                                                      children:  [
                                                                        Text(
                                                                          schedulelistcontroller.schedulelistdata.value.data![i].servicename.toString(),
                                                                          style: ThemeText.heading1,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),



                                                                  Padding(
                                                                    padding: const EdgeInsets.only(
                                                                        left: 8, right: 5),
                                                                    child: Row(
                                                                      children:  [
                                                                        const Icon(
                                                                          Icons.lock_clock,
                                                                          size: 15,
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 8, right: 5),
                                                                          child: Text(
                                                                            " ${schedulelistcontroller.schedulelistdata.value.data![i].startTime} - ${schedulelistcontroller.schedulelistdata.value.data![i].endTime} (Time of Available)",
                                                                            style: ThemeText
                                                                                .bodydata,
                                                                            maxLines: 3,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),


                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(
                                                                        left: 8, right: 5),
                                                                    child: Row(
                                                                      children:  [
                                                                        const Icon(
                                                                          IconlyLight.calendar,
                                                                          size: 15,
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 8, right: 5),
                                                                          child: Text(
                                                                            "${schedulelistcontroller.schedulelistdata.value.data![i].scheduleDate} (Schedule Date)",
                                                                            style: ThemeText
                                                                                .bodydata,
                                                                            maxLines: 3,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if(1<2)
                                                        Padding(padding: const EdgeInsets.symmetric(horizontal:5,vertical: 5.0),
                                                          child:Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              ElevatedButton(
                                                                style: ElevatedButton.styleFrom(
                                                                    elevation: 0,
                                                                    primary: Colors.green,
                                                                    fixedSize: const Size(170, 40),

                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(5))),
                                                                onPressed: () {
                                                                  Get.put(Scheduleeditcontroller()).scedule_id=schedulelistcontroller.schedulelistdata.value.data![i].scheduleId;
                                                                  Get.put(Scheduleeditcontroller()).selectedDate=schedulelistcontroller.schedulelistdata.value.data![i].scheduleDate;
                                                                  Get.put(Scheduleeditcontroller()).slelectBookingstatus=schedulelistcontroller.schedulelistdata.value.data![i].bookingSchedule.toString();
                                                                  Get.put(Scheduleeditcontroller()).update();
                                                                  Get.toNamed(AppRoutes.serviceEditschedulePage);
                                                                },
                                                                child: Text('Edit Schedule',style: ThemeText.content,),
                                                              ),
                                                              ElevatedButton(
                                                                style: ElevatedButton.styleFrom(
                                                                    elevation: 0,
                                                                    primary: Colors.red,
                                                                    fixedSize: const Size(170, 40),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(5))),
                                                                onPressed: () {
                                                                  Get.defaultDialog(
                                                                    titlePadding:const EdgeInsets.symmetric(vertical: 15.0),
                                                                    contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                                    title: 'Delete',
                                                                    titleStyle:   ThemeText.heading,
                                                                    confirm:Container(
                                                                      height: 40.0,
                                                                      margin: const EdgeInsets.only(bottom: 15.0),
                                                                      child:FloatingActionButton(
                                                                        onPressed: (){
                                                                          scheduledeletecontroller.scheduleDeletescreen({
                                                                            "schedule_id":schedulelistcontroller.schedulelistdata.value.data![i].scheduleId,
                                                                          }, "schedule_delete")!.then((value){
                                                                            schedulelistcontroller.schedulelistscreen({

                                                                              "service_id":Get.put(Schedulelistcontroller()).serviceId,
                                                                              "date_filter":DateFormat('yyyy-MM-dd').format(DateTime.parse(schedulelistcontroller.schedulelistdata.value.data![i].scheduleDate.toString())),
                                                                            }, "schedule_list");
                                                                          });






                                                                        },
                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        backgroundColor: Colors.white,
                                                                        mini: true,
                                                                        elevation: 5.0,
                                                                        child:const Icon(
                                                                          Icons.check,
                                                                          color: Colors.green,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    cancel:Container(
                                                                      height: 40.0,
                                                                      margin: const EdgeInsets.only(bottom: 15.0),
                                                                      child:FloatingActionButton(
                                                                        onPressed: (){
                                                                          Get.back();
                                                                        },
                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        backgroundColor: Colors.white,
                                                                        mini: true,
                                                                        elevation: 5.0,
                                                                        child:const Icon(
                                                                          Icons.clear,
                                                                          color: Colors.red,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    content:const Text(
                                                                      'Are you sure, do you want to Delete  it?',
                                                                      style: TextStyle(
                                                                        color: Color(0xff7E7E7E),
                                                                        fontSize: 14.0,
                                                                        fontWeight: FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                    radius: 10.0,
                                                                  );
                                                                },
                                                                child: Text('Delete',style: ThemeText.content,),
                                                              ),

                                                            ],
                                                          ),),



                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                        ),)
                                  else Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: const [
                                      Image(
                                        image: AssetImage(
                                            "images/nodata.png"),
                                      )
                                    ],
                                  ),
                                ],
                              )

                          ) ,
                        );
                      } else {
                        return Center(
                        child: LoadingAnimationWidget.twistingDots(
                          leftDotColor: ThemeText.appcolor,
                          rightDotColor: ThemeText.basiccolor,
                          size: 70,
                        ),
                      );
                      }
                    }),








                  ],
                ),
              ),
            )
        ),
    );
  }
  String _formatTimeRange(TimeRangeResult range) {
    String startTime = _formatTime(range.start);
    String endTime = _formatTime(range.end);
    return '$startTime - $endTime';
  }

  String _formatTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    return TimeOfDay.fromDateTime(dt).format(context);
  }

}

