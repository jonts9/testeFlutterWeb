import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class PushInput {
  String title;
  String msg;
  String token;

}

class PushApi {
  static push(PushInput input) async {
    final url = "https://fcm.googleapis.com/fcm/send";

    final params = {
      "notification": {
        "title": input.title,
        "body": input.msg,
        "priority": "high"
      },
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done",
        "msg": "Firebase muito legal"
      },
      "registration_ids": [
        input.token
      ]
    };

    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Key=AAAAVjLTp0M:APA91bHyv5Q68MTnGs5rXENHjBc5R-Iu1Fs1X4e5e1UeR_8ZWEE35YxLWZilG4jMtdU52Ay5V0Pl1HVh_RU93oFptcaxtfsHDsi5u2Ul1DkCUnaS5xjOVrphbQks7lM_uid_f2bwOuji"
    };

    print("> Login POST: $url");
    print("> Params: $params");

    String json = convert.json.encode(params);

    final response = await http.post(
      url, body: json, headers: headers,);

    print("> ${response.body}");
  }
}