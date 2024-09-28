import 'package:api_demo/models/game_model.dart';
import 'package:api_demo/repository/game_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool loadData = false;
  List<GameModel> listGame = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        setState(() {
          loadData = true;
        });
        listGame = await GameRepository.getGames();
        setState(() {
          loadData = false;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("List Game"),
        ),
        body: loadData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: listGame.length,
                padding: const EdgeInsets.all(15),
                itemBuilder: (BuildContext context, int index) {
                  var game = listGame[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          game.thumbnail,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Text(
                          game.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(game.shortDescription)
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
