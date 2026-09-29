import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = 'https://api.demonlist.org';
  static Future<List> getLevels(int limit, int offset) async {
    final response = await http.get(
      Uri.parse('$apiUrl/level/classic/list?limit=$limit&offset=$offset'),
    );
    if (response.statusCode != 200) {
      return [];
    }
    Map responseBody = jsonDecode(response.body);

    List levelsList = responseBody["data"]["levels"];

    return levelsList;
  }

  static Future<List> getUsers(int limit, int offset) async {
    final response = await http.get(
      Uri.parse('$apiUrl/leaderboard/user/list?limit=$limit&offset=$offset'),
    );
    if (response.statusCode != 200) {
      return [];
    }
    Map responseBody = jsonDecode(response.body);

    List usersList = responseBody["data"]["users"];

    return usersList;
  }

  static Future<List> getCountries() async {
    final response = await http.get(
      Uri.parse('$apiUrl/leaderboard/country/list?type=main'),
    );
    if (response.statusCode != 200) {
      return [];
    }
    Map responseBody = jsonDecode(response.body);

    List contryList = responseBody["data"]["countries"];

    return contryList;
  }

  static Future<Map> getLevel(int id) async {
    final response = await http.get(
      Uri.parse('$apiUrl/level/classic/get?id=$id'),
    );
    if (response.statusCode != 200) {
      return {};
    }
    Map responseBody = jsonDecode(response.body);

    Map level = responseBody["data"];

    return level;
  }

  static Future<Map> getUser(int id) async {
    final response = await http.get(
      Uri.parse('$apiUrl/user/get?id=$id'),
    );
    if (response.statusCode != 200) {
      return {};
    }
    Map responseBody = jsonDecode(response.body);

    Map user = responseBody["data"];

    return user;
  }

  static Future<List> getRecords(int id) async {
    final response = await http.get(
      Uri.parse('$apiUrl/level/classic/record/list?level_id=$id'),
    );
    if (response.statusCode != 200) {
      return [];
    }
    Map responseBody = jsonDecode(response.body);

    List level = responseBody["data"]["records"];

    return level;
  }

  static Future<List> getFutureLevels() async {
    final response = await http.get(Uri.parse('$apiUrl/level/future/list'));
    if (response.statusCode != 200) {
      return [];
    }
    Map responseBody = jsonDecode(response.body);

    List levelsList = responseBody["data"]["levels"];

    return levelsList;
  }
}
