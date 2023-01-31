import 'package:better_player_awesome/better_player.dart';
import 'package:better_player_awesome_example/constants.dart';
import 'package:better_player_awesome_example/utils.dart';
import 'package:flutter/material.dart';

class BasicPlayerPage extends StatefulWidget {
  @override
  _BasicPlayerPageState createState() => _BasicPlayerPageState();
}

class _BasicPlayerPageState extends State<BasicPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic player"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Basic player created with the simplest factory method. Shows video from URL.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer.network(
              Constants.forBiggerBlazesUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Next player shows video from file.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 8),
          FutureBuilder<String>(
            future: Utils.getFileUrl(Constants.fileTestVideoUrl),
            //future: Utils.getFileUrl("https://videoaulas.infra.grancursosonline.com.br/564afe295161b94c3dcc76ab8ec071b3/b859d03e9fec41dc9dd5ac0cbf6b1a51/b859d03e9fec41dc9dd5ac0cbf6b1a51-p480.mp4?Expires=1675276829&Signature=ZZzh2NgoRv~7OvchUxUH3mGKdHOSYDEw7jTJlEoVn6Xvk-1PfclGH2vQ-6XqK42qULqTD39a2ah9fa20K7mr5ckjggyAMqkOboWa41CFXdRvrIw3I6X6Oow1luVOHrO4YqhT4XNsJg6aStcJwhTj-EkH4iIoOY0vXHhV8v9MuA6R4T2UCuPb-ot~qsze8kHBtjXfNHMZmxKI0EUVKGCAetB-W3gZX2J3FtyI9axKLUuJ6lMud1e7LFfeF2m4Onx2MkJujiHdHN1Le72HlF7TO2e1lUmtr0En9NTvmrwgZYT-dg6zPLey~DfVM9MyWqD6PbFkyQ8k4tvo5usxSYuL8g__&Key-Pair-Id=APKAJWDRH5QWMLF2KNSA"),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              if (snapshot.data != null) {
                return BetterPlayer.file(snapshot.data!);
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
