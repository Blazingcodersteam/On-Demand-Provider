import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapbox_search/mapbox_search.dart';
import '/Controller/address_add_controller.dart';
import '/Controller/logincontroller.dart';
import '../commonpage/export.dart';

class Maplocation extends StatefulWidget {
  const Maplocation({Key? key}) : super(key: key);


  @override
  State<Maplocation> createState() => MaplocationState();
}

class MaplocationState extends State<Maplocation> {

  GoogleMapController? googleMapController;
  static  CameraPosition initialCameraPosition = const CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};
  static var address="";

  var city="";
  var postalCode="";
  var latitudeValue="";
  var longitudeValue="";
  var currentLocationStatus=false;
  Addressaddcontroller addressaddcontroller = Get.put(Addressaddcontroller());
  final TextEditingController searchAddress = TextEditingController();
  final String mapboxApiKey = 'pk.eyJ1Ijoia2FydGhpa2cxMjMiLCJhIjoiY2toZDFmOHRwMXRiNTJ4bnFwbTNyazh4ZiJ9.BBIQCJsDvKcz2nKs6LbbIg';
  PlacesSearch? placesSearch;
  MaplocationState() : placesSearch = PlacesSearch(apiKey: 'pk.eyJ1Ijoia2FydGhpa2cxMjMiLCJhIjoiY2toZDFmOHRwMXRiNTJ4bnFwbTNyazh4ZiJ9.BBIQCJsDvKcz2nKs6LbbIg', limit: 10,);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    locationInitializing().whenComplete(() {
      Future.delayed(const Duration(seconds: 1), () {
        currentLocationStatus=true;
        setState(() {});
      });
    });
  }

  Future locationInitializing()async{

    Position position = await getLocation();
    if(addressaddcontroller.status=="1"){

      _getAddressFromLatLng(LatLng(position.latitude, position.longitude));
      return true;
    }else{
      _getAddressFromLatLng(LatLng(double.parse(addressaddcontroller.latitude), double.parse(addressaddcontroller.logitude)));
      return true;
    }




  }

  @override
  Widget build(BuildContext context) {
    if(currentLocationStatus && addressaddcontroller.addressaddresponseStatus.isFalse) {
      return Scaffold(
        backgroundColor: const Color(0xffE1E1E1),
        body:SafeArea(
          child:Stack(
            children: <Widget>[
              SizedBox(
                height:Get.height*0.55,
                child:GoogleMap(
                  initialCameraPosition:initialCameraPosition,
                  markers: markers,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  onTap: (value){
                    _getAddressFromLatLng(value);
                  },
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                  },
                ),
              ),
              Positioned(
                top: 0,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white,
                      ),
                      child:IconButton(
                        icon:Icon(
                          Icons.arrow_back_ios,
                          color:ThemeText.headingcolor,
                          size: 22.0,
                        ),
                        onPressed: () {
                          Get.back();

                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width:0.75.sw,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: TypeAheadField<MapBoxPlace>(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: searchAddress,
                          cursorColor: ThemeText.appcolor,
                          decoration: InputDecoration(
                            hintText: 'Enter Area / City / Postal Code',
                            hintStyle: const TextStyle(fontSize: 14.0),

                            contentPadding: const EdgeInsets.all(10.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide:  BorderSide(width: 1, color:ThemeText.appcolor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:  BorderSide(width: 1, color:ThemeText.appcolor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        suggestionsCallback: (pattern) async {
                          if (pattern.isEmpty) {
                            return <MapBoxPlace>[];
                          }
                          final results = await placesSearch!.getPlaces(pattern);
                          return results ?? <MapBoxPlace>[];
                        },
                        itemBuilder: (context, MapBoxPlace suggestion) {
                          return ListTile(
                            title: Text(suggestion.placeName ?? ''),
                          );
                        },
                        onSuggestionSelected: (MapBoxPlace suggestion) {
                          searchAddress.text = suggestion.placeName ?? '';
                          // Retrieve latitude and longitude
                          setState(() {
                            double? latitude = suggestion.center?[1];
                            double? longitude = suggestion.center?[0];
                            if (latitude != null && longitude != null) {
                              print('Selected place: ${suggestion.placeName}');
                              print('Latitude: $latitude, Longitude: $longitude');

                              setState(() {
                                _getAddressFromLatLng(LatLng(latitude,longitude));

                              });
                              print(initialCameraPosition);

                            } else {
                              print('Coordinates are not available for this place.');
                            }
                          });
                          print('Selected place: ${suggestion.placeName}');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 15,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white,
                    ),
                    child:TextButton(
                      child:Row(
                        children: [
                          Icon(
                            Icons.my_location,
                            color:ThemeText.appcolor,
                            size: 22.0,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Locate Me",
                            style:TextStyle(
                              color: ThemeText.appcolor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () async {
                        Position position = await getLocation();
                        _getAddressFromLatLng(LatLng(position.latitude, position.longitude));
                      },
                    ),
                  )
              ),
            ],
          ),
        ),
        bottomSheet:Container(
          height:Get.height*0.47,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xffE1E1E1),
          margin: EdgeInsets.zero,

          child: Card(
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
            ),
            child:Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child:Column(
                children:[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0 ,vertical: 5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Select Delivery Location",
                      style: TextStyle(
                        color: Color(0xff7E7E7E),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                      child:Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Container(
                                width: 30.0,
                                height: 30.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color:ThemeText.appcolor,
                                ),
                                child:const Icon(
                                  Icons.location_on_outlined,
                                  color:Colors.white,
                                  size: 20.0,
                                ),
                              ),
                              const SizedBox(width:5),
                              SizedBox(
                                child: Text(
                                  city,
                                  style:  TextStyle(
                                    color: ThemeText.headingcolor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 5),
                            child: Container(
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: 3.0, vertical: 3.0),

                              decoration: BoxDecoration(
                                // color:ThemeText.basiccolor, // Set your desired color here
                                borderRadius: BorderRadius.circular(
                                    15), // Set your desired border radius here
                              ),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    //set border radius more than 50% of height and width to make circle
                                  ),
                                  shadowColor: ThemeText.basiccolor,
                                  elevation: 7,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child:  Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0.0, horizontal: 15.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Description",
                                                style: TextStyle(
                                                  color: ThemeText.headingcolor,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextFormField(
                                          controller: addressaddcontroller.discController,


                                          autocorrect: true,
                                          keyboardType: TextInputType.emailAddress,
                                          validator: (value) {
                                            // Check if this field is empty
                                            if (value == null || value.isEmpty) {
                                              return 'This field is required';
                                            }

                                            // using regular expression
                                            // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                            //   return "Please enter a valid email address";
                                            // }

                                            // the email is valid
                                            return null;
                                          },
                                          style: const TextStyle(
                                              color: Color(0xffADA4A5),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          cursorColor: ThemeText.appcolor,


                                          decoration:  Common.common("Description",Icons.note_alt_outlined),
                                        ),



                                      ],
                                    ),




                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 5),
                            child: Container(
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: 3.0, vertical: 3.0),

                              decoration: BoxDecoration(
                                // color:ThemeText.basiccolor, // Set your desired color here
                                borderRadius: BorderRadius.circular(
                                    15), // Set your desired border radius here
                              ),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    //set border radius more than 50% of height and width to make circle
                                  ),
                                  shadowColor: ThemeText.basiccolor,
                                  elevation: 7,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child:  Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0.0, horizontal: 15.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Address",
                                                style: TextStyle(
                                                  color: ThemeText.headingcolor,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextFormField(
                                          controller:TextEditingController(text: address),
                                          autocorrect: true,
                                          keyboardType: TextInputType.emailAddress,
                                          validator: (value) {
                                            // Check if this field is empty
                                            if (value == null || value.isEmpty) {
                                              return 'This field is required';
                                            }

                                            return null;
                                          },
                                          style: const TextStyle(
                                              color: Color(0xffADA4A5),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          cursorColor: ThemeText.appcolor,
                                          decoration:  Common.common("Address",IconlyLight.location),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),


                        ],
                      )
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      child: ElevatedButton(
                        style: ThemeText.buttoncommon,
                        onPressed: () {
                          // print(addressaddcontroller.discController.text.toString());
                          addressaddcontroller.addressaddscreen({
                            if(addressaddcontroller.id!="")
                              "ad_id": addressaddcontroller.id.toString(),
                            "user_id": Getstore.box.read("userid").toString(),
                            "ad_area": addressaddcontroller.ad_area.toString(),
                            "ad_city": addressaddcontroller.ad_city.toString(),
                            "ad_district": addressaddcontroller.ad_district.toString(),
                            "ad_state":addressaddcontroller.ad_state.toString(),
                            "ad_pincode": postalCode.toString(),
                            "ad_addresses": address.toString(),
                            "ad_latitude": latitudeValue.toString(),
                            "ad_longitude": longitudeValue.toString(),
                            "ad_description": addressaddcontroller.discController.text,

                          }, "add_address");
                          Get.back();


                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Confirm Location",
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
        ),
      );
    }
    else{
      return  Container(
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
  }

  Future getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(Exception('Location permissions are permanently denied.'));
      }
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error(Exception('Location permissions are denied.'));
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude).then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        initialCameraPosition = CameraPosition(target: LatLng(position.latitude, position.longitude),zoom: 14);
        latitudeValue=position.latitude.toString();
        longitudeValue=position.longitude.toString();

        city=place.subLocality!=""?"${place.subLocality}":place.locality!=""?"${place.locality}":"${place.street}";
        postalCode=place.postalCode.toString();
        address = '${place.street!=""?"${place.street} ,":""}${place.subLocality!=""?"${place.subLocality} ,":""}${place.locality!=""?"${place.locality} ,":""}${place.administrativeArea!=""?"${place.administrativeArea} ,":""}${place.postalCode!=""?"${place.postalCode}":""}';

        addressaddcontroller.ad_city=city;
        addressaddcontroller.ad_area=place.street;
        addressaddcontroller.ad_pincode=postalCode;
        addressaddcontroller.ad_district=place.locality;
        addressaddcontroller.ad_state=place.administrativeArea;
        searchAddress.text=address;
        print(addressaddcontroller.ad_city);
        print(addressaddcontroller.ad_area);
        print(addressaddcontroller.ad_pincode);
        print(addressaddcontroller.ad_district);
        print(addressaddcontroller.ad_state);
        addressaddcontroller.update();
        //address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}';
      });
      googleMapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));
      markers.clear();
      markers.add(Marker(markerId: const MarkerId('movingmarker'),position: LatLng(position.latitude, position.longitude)));
    }).catchError((e) {
      debugPrint(e);
    });
  }

}

