import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {
  //tambah data
  static Future<dynamic> tambahData(
      String url, String nama, String deskripsi) async {
    FormData formData =
        FormData.fromMap({"nama": nama, "deskripsi": deskripsi});
    Dio dio = Dio();
    if (kDebugMode) {
      print("DATA END POINT : $url");
    }
    final response = await dio.post(url, data: formData);
    if (kDebugMode) {
      print("DATARESPONSE STATUS : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("DATA RESPONSE BENAR : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  //get data

  static Future<dynamic> getData(String url) async {
    Dio dio = Dio();
    if (kDebugMode) {
      print("DATA END POINT : $url");
    }
    final response = await dio.get(url);
    if (kDebugMode) {
      print("DATARESPONSE STATUS : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("DATA RESPONSE BENAR : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  //ubah data

  static Future<dynamic> ubahData(
      String url, int id, String nama, String deskripsi) async {
    FormData formData =
        FormData.fromMap({"id": id, "nama": nama, "deskripsi": deskripsi});
    Dio dio = Dio();
    if (kDebugMode) {
      print("DATA END POINT : $url");
    }
    final response = await dio.post(url, data: formData);
    if (kDebugMode) {
      print("DATA RESPONSE STATUS : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("DATA RESPONSE BENAR : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  //ubah history
  static Future<dynamic> ubahDataHistory(String url, int id) async {
    FormData formData = FormData.fromMap({"id": id});
    Dio dio = Dio();
    if (kDebugMode) {
      print("DATA END POINT : $url");
    }
    final response = await dio.post(url, data: formData);
    if (kDebugMode) {
      print("DATARESPONSE STATUS : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("DATA RESPONSE BENAR : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  //buat hapus Data
  static Future<dynamic> hapusData(String url, int id) async {
    FormData formData = FormData.fromMap({"id": id});
    Dio dio = Dio();
    if (kDebugMode) {
      print("DATA END POINT : $url");
    }
    final response = await dio.post(url, data: formData);
    if (kDebugMode) {
      print("DATARESPONSE STATUS : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("DATA RESPONSE BENAR : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }
}
