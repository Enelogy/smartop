import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:smartop/models/m_produk.dart';

import '../shared/s_values.dart';

Future <List<mproduk>> getProduk() async {
  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // String id_mhs = sharedPreferences.getString('id_mhs')??"s";
  final response =
  await http.get( Uri.parse(base_url+'apiproduk'));
  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    List jsonResponse = map['data'];
    print(jsonResponse);


    return jsonResponse.map((data) => new mproduk.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}