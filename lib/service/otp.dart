import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

const serviceURL = "https://rapsappcloudrun-ox5d5ypjpa-an.a.run.app";
Future<bool> requestOTP() async {
  var resp = await http.get(Uri.parse("$serviceURL/generate_otp"), headers: {
    "Authorization":
        "Bearer ${(await FirebaseAuth.instance.currentUser?.getIdTokenResult())?.token ?? ""}"
  });
	return resp.statusCode == 200;
}

Future<bool> submitOTP(String otp) async {
  var resp =
      await http.get(Uri.parse("$serviceURL/submit_otp?otp=$otp"), headers: {
    "Authorization":
        "Bearer ${(await FirebaseAuth.instance.currentUser?.getIdTokenResult())?.token ?? ""}"
  });
  return resp.statusCode == 200;
}
