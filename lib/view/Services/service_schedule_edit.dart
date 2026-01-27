import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:intl/intl.dart';
import 'package:time_range/time_range.dart';

import '../../Controller/Settings_Controller/Settings_Controller.dart';
import '../../Controller/Sevice_Schedule_Controller/schedule_add_controller.dart';
import '../../Controller/Sevice_Schedule_Controller/schedule_edit_controller.dart';
import '../../Controller/Sevice_Schedule_Controller/schedule_list_controller.dart';
import '../../Controller/logincontroller.dart';
import '../commonpage/export.dart';

class Editschedule extends StatefulWidget {
  const Editschedule({Key? key}) : super(key: key);

  @override
  State<Editschedule> createState() => _EditscheduleState();
}

class _EditscheduleState extends State<Editschedule> {
  Scheduleeditcontroller scheduleeditcontroller =
      Get.put(Scheduleeditcontroller());

  @override
  void initState() {
    scheduleeditcontroller.startTime = "";
    scheduleeditcontroller.endTime = "";
    scheduleeditcontroller.timeselect = false;
    scheduleeditcontroller.bookingstatus = false;
    scheduleeditcontroller.update();
    if (scheduleeditcontroller.selectedDate == null) {
      scheduleeditcontroller.selectedDate =
          DateFormat('yyyy-MM-dd').format(DateTime.now());
      scheduleeditcontroller.selectedValue =
          scheduleeditcontroller.getDayOfWeek(DateTime.now().weekday);
      scheduleeditcontroller.update();
    } else {
      scheduleeditcontroller.selectedDate = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(scheduleeditcontroller.selectedDate));
      scheduleeditcontroller.selectedValue =
          scheduleeditcontroller.getDayOfWeek(
              DateTime.parse(scheduleeditcontroller.selectedDate).weekday);
      scheduleeditcontroller.update();
      print(scheduleeditcontroller.selectedDate);
      print(scheduleeditcontroller.selectedValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (scheduleeditcontroller.scheduleEditresponseStatus.isFalse) {
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
                  "Edit Schedule",
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
                              if ((scheduleeditcontroller.startTime != "" &&
                                      scheduleeditcontroller.endTime != "") &&
                                  (scheduleeditcontroller
                                          .slelectBookingstatus !=
                                      "")) {
                                setState(() {
                                  scheduleeditcontroller.timeselect = false;
                                  scheduleeditcontroller.bookingstatus = false;
                                  scheduleeditcontroller.update();
                                  scheduleeditcontroller.scheduleEditscreen({
                                    "schedule_id": scheduleeditcontroller
                                        .scedule_id
                                        .toString(),
                                    "service_id":
                                        Get.put(Schedulelistcontroller())
                                            .serviceId,
                                    "schedule_day": scheduleeditcontroller
                                        .selectedValue
                                        .toString(),
                                    "schedule_date": scheduleeditcontroller
                                        .selectedDate
                                        .toString(),
                                    "start_time":
                                        scheduleeditcontroller.startTime,
                                    "end_time": scheduleeditcontroller.endTime,
                                    "multiple_status": scheduleeditcontroller
                                        .slelectBookingstatus,
                                    "user_id":
                                        Getstore.box.read("userid").toString(),
                                  }, "schedule_edit")!.then((value) {
                                    Get.put(Schedulelistcontroller())
                                        .schedulelistscreen({
                                      "service_id":
                                          Get.put(Schedulelistcontroller())
                                              .serviceId,
                                      "date_filter": scheduleeditcontroller
                                          .selectedDate
                                          .toString(),
                                      // "service_id":"1",
                                      // "date_filter":"2024-04-24",
                                    }, "schedule_list");
                                  });
                                });
                              } else {
                                if (scheduleeditcontroller.startTime == "" &&
                                    scheduleeditcontroller.endTime == "") {
                                  setState(() {
                                    scheduleeditcontroller.timeselect = true;
                                    scheduleeditcontroller.update();
                                  });
                                } else {
                                  scheduleeditcontroller.timeselect = false;
                                  scheduleeditcontroller.update();
                                }
                                if (scheduleeditcontroller
                                        .slelectBookingstatus ==
                                    "") {
                                  setState(() {
                                    scheduleeditcontroller.bookingstatus = true;
                                    scheduleeditcontroller.update();
                                  });
                                } else {
                                  setState(() {
                                    scheduleeditcontroller.bookingstatus =
                                        false;
                                    scheduleeditcontroller.update();
                                  });
                                }
                              }
                              // Get.toNamed(AppRoutes.addressmap);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.saveButton.toString(),
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
              bottomNavigationBar: const Bottomnavigation(
                item: 3,
              ),
              body: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.heading.toString(),
                              style: ThemeText.heading,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        Card(
                          elevation: 0,
                          child: DatePicker(
                            DateTime.parse(scheduleeditcontroller.selectedDate)
                                .subtract(const Duration(days: 1)),
                            initialSelectedDate: DateTime.parse(
                                scheduleeditcontroller.selectedDate),
                            selectionColor: ThemeText.basiccolor,
                            selectedTextColor: Colors.white,
                            monthTextStyle: ThemeText.bodydata1,
                            dateTextStyle: ThemeText.datepic,
                            dayTextStyle: ThemeText.bodydata1,
                            deactivatedColor: const Color(0xffFFC247),
                            activeDates: [
                              DateTime.parse(scheduleeditcontroller.selectedDate)
                            ],
                            onDateChange: (date) {
                              setState(() {
                                scheduleeditcontroller.selectedDate = DateFormat('yyyy-MM-dd').format(date);
                                scheduleeditcontroller.selectedValue = scheduleeditcontroller.getDayOfWeek(date.weekday);
                                scheduleeditcontroller.update();
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TimeRange(
                            fromTitle: SizedBox(
                              height: 30,
                              child: Text(
                                Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.timeToStart.toString(),
                                style: ThemeText.heading,
                              ),
                            ),
                            toTitle: SizedBox(
                              height: 30,
                              child: Text(
                                Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.timeToEnd.toString(),
                                style: ThemeText.heading,
                              ),
                            ),
                            titlePadding: 0,
                            textStyle: ThemeText.subcontent,
                            activeTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            borderColor: ThemeText.basiccolor,
                            backgroundColor: Colors.transparent,
                            activeBorderColor: ThemeText.basiccolor,
                            activeBackgroundColor: ThemeText.basiccolor,
                            firstTime: const TimeOfDay(hour: 1, minute: 00),
                            lastTime: const TimeOfDay(hour: 24, minute: 00),
                            timeStep: 60,
                            timeBlock: 60,
                            onRangeCompleted: (range) {
                              setState(() {
                                scheduleeditcontroller.selectedTime =
                                    _formatTimeRange(range!);
                                scheduleeditcontroller.update();
                              });
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        if (scheduleeditcontroller.timeselect == true)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  child: Text(
                                    "Select the Schedule Time",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  ))
                            ],
                          ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
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
                            for (var i = 0;
                                i < scheduleeditcontroller.datas.length;
                                i++)
                              RadioListTile(
                                activeColor: ThemeText.appcolor,
                                title: Text(
                                  scheduleeditcontroller.datas[i]["value"]
                                      .toString(),
                                  style: ThemeText.buttontab,
                                  textAlign: TextAlign.start,
                                ),
                                value: scheduleeditcontroller.datas[i]["id"]
                                    .toString(),
                                groupValue:
                                    scheduleeditcontroller.slelectBookingstatus,
                                onChanged: (value) {
                                  setState(() {
                                    scheduleeditcontroller
                                            .slelectBookingstatus =
                                        value.toString();
                                    scheduleeditcontroller.update();
                                  });
                                },
                              ),
                            if (scheduleeditcontroller.bookingstatus == true)
                               Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  child: Text(
                                    "Select ${Get.put(Settingscontroller()).settingsdata.value.data!.cmsData!.serviceScheduleList!.bookingStatus.toString()}",
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  )),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        )
                      ],
                    ),
                  ))),
        );
      } else {
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
    scheduleeditcontroller.startTime = _formatTime(range.start);
    scheduleeditcontroller.endTime = _formatTime(range.end);
    scheduleeditcontroller.update();
    return '${scheduleeditcontroller.startTime} - ${scheduleeditcontroller.endTime}';
  }

  String _formatTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dt = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    return DateFormat('h:mm a').format(dt);
  }
}
