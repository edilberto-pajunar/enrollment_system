import 'package:web_school/values/strings/api/key.dart';

class TwilioApi {
  static String BASE_URL = "api.twilio.com";
  static Map<String, String> headers = {
    "Authorization": "Basic QUM0NjRmZmEyMGQ5NWVkY2ExZTU0Nzg3Mjc2NmY2OGViYjo4ODgxY2EyZGQ3MTAyNTRlNGYzOTU5NjI2MTYzZTA2Mw==",
  };

  static String path = "/";

  static String message = "${path}2010-04-01/Accounts/${ApiKey.twilioUsername}/Messages.json";

}