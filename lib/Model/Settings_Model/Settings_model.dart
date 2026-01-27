class Settingsmodel {
  bool? status;
  String? msg;
  Data? data;

  Settingsmodel({this.status, this.msg, this.data});

  Settingsmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Color? color;
  int? basic;
  String? logoUrl;
  CmsData? cmsData;
  String? siteName;
  String? siteLogo;
  CurrencyData? currencyData;

  Data(
      {this.color,
        this.basic,
        this.logoUrl,
        this.cmsData,
        this.siteName,
        this.siteLogo,
        this.currencyData});

  Data.fromJson(Map<String, dynamic> json) {
    color = json['color'] != null ? Color.fromJson(json['color']) : null;
    basic = json['basic'];
    logoUrl = json['logo_url'];
    cmsData = json['cms_data'] != null
        ? CmsData.fromJson(json['cms_data'])
        : null;
    siteName = json['site_name'];
    siteLogo = json['site_logo'];
    currencyData = json['currency_data'] != null
        ? CurrencyData.fromJson(json['currency_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (color != null) {
      data['color'] = color!.toJson();
    }
    data['basic'] = basic;
    data['logo_url'] = logoUrl;
    if (cmsData != null) {
      data['cms_data'] = cmsData!.toJson();
    }
    data['site_name'] = siteName;
    data['site_logo'] = siteLogo;
    if (currencyData != null) {
      data['currency_data'] = currencyData!.toJson();
    }
    return data;
  }
}

class Color {
  String? providerColorId;
  String? basiccolor;
  String? appcolor;
  String? secondarycolor;
  String? deleteicon;
  String? contentcolor;
  String? headingcolor;
  String? secontarytextcolor;
  String? created;

  Color(
      {this.providerColorId,
        this.basiccolor,
        this.appcolor,
        this.secondarycolor,
        this.deleteicon,
        this.contentcolor,
        this.headingcolor,
        this.secontarytextcolor,
        this.created});

  Color.fromJson(Map<String, dynamic> json) {
    providerColorId = json['provider_color_id'];
    basiccolor = json['basiccolor'];
    appcolor = json['appcolor'];
    secondarycolor = json['secondarycolor'];
    deleteicon = json['deleteicon'];
    contentcolor = json['contentcolor'];
    headingcolor = json['headingcolor'];
    secontarytextcolor = json['secontarytextcolor'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['provider_color_id'] = providerColorId;
    data['basiccolor'] = basiccolor;
    data['appcolor'] = appcolor;
    data['secondarycolor'] = secondarycolor;
    data['deleteicon'] = deleteicon;
    data['contentcolor'] = contentcolor;
    data['headingcolor'] = headingcolor;
    data['secontarytextcolor'] = secontarytextcolor;
    data['created'] = created;
    return data;
  }
}

class CmsData {
  Loginpage? loginpage;
  ServiceHome? serviceHome;
  ProviderAccount? providerAccount;
  MyProviders? myProviders;
  ProviderForm? providerForm;
  MyServices? myServices;
  ServiceScheduleList? serviceScheduleList;
  ServiceEditService? serviceEditService;
  Login? login;
  BasicInformation? basicInformation;
  ChangePassword? changePassword;
  Booking? booking;
  Booking? notification;
  ReviewReply? reviewReply;
  Menu? menu;
  ServiceLogin? serviceLogin;
  ServiceMenu? serviceMenu;
  ServiceAccount? serviceAccount;
  SeviceChangePassword? seviceChangePassword;
  Booking? serviceNotifications;
  ServiceMyBooking? serviceMyBooking;
  ServiceEditReview? serviceEditReview;
  Booking? serviceFavorite;
  ServiceDetail? serviceDetail;
  ServiceBookTheService? serviceBookTheService;
  ServiceBookDetails? serviceBookDetails;
  ServiceBookingConformation? serviceBookingConformation;
  ProviderLocation? providerLocation;
  ServiceBookingCompleted? serviceBookingCompleted;
  Review? review;
  ServiceProviderView? serviceProviderView;
  MailVerification? mailVerification;
  Support? support;

  CmsData(
      {this.loginpage,
        this.serviceHome,
        this.providerAccount,
        this.myProviders,
        this.providerForm,
        this.myServices,
        this.serviceScheduleList,
        this.serviceEditService,
        this.login,
        this.basicInformation,
        this.changePassword,
        this.booking,
        this.notification,
        this.reviewReply,
        this.menu,
        this.serviceLogin,
        this.serviceMenu,
        this.serviceAccount,
        this.seviceChangePassword,
        this.serviceNotifications,
        this.serviceMyBooking,
        this.serviceEditReview,
        this.serviceFavorite,
        this.serviceDetail,
        this.serviceBookTheService,
        this.serviceBookDetails,
        this.serviceBookingConformation,
        this.providerLocation,
        this.serviceBookingCompleted,
        this.review,
        this.serviceProviderView,
        this.mailVerification,
        this.support});

  CmsData.fromJson(Map<String, dynamic> json) {
    loginpage = json['Loginpage'] != null
        ? Loginpage.fromJson(json['Loginpage'])
        : null;
    serviceHome = json['service Home'] != null
        ? ServiceHome.fromJson(json['service Home'])
        : null;
    providerAccount = json['Provider_Account'] != null
        ? ProviderAccount.fromJson(json['Provider_Account'])
        : null;
    myProviders = json['my Providers'] != null
        ? MyProviders.fromJson(json['my Providers'])
        : null;
    providerForm = json['Provider_Form'] != null
        ? ProviderForm.fromJson(json['Provider_Form'])
        : null;
    myServices = json['my Services'] != null
        ? MyServices.fromJson(json['my Services'])
        : null;
    serviceScheduleList = json['Service Schedule List'] != null
        ? ServiceScheduleList.fromJson(json['Service Schedule List'])
        : null;
    serviceEditService = json['Service Edit Service'] != null
        ? ServiceEditService.fromJson(json['Service Edit Service'])
        : null;
    login = json['login'] != null ? Login.fromJson(json['login']) : null;
    basicInformation = json['basic information'] != null
        ? BasicInformation.fromJson(json['basic information'])
        : null;
    changePassword = json['change password'] != null
        ? ChangePassword.fromJson(json['change password'])
        : null;
    booking =
    json['Booking'] != null ? Booking.fromJson(json['Booking']) : null;
    notification = json['notification'] != null
        ? Booking.fromJson(json['notification'])
        : null;
    reviewReply = json['review reply'] != null
        ? ReviewReply.fromJson(json['review reply'])
        : null;
    menu = json['menu'] != null ? Menu.fromJson(json['menu']) : null;
    serviceLogin = json['service login'] != null
        ? ServiceLogin.fromJson(json['service login'])
        : null;
    serviceMenu = json['service menu'] != null
        ? ServiceMenu.fromJson(json['service menu'])
        : null;
    serviceAccount = json['service Account'] != null
        ? ServiceAccount.fromJson(json['service Account'])
        : null;
    seviceChangePassword = json['sevice change password'] != null
        ? SeviceChangePassword.fromJson(json['sevice change password'])
        : null;
    serviceNotifications = json['service notifications'] != null
        ? Booking.fromJson(json['service notifications'])
        : null;
    serviceMyBooking = json['service my booking'] != null
        ? ServiceMyBooking.fromJson(json['service my booking'])
        : null;
    serviceEditReview = json['service edit review'] != null
        ? ServiceEditReview.fromJson(json['service edit review'])
        : null;
    serviceFavorite = json['service favorite'] != null
        ? Booking.fromJson(json['service favorite'])
        : null;
    serviceDetail = json['service detail'] != null
        ? ServiceDetail.fromJson(json['service detail'])
        : null;
    serviceBookTheService = json['service book the service'] != null
        ? ServiceBookTheService.fromJson(json['service book the service'])
        : null;
    serviceBookDetails = json['service book details'] != null
        ? ServiceBookDetails.fromJson(json['service book details'])
        : null;
    serviceBookingConformation = json['service booking conformation'] != null
        ? ServiceBookingConformation.fromJson(
        json['service booking conformation'])
        : null;
    providerLocation = json['provider location'] != null
        ? ProviderLocation.fromJson(json['provider location'])
        : null;
    serviceBookingCompleted = json['service booking completed'] != null
        ? ServiceBookingCompleted.fromJson(
        json['service booking completed'])
        : null;
    review =
    json['review '] != null ? Review.fromJson(json['review ']) : null;
    serviceProviderView = json['Service_provider_view'] != null
        ? ServiceProviderView.fromJson(json['Service_provider_view'])
        : null;
    mailVerification = json['Mail_verification'] != null
        ? MailVerification.fromJson(json['Mail_verification'])
        : null;
    support =
    json['Support'] != null ? Support.fromJson(json['Support']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (loginpage != null) {
      data['Loginpage'] = loginpage!.toJson();
    }
    if (serviceHome != null) {
      data['service Home'] = serviceHome!.toJson();
    }
    if (providerAccount != null) {
      data['Provider_Account'] = providerAccount!.toJson();
    }
    if (myProviders != null) {
      data['my Providers'] = myProviders!.toJson();
    }
    if (providerForm != null) {
      data['Provider_Form'] = providerForm!.toJson();
    }
    if (myServices != null) {
      data['my Services'] = myServices!.toJson();
    }
    if (serviceScheduleList != null) {
      data['Service Schedule List'] = serviceScheduleList!.toJson();
    }
    if (serviceEditService != null) {
      data['Service Edit Service'] = serviceEditService!.toJson();
    }
    if (login != null) {
      data['login'] = login!.toJson();
    }
    if (basicInformation != null) {
      data['basic information'] = basicInformation!.toJson();
    }
    if (changePassword != null) {
      data['change password'] = changePassword!.toJson();
    }
    if (booking != null) {
      data['Booking'] = booking!.toJson();
    }
    if (notification != null) {
      data['notification'] = notification!.toJson();
    }
    if (reviewReply != null) {
      data['review reply'] = reviewReply!.toJson();
    }
    if (menu != null) {
      data['menu'] = menu!.toJson();
    }
    if (serviceLogin != null) {
      data['service login'] = serviceLogin!.toJson();
    }
    if (serviceMenu != null) {
      data['service menu'] = serviceMenu!.toJson();
    }
    if (serviceAccount != null) {
      data['service Account'] = serviceAccount!.toJson();
    }
    if (seviceChangePassword != null) {
      data['sevice change password'] = seviceChangePassword!.toJson();
    }
    if (serviceNotifications != null) {
      data['service notifications'] = serviceNotifications!.toJson();
    }
    if (serviceMyBooking != null) {
      data['service my booking'] = serviceMyBooking!.toJson();
    }
    if (serviceEditReview != null) {
      data['service edit review'] = serviceEditReview!.toJson();
    }
    if (serviceFavorite != null) {
      data['service favorite'] = serviceFavorite!.toJson();
    }
    if (serviceDetail != null) {
      data['service detail'] = serviceDetail!.toJson();
    }
    if (serviceBookTheService != null) {
      data['service book the service'] = serviceBookTheService!.toJson();
    }
    if (serviceBookDetails != null) {
      data['service book details'] = serviceBookDetails!.toJson();
    }
    if (serviceBookingConformation != null) {
      data['service booking conformation'] =
          serviceBookingConformation!.toJson();
    }
    if (providerLocation != null) {
      data['provider location'] = providerLocation!.toJson();
    }
    if (serviceBookingCompleted != null) {
      data['service booking completed'] =
          serviceBookingCompleted!.toJson();
    }
    if (review != null) {
      data['review '] = review!.toJson();
    }
    if (serviceProviderView != null) {
      data['Service_provider_view'] = serviceProviderView!.toJson();
    }
    if (mailVerification != null) {
      data['Mail_verification'] = mailVerification!.toJson();
    }
    if (support != null) {
      data['Support'] = support!.toJson();
    }
    return data;
  }
}

class Loginpage {
  String? heading;
  String? subTitle;
  String? title;
  String? button;

  Loginpage({this.heading, this.subTitle, this.title, this.button});

  Loginpage.fromJson(Map<String, dynamic> json) {
    heading = json['Heading'];
    subTitle = json['sub_title'];
    title = json['title'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Heading'] = heading;
    data['sub_title'] = subTitle;
    data['title'] = title;
    data['button'] = button;
    return data;
  }
}

class ServiceHome {
  String? heading;
  String? catagoriesName;
  String? serviceList;
  String? locationButton;
  String? addressTitle;
  String? availability;

  ServiceHome(
      {this.heading,
        this.catagoriesName,
        this.serviceList,
        this.locationButton,
        this.addressTitle,
        this.availability});

  ServiceHome.fromJson(Map<String, dynamic> json) {
    heading = json['Heading'];
    catagoriesName = json['catagories_name'];
    serviceList = json['Service_list'];
    locationButton = json['location_button'];
    addressTitle = json['address_title'];
    availability = json['Availability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Heading'] = heading;
    data['catagories_name'] = catagoriesName;
    data['Service_list'] = serviceList;
    data['location_button'] = locationButton;
    data['address_title'] = addressTitle;
    data['Availability'] = availability;
    return data;
  }
}

class ProviderAccount {
  String? title;
  String? heading;
  String? content;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? biography;
  String? saveButton;

  ProviderAccount(
      {this.title,
        this.heading,
        this.content,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.biography,
        this.saveButton});

  ProviderAccount.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    heading = json['heading'];
    content = json['content'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    biography = json['biography'];
    saveButton = json['save_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['heading'] = heading;
    data['content'] = content;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['biography'] = biography;
    data['save_button'] = saveButton;
    return data;
  }
}

class MyProviders {
  String? title;
  String? menuItem1;
  String? menuItem2;
  String? menuItem3;
  String? menuItem4;
  String? availability;
  String? discription;
  String? availabilityContent;
  String? menuItem5;

  MyProviders(
      {this.title,
        this.menuItem1,
        this.menuItem2,
        this.menuItem3,
        this.menuItem4,
        this.availability,
        this.discription,
        this.availabilityContent,
        this.menuItem5});

  MyProviders.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    menuItem1 = json['menu_item1'];
    menuItem2 = json['menu_item2'];
    menuItem3 = json['menu_item3'];
    menuItem4 = json['menu_item4'];
    availability = json['availability'];
    discription = json['discription'];
    availabilityContent = json['availability_content'];
    menuItem5 = json['menu_item5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['menu_item1'] = menuItem1;
    data['menu_item2'] = menuItem2;
    data['menu_item3'] = menuItem3;
    data['menu_item4'] = menuItem4;
    data['availability'] = availability;
    data['discription'] = discription;
    data['availability_content'] = availabilityContent;
    data['menu_item5'] = menuItem5;
    return data;
  }
}

class ProviderForm {
  String? title;
  String? step1;
  String? step2;
  String? step3;
  String? selectAddress;
  String? buttonText;
  String? images;
  String? providerName;
  String? description;
  String? phoneNumber;
  String? alternativeNumber;
  String? providerType;
  String? taxes;
  String? timePeriod;
  String? saveButton;

  ProviderForm(
      {this.title,
        this.step1,
        this.step2,
        this.step3,
        this.selectAddress,
        this.buttonText,
        this.images,
        this.providerName,
        this.description,
        this.phoneNumber,
        this.alternativeNumber,
        this.providerType,
        this.taxes,
        this.timePeriod,
        this.saveButton});

  ProviderForm.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    step1 = json['step_1'];
    step2 = json['step_2'];
    step3 = json['step_3'];
    selectAddress = json['select_address'];
    buttonText = json['Button_text'];
    images = json['images'];
    providerName = json['provider_name'];
    description = json['description'];
    phoneNumber = json['phone_number'];
    alternativeNumber = json['alternative_number'];
    providerType = json['provider_type'];
    taxes = json['taxes'];
    timePeriod = json['time_period'];
    saveButton = json['save_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['step_1'] = step1;
    data['step_2'] = step2;
    data['step_3'] = step3;
    data['select_address'] = selectAddress;
    data['Button_text'] = buttonText;
    data['images'] = images;
    data['provider_name'] = providerName;
    data['description'] = description;
    data['phone_number'] = phoneNumber;
    data['alternative_number'] = alternativeNumber;
    data['provider_type'] = providerType;
    data['taxes'] = taxes;
    data['time_period'] = timePeriod;
    data['save_button'] = saveButton;
    return data;
  }
}

class MyServices {
  String? title;
  String? menu1;
  String? menu2;
  String? menu3;
  String? menu4;
  String? menu5;
  String? menu6;
  String? description;
  String? duration;
  String? galleries;
  String? reviewRatings;
  String? reviews;
  String? reviewTitle;
  String? reviewButton;
  String? menu7;
  String? menu8;

  MyServices(
      {this.title,
        this.menu1,
        this.menu2,
        this.menu3,
        this.menu4,
        this.menu5,
        this.menu6,
        this.description,
        this.duration,
        this.galleries,
        this.reviewRatings,
        this.reviews,
        this.reviewTitle,
        this.reviewButton,
        this.menu7,
        this.menu8});

  MyServices.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    menu1 = json['menu_1'];
    menu2 = json['menu_2'];
    menu3 = json['menu_3'];
    menu4 = json['menu_4'];
    menu5 = json['menu_5'];
    menu6 = json['menu_6'];
    description = json['description'];
    duration = json['duration'];
    galleries = json['galleries'];
    reviewRatings = json['review_ratings'];
    reviews = json['reviews'];
    reviewTitle = json['review_title'];
    reviewButton = json['review_button'];
    menu7 = json['menu_7'];
    menu8 = json['menu_8'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['menu_1'] = menu1;
    data['menu_2'] = menu2;
    data['menu_3'] = menu3;
    data['menu_4'] = menu4;
    data['menu_5'] = menu5;
    data['menu_6'] = menu6;
    data['description'] = description;
    data['duration'] = duration;
    data['galleries'] = galleries;
    data['review_ratings'] = reviewRatings;
    data['reviews'] = reviews;
    data['review_title'] = reviewTitle;
    data['review_button'] = reviewButton;
    data['menu_7'] = menu7;
    data['menu_8'] = menu8;
    return data;
  }
}

class ServiceScheduleList {
  String? title;
  String? heading;
  String? addScheduleTitle;
  String? timeToStart;
  String? timeToEnd;
  String? bookingStatus;
  String? saveButton;

  ServiceScheduleList(
      {this.title,
        this.heading,
        this.addScheduleTitle,
        this.timeToStart,
        this.timeToEnd,
        this.bookingStatus,
        this.saveButton});

  ServiceScheduleList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    heading = json['heading'];
    addScheduleTitle = json['add_schedule_title'];
    timeToStart = json['time_to_start'];
    timeToEnd = json['time_to_end'];
    bookingStatus = json['booking_status'];
    saveButton = json['save_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['heading'] = heading;
    data['add_schedule_title'] = addScheduleTitle;
    data['time_to_start'] = timeToStart;
    data['time_to_end'] = timeToEnd;
    data['booking_status'] = bookingStatus;
    data['save_button'] = saveButton;
    return data;
  }
}

class ServiceEditService {
  String? title;
  String? heading;
  String? subTitle;
  String? images;
  String? serviceName;
  String? description;
  String? priceUnit;
  String? quantityUnit;
  String? price;
  String? discountPrice;
  String? providers;
  String? duration;
  String? saveButton;

  ServiceEditService(
      {this.title,
        this.heading,
        this.subTitle,
        this.images,
        this.serviceName,
        this.description,
        this.priceUnit,
        this.quantityUnit,
        this.price,
        this.discountPrice,
        this.providers,
        this.duration,
        this.saveButton});

  ServiceEditService.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    heading = json['heading'];
    subTitle = json['sub_title'];
    images = json['images'];
    serviceName = json['service_name'];
    description = json['description'];
    priceUnit = json['price_unit'];
    quantityUnit = json['quantity_unit'];
    price = json['price'];
    discountPrice = json['discount_price'];
    providers = json['providers'];
    duration = json['duration'];
    saveButton = json['save_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['heading'] = heading;
    data['sub_title'] = subTitle;
    data['images'] = images;
    data['service_name'] = serviceName;
    data['description'] = description;
    data['price_unit'] = priceUnit;
    data['quantity_unit'] = quantityUnit;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['providers'] = providers;
    data['duration'] = duration;
    data['save_button'] = saveButton;
    return data;
  }
}

class Login {
  String? title;
  String? subTitle;
  String? logIn;
  String? phoneNumbeEmail;
  String? password;
  String? loginButton;
  String? forgotPassword;
  String? loginRegisterOtp;
  String? phoneNumber;
  String? verifyOtpButton;
  String? loginUsernamePassword;
  String? otpTitle;
  String? phoneNumberVerification;
  String? verifyLoginButton;

  Login(
      {this.title,
        this.subTitle,
        this.logIn,
        this.phoneNumbeEmail,
        this.password,
        this.loginButton,
        this.forgotPassword,
        this.loginRegisterOtp,
        this.phoneNumber,
        this.verifyOtpButton,
        this.loginUsernamePassword,
        this.otpTitle,
        this.phoneNumberVerification,
        this.verifyLoginButton});

  Login.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['sub_title'];
    logIn = json['log_in'];
    phoneNumbeEmail = json['phone_numbe/email'];
    password = json['password'];
    loginButton = json['login_button'];
    forgotPassword = json['forgot_password'];
    loginRegisterOtp = json['login/register_otp'];
    phoneNumber = json['phone_number'];
    verifyOtpButton = json['verify_otp_button'];
    loginUsernamePassword = json['login_username_password'];
    otpTitle = json['otp_title'];
    phoneNumberVerification = json['phone_number_verification'];
    verifyLoginButton = json['verify_login_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['sub_title'] = subTitle;
    data['log_in'] = logIn;
    data['phone_numbe/email'] = phoneNumbeEmail;
    data['password'] = password;
    data['login_button'] = loginButton;
    data['forgot_password'] = forgotPassword;
    data['login/register_otp'] = loginRegisterOtp;
    data['phone_number'] = phoneNumber;
    data['verify_otp_button'] = verifyOtpButton;
    data['login_username_password'] = loginUsernamePassword;
    data['otp_title'] = otpTitle;
    data['phone_number_verification'] = phoneNumberVerification;
    data['verify_login_button'] = verifyLoginButton;
    return data;
  }
}

class BasicInformation {
  String? title;
  String? heading;
  String? subTitle;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? password;
  String? biography;
  String? saveButton;

  BasicInformation(
      {this.title,
        this.heading,
        this.subTitle,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.password,
        this.biography,
        this.saveButton});

  BasicInformation.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    heading = json['heading'];
    subTitle = json['sub_title'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    biography = json['biography'];
    saveButton = json['save_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['heading'] = heading;
    data['sub_title'] = subTitle;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    data['biography'] = biography;
    data['save_button'] = saveButton;
    return data;
  }
}

class ChangePassword {
  String? title;
  String? heading;
  String? subTitle;
  String? previousPassword;
  String? newPassword;
  String? confirmPassword;
  String? saveButton;

  ChangePassword(
      {this.title,
        this.heading,
        this.subTitle,
        this.previousPassword,
        this.newPassword,
        this.confirmPassword,
        this.saveButton});

  ChangePassword.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    heading = json['heading'];
    subTitle = json['sub_title'];
    previousPassword = json['previous_password'];
    newPassword = json['new_password'];
    confirmPassword = json['confirm_password'];
    saveButton = json['save_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['heading'] = heading;
    data['sub_title'] = subTitle;
    data['previous_password'] = previousPassword;
    data['new_password'] = newPassword;
    data['confirm_password'] = confirmPassword;
    data['save_button'] = saveButton;
    return data;
  }
}

class Booking {
  String? title;

  Booking({this.title});

  Booking.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    return data;
  }
}

class ReviewReply {
  String? title;
  String? saveButton;

  ReviewReply({this.title, this.saveButton});

  ReviewReply.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    saveButton = json['save_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['save_button'] = saveButton;
    return data;
  }
}

class Menu {
  String? home;
  String? account;
  String? myProviders;
  String? myServices;
  String? notifications;
  String? bookings;
  String? changePassword;
  String? logout;
  String? support;

  Menu(
      {this.home,
        this.account,
        this.myProviders,
        this.myServices,
        this.notifications,
        this.bookings,
        this.changePassword,
        this.logout,
        this.support});

  Menu.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    account = json['account'];
    myProviders = json['my_providers'];
    myServices = json['my_services'];
    notifications = json['notifications'];
    bookings = json['bookings'];
    changePassword = json['change_password'];
    logout = json['logout'];
    support = json['Support'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['account'] = account;
    data['my_providers'] = myProviders;
    data['my_services'] = myServices;
    data['notifications'] = notifications;
    data['bookings'] = bookings;
    data['change_password'] = changePassword;
    data['logout'] = logout;
    data['Support'] = support;
    return data;
  }
}

class ServiceLogin {
  String? title;
  String? subTitle;
  String? logIn;
  String? phoneNumbeEmail;
  String? password;
  String? forgotPassword;
  String? loginButton;
  String? loginRegisterOtp;
  String? phoneNumber;
  String? verifyOtpButton;
  String? loginUsernamePassword;
  String? forgotPasswordHeading;
  String? email;
  String? sendButton;

  ServiceLogin(
      {this.title,
        this.subTitle,
        this.logIn,
        this.phoneNumbeEmail,
        this.password,
        this.forgotPassword,
        this.loginButton,
        this.loginRegisterOtp,
        this.phoneNumber,
        this.verifyOtpButton,
        this.loginUsernamePassword,
        this.forgotPasswordHeading,
        this.email,
        this.sendButton});

  ServiceLogin.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['sub_title'];
    logIn = json['log_in'];
    phoneNumbeEmail = json['phone_numbe/email'];
    password = json['password'];
    forgotPassword = json['forgot_password'];
    loginButton = json['login_button'];
    loginRegisterOtp = json['login/register_otp'];
    phoneNumber = json['phone_number'];
    verifyOtpButton = json['verify_otp_button'];
    loginUsernamePassword = json['login_username_password'];
    forgotPasswordHeading = json['forgot_password_heading'];
    email = json['email'];
    sendButton = json['send_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['sub_title'] = subTitle;
    data['log_in'] = logIn;
    data['phone_numbe/email'] = phoneNumbeEmail;
    data['password'] = password;
    data['forgot_password'] = forgotPassword;
    data['login_button'] = loginButton;
    data['login/register_otp'] = loginRegisterOtp;
    data['phone_number'] = phoneNumber;
    data['verify_otp_button'] = verifyOtpButton;
    data['login_username_password'] = loginUsernamePassword;
    data['forgot_password_heading'] = forgotPasswordHeading;
    data['email'] = email;
    data['send_button'] = sendButton;
    return data;
  }
}

class ServiceMenu {
  String? home;
  String? account;
  String? myBooking;
  String? myFavorites;
  String? notifications;
  String? changePassword;
  String? logout;
  String? support;

  ServiceMenu(
      {this.home,
        this.account,
        this.myBooking,
        this.myFavorites,
        this.notifications,
        this.changePassword,
        this.logout,
        this.support});

  ServiceMenu.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    account = json['account'];
    myBooking = json['my_booking'];
    myFavorites = json['my_favorites'];
    notifications = json['notifications'];
    changePassword = json['change_password'];
    logout = json['logout'];
    support = json['Support'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['account'] = account;
    data['my_booking'] = myBooking;
    data['my_favorites'] = myFavorites;
    data['notifications'] = notifications;
    data['change_password'] = changePassword;
    data['logout'] = logout;
    data['Support'] = support;
    return data;
  }
}

class ServiceAccount {
  String? title;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? saveButton;
  String? heading;
  String? subTitle;

  ServiceAccount(
      {this.title,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.saveButton,
        this.heading,
        this.subTitle});

  ServiceAccount.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    saveButton = json['save_button'];
    heading = json['heading'];
    subTitle = json['sub_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['save_button'] = saveButton;
    data['heading'] = heading;
    data['sub_title'] = subTitle;
    return data;
  }
}

class SeviceChangePassword {
  String? title;
  String? heading;
  String? subTitle;
  String? previousPassword;
  String? newPassword;
  String? changePassword;
  String? saveButton;

  SeviceChangePassword(
      {this.title,
        this.heading,
        this.subTitle,
        this.previousPassword,
        this.newPassword,
        this.changePassword,
        this.saveButton});

  SeviceChangePassword.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    heading = json['heading'];
    subTitle = json['sub_title'];
    previousPassword = json['previous_password'];
    newPassword = json['new_password'];
    changePassword = json['change_password'];
    saveButton = json['save_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['heading'] = heading;
    data['sub_title'] = subTitle;
    data['previous_password'] = previousPassword;
    data['new_password'] = newPassword;
    data['change_password'] = changePassword;
    data['save_button'] = saveButton;
    return data;
  }
}

class ServiceMyBooking {
  String? title;
  String? menu1;
  String? menu2;
  String? menu3;

  ServiceMyBooking({this.title, this.menu1, this.menu2, this.menu3});

  ServiceMyBooking.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    menu1 = json['menu_1'];
    menu2 = json['menu_2'];
    menu3 = json['menu_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['menu_1'] = menu1;
    data['menu_2'] = menu2;
    data['menu_3'] = menu3;
    return data;
  }
}

class ServiceEditReview {
  String? title;
  String? heading;
  String? subTitle;
  String? giveRatings;
  String? review;
  String? sendReviewButton;

  ServiceEditReview(
      {this.title,
        this.heading,
        this.subTitle,
        this.giveRatings,
        this.review,
        this.sendReviewButton});

  ServiceEditReview.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    heading = json['heading'];
    subTitle = json['sub_title'];
    giveRatings = json['give_ratings'];
    review = json['review'];
    sendReviewButton = json['send_review_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['heading'] = heading;
    data['sub_title'] = subTitle;
    data['give_ratings'] = giveRatings;
    data['review'] = review;
    data['send_review_button'] = sendReviewButton;
    return data;
  }
}

class ServiceDetail {
  String? description;
  String? galleries;
  String? serviceProvider;
  String? reviewRatings;
  String? bookThisServiceButton;

  ServiceDetail(
      {this.description,
        this.galleries,
        this.serviceProvider,
        this.reviewRatings,
        this.bookThisServiceButton});

  ServiceDetail.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    galleries = json['galleries'];
    serviceProvider = json['Service_provider'];
    reviewRatings = json['review_ratings'];
    bookThisServiceButton = json['book_this_service_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['galleries'] = galleries;
    data['Service_provider'] = serviceProvider;
    data['review_ratings'] = reviewRatings;
    data['book_this_service_button'] = bookThisServiceButton;
    return data;
  }
}

class ServiceBookTheService {
  String? title;
  String? yourAddress;
  String? chooseLocation;
  String? hint;
  String? coupon;
  String? asSoonAs;
  String? scheduleOrder;
  String? continueButton;
  String? preBooking;

  ServiceBookTheService(
      {this.title,
        this.yourAddress,
        this.chooseLocation,
        this.hint,
        this.coupon,
        this.asSoonAs,
        this.scheduleOrder,
        this.continueButton,
        this.preBooking});

  ServiceBookTheService.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    yourAddress = json['your_address'];
    chooseLocation = json['choose_location'];
    hint = json['hint'];
    coupon = json['coupon'];
    asSoonAs = json['as_soon_as'];
    scheduleOrder = json['schedule_order'];
    continueButton = json['continue_button'];
    preBooking = json['pre_booking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['your_address'] = yourAddress;
    data['choose_location'] = chooseLocation;
    data['hint'] = hint;
    data['coupon'] = coupon;
    data['as_soon_as'] = asSoonAs;
    data['schedule_order'] = scheduleOrder;
    data['continue_button'] = continueButton;
    data['pre_booking'] = preBooking;
    return data;
  }
}

class ServiceBookDetails {
  String? title;
  String? paymentSummary;
  String? address;
  String? totalPrice;
  String? bookNowButton;

  ServiceBookDetails(
      {this.title,
        this.paymentSummary,
        this.address,
        this.totalPrice,
        this.bookNowButton});

  ServiceBookDetails.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    paymentSummary = json['payment_summary'];
    address = json['address'];
    totalPrice = json['total_price'];
    bookNowButton = json['book_now_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['payment_summary'] = paymentSummary;
    data['address'] = address;
    data['total_price'] = totalPrice;
    data['book_now_button'] = bookNowButton;
    return data;
  }
}

class ServiceBookingConformation {
  String? title;
  String? thankyou;
  String? bookingSuccessfully;
  String? description;
  String? homepageButton;

  ServiceBookingConformation(
      {this.title,
        this.thankyou,
        this.bookingSuccessfully,
        this.description,
        this.homepageButton});

  ServiceBookingConformation.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thankyou = json['thankyou'];
    bookingSuccessfully = json['booking_successfully'];
    description = json['description'];
    homepageButton = json['homepage_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['thankyou'] = thankyou;
    data['booking_successfully'] = bookingSuccessfully;
    data['description'] = description;
    data['homepage_button'] = homepageButton;
    return data;
  }
}

class ProviderLocation {
  String? selectLocation;
  String? discription;
  String? address;
  String? addressButton;
  String? locateme;

  ProviderLocation(
      {this.selectLocation,
        this.discription,
        this.address,
        this.addressButton,
        this.locateme});

  ProviderLocation.fromJson(Map<String, dynamic> json) {
    selectLocation = json['select_location'];
    discription = json['discription'];
    address = json['address'];
    addressButton = json['address_button'];
    locateme = json['locateme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['select_location'] = selectLocation;
    data['discription'] = discription;
    data['address'] = address;
    data['address_button'] = addressButton;
    data['locateme'] = locateme;
    return data;
  }
}

class ServiceBookingCompleted {
  String? paynowButton;
  String? contactUs;
  String? paymentSummary;
  String? serviceCompleted;

  ServiceBookingCompleted(
      {this.paynowButton,
        this.contactUs,
        this.paymentSummary,
        this.serviceCompleted});

  ServiceBookingCompleted.fromJson(Map<String, dynamic> json) {
    paynowButton = json['paynow_button'];
    contactUs = json['contact_us'];
    paymentSummary = json['payment_summary'];
    serviceCompleted = json['service_completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paynow_button'] = paynowButton;
    data['contact_us'] = contactUs;
    data['payment_summary'] = paymentSummary;
    data['service_completed'] = serviceCompleted;
    return data;
  }
}

class Review {
  String? title;
  String? reviewButton;

  Review({this.title, this.reviewButton});

  Review.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    reviewButton = json['review_button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['review_button'] = reviewButton;
    return data;
  }
}

class ServiceProviderView {
  String? contact;
  String? description;
  String? serviceListName;
  String? reviews;

  ServiceProviderView(
      {this.contact, this.description, this.serviceListName, this.reviews});

  ServiceProviderView.fromJson(Map<String, dynamic> json) {
    contact = json['Contact'];
    description = json['Description'];
    serviceListName = json['Service_list_name'];
    reviews = json['Reviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Contact'] = contact;
    data['Description'] = description;
    data['Service_list_name'] = serviceListName;
    data['Reviews'] = reviews;
    return data;
  }
}

class MailVerification {
  String? heading;
  String? button1;
  String? button2;
  String? content;

  MailVerification({this.heading, this.button1, this.button2, this.content});

  MailVerification.fromJson(Map<String, dynamic> json) {
    heading = json['heading'];
    button1 = json['button1'];
    button2 = json['button2'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['heading'] = heading;
    data['button1'] = button1;
    data['button2'] = button2;
    data['content'] = content;
    return data;
  }
}

class Support {
  String? title;
  String? heading;
  String? subTitle;
  String? message;
  String? button;

  Support({this.title, this.heading, this.subTitle, this.message, this.button});

  Support.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    heading = json['heading'];
    subTitle = json['sub_title'];
    message = json['message'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['heading'] = heading;
    data['sub_title'] = subTitle;
    data['message'] = message;
    data['button'] = button;
    return data;
  }
}

class CurrencyData {
  String? currencyId;
  String? entity;
  String? currency;
  String? symbol;
  String? alphabeticCode;
  String? numericCode;
  String? minorUnit;
  String? createdAt;
  String? updated;

  CurrencyData(
      {this.currencyId,
        this.entity,
        this.currency,
        this.symbol,
        this.alphabeticCode,
        this.numericCode,
        this.minorUnit,
        this.createdAt,
        this.updated});

  CurrencyData.fromJson(Map<String, dynamic> json) {
    currencyId = json['currency_id'];
    entity = json['entity'];
    currency = json['currency'];
    symbol = json['symbol'];
    alphabeticCode = json['alphabetic_code'];
    numericCode = json['numeric_code'];
    minorUnit = json['minor_unit'];
    createdAt = json['created_at'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency_id'] = currencyId;
    data['entity'] = entity;
    data['currency'] = currency;
    data['symbol'] = symbol;
    data['alphabetic_code'] = alphabeticCode;
    data['numeric_code'] = numericCode;
    data['minor_unit'] = minorUnit;
    data['created_at'] = createdAt;
    data['updated'] = updated;
    return data;
  }
}
