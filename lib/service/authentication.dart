//import 'package:service/common/constants/string.dart';

import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:service/service/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

enum WeekDays {
  monday, tuesday, wednesday, thursday, friday , saturday, sunday;
}

class AuthServices {
  static String? authToken;
  static final AuthServices _singleton = AuthServices._internal();

  factory AuthServices() {
    return _singleton;
  }

  AuthServices._internal();

  sync() {
    SharedPreferences.getInstance().then((pref) {
      if (authToken == null) {
        authToken = pref.getString("auth-token");
      } else {
        pref.setString("auth-token", authToken!);
      }
    });
  }

  logout() {
    authToken = null;
    SharedPreferences.getInstance().then((pref) {
      pref.remove("auth-token");
    });
  }

  final googleSignIn = GoogleSignIn();

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
    if (authToken == null) {
      return null;
    }
    return jsonDecode((await http.get(
            Uri.parse("${Globals.backendURL}/profile"),
            headers: {"Cookie": Cookie("auth-token", authToken!).toString()}))
        .body);
  }

  getUser() async {
    return jsonDecode((await http.get(Uri.parse("${Globals.backendURL}/users"),
            headers: {"Cookie": Cookie("auth-token", authToken!).toString()}))
        .body);
  }

  signInGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      await http.post(Uri.parse("${Globals.backendURL}/auth/google"),
          body: jsonEncode(
              {"credential": googleSignInAuthentication.accessToken}));
    }
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
      }),
    }, headers: {
      "Cookie": Cookie("auth-token", authToken!).toString()
    }))
            .body);
  }

  setProfilePhoto(File pic) async {
    return (await http.post(Uri.parse("${Globals.backendURL}/profile/photo"),
        headers: {"Cookie": Cookie("auth-token", authToken!).toString()},
        body: await pic.readAsBytes()));
  }

  addService(String name, int rate, List<WeekDays> workingDays, TimeOfDay workingHoursStart, TimeOfDay workingHoursEnd ) async {
    var internalWorkingDays = 0;
    for (final day in workingDays) {
      internalWorkingDays |= 1 << day.index;
    }
    return (await http.post(Uri.parse("${Globals.backendURL}/profile/services"),
        headers: {"Cookie": Cookie("auth-token", authToken!).toString()},
        body: jsonEncode({"name" : name, "rate": rate, "working_days": internalWorkingDays, "working_hours_start": workingHoursStart, "working_hours_end": workingHoursEnd })));
  }

  getServices() async {
    return jsonDecode((await http.get(Uri.parse("${Globals.backendURL}/profile/services"),
        headers: {"Cookie": Cookie("auth-token", authToken!).toString()}))
        .body);
  }

  getProfilePhoto(File pic) async {
    return (await http.get(Uri.parse("${Globals.backendURL}/profile/photo"),
            headers: {"Cookie": Cookie("auth-token", authToken!).toString()}))
        .bodyBytes;
  }

  Future<bool> checkOTP(String email, String otp) async {
    return (await http.post(Uri.parse("${Globals.backendURL}/auth/verify_otp"),
        headers: {"Cookie": Cookie("auth-token", authToken!).toString()}, body: jsonEncode(
            {"email": email, "otp": otp}))).statusCode == 200;
  }

  bool isSignedIn() {
    return authToken != null;
  }
}
