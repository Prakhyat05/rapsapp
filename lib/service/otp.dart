import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

const serviceURL = "https://rapsappcloudrun-614929701525.asia-northeast1.run.app";
Future<bool> requestOTP() async {
  var resp = await http.get(Uri.parse("$serviceURL/generate_otp"), headers: {
    "Authorization":
        "Bearer ${(await FirebaseAuth.instance.currentUser?.getIdTokenResult())?.token ?? ""}"
  });
  print(resp.body);
  return resp.statusCode == 200;
}

Future<bool> submitOTP(String otp) async {
  var request =
      http.Request("GET", Uri.parse("$serviceURL/submit_otp?otp=$otp"));
  request.headers["Authorization"] =
      "Bearer ${(await FirebaseAuth.instance.currentUser?.getIdTokenResult())?.token ?? ""}";
  print(request.toString());
  var resp = await request.send();
  return resp.statusCode == 200;
}
