//import 'package:service/common/constants/string.dart';

import 'dart:convert';
import 'dart:io';

import 'package:service/service/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static var authToken;
  sync() {
    SharedPreferences.getInstance().then((pref) {
      if (authToken == null) {
        authToken = pref.getString("auth-token");
      } else {
        pref.setString("auth-token", authToken);
      }
    });
  }

  signIn(String email, String password) async {
    var resp = await http.put(Uri.parse("${Globals.backendURL}/auth/sign_in"),
        body: jsonEncode({email: email, password: password}));
    var cookies = Cookie.fromSetCookieValue(resp.headers["set-cookie"]!);
    if (cookies.name == "auth-token") {
      authToken = cookies.value;
    }
  }

  signUp(String email, String password, String phone, String name) async {
    await http.post(Uri.parse("${Globals.backendURL}/auth/sign_up"),
        body: jsonEncode(
            {email: email, password: password, name: name, phone: phone}));
  }

  requestOTP(String email) async {
    await http.post(Uri.parse("${Globals.backendURL}/auth/new_otp"),
        body: jsonEncode({email: email}));
  }

  getProfile() async {
    return jsonDecode(
        (await http.get(Uri.parse("${Globals.backendURL}/profile"))).body);
  }

  createProfile(String adhaar, String city, String district, int pin_code,
      String town, String account_number, String branch, String ifsc) async {
    return jsonDecode(
        (await http.post(Uri.parse("${Globals.backendURL}/profile"), body: {
      jsonEncode({
        adhaar: adhaar,
        city: city,
        district: district,
        pin_code: pin_code,
        town: town,
        account_number: account_number,
        branch: branch,
        ifsc: ifsc,
      })
    }))
            .body);
  }

  bool isSignedIn() {
    return authToken != null;
  }
}
