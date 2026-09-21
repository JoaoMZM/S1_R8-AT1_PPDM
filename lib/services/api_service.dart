import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = 'https://api.demonlist.org';
  static Future<List> getLevels() async {
    final response = await http.get(Uri.parse('$apiUrl/level/classic/list'));
    if (response.statusCode != 200) {
      return [];
    }
    Map responseBody = jsonDecode(response.body);

    List levelsList = responseBody["data"]["levels"];
    print(levelsList);
    print(response.body);
    return levelsList;
  }

  static Future<List> getUsers() async {
    final response = await http.get(Uri.parse('$apiUrl/leaderboard/user/list'));
    if (response.statusCode != 200) {
      return [];
    }
    Map responseBody = jsonDecode(response.body);

    List levelsList = responseBody["data"]["users"];
    
    print(levelsList);
    print(response.body);
    return levelsList;
  }

  static Future<List> getCountries() async {
    final response = await http.get(
      Uri.parse('$apiUrl/leaderboard/country/list?type=main'),
    );
    if (response.statusCode != 200) {
      return [];
    }
    Map responseBody = jsonDecode(response.body);

    List levelsList = responseBody["data"]["countries"];
    
    print(levelsList);
    print(response.body);
    return levelsList;
  }
}
