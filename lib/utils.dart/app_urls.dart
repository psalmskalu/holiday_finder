class AppUrl {
  static const String liveBaseURL = "https://ashpotmicrosystems.com/holidays";
  static const String localBaseURL = "http://10.0.2.2:4000/api/v1";

  static const String baseURL = liveBaseURL;

  static const String holiday = baseURL + "/get_holiday.php";
  static const String holidays = baseURL + "/load_all_holidays.php";
  static const String week = baseURL + "/get_week.php";
}
