import 'dart:io';

import 'package:api_demo/models/game_model.dart';
import 'package:http/http.dart' as http;

class GameRepository {
  static Future<List<GameModel>> getGames() async {
    try {
      var url = "https://www.freetogame.com/api/games";
      var res = await http.get(Uri.parse(url), headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      });
      if (res.statusCode == 200) {
        return gameModelFromJson(res.body);
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
