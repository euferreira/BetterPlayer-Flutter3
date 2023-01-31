import 'package:better_player_awesome/better_player.dart';
import 'package:better_player_awesome_example/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NormalPlayerPage extends StatefulWidget {
  @override
  _NormalPlayerPageState createState() => _NormalPlayerPageState();
}

class _NormalPlayerPageState extends State<NormalPlayerPage> {
  late BetterPlayerController _betterPlayerController;
  late BetterPlayerDataSource _betterPlayerDataSource;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: true,
      looping: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp
      ],
    );
    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      //Constants.forBiggerBlazesUrl,
      "https://videoaulas.infra.grancursosonline.com.br/564afe295161b94c3dcc76ab8ec071b3/83058c07fde4c7d8505b742f96e3fcfe/83058c07fde4c7d8505b742f96e3fcfe-p480.mp4?Expires=1675276738&Signature=hSL92XX9rfzGywzc9f0AXo228JMgg-YxMmt3QGuEUv1GItnMP0opr1aE0uS76qYgwECO~7FsLqmOxh16vOVk3VJSedZBNJcQNbJxNmASMOFTBPuqFllAAzDn~f1Tr86ATZGdHHodM4WVRDC0znM6GSuE1yjP9LJpJ1XABeNn0dt8VNDsW9-z7CPQUNCSbq7TUKy4fkgbfm1hHlAPpISEx0RrSjhFULMPA6zAt2fxS8jrGxRKTNdYqZprPPMtKBgev7cuc86nGoYiY7z53PNO5ls0myuabus-OdQMJJZxrwJgCfm7TPdNxfdnqFQ8s~Yn8QWJ2eEUp5Dc9NnA8POloA__&Key-Pair-Id=APKAJWDRH5QWMLF2KNSA"
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(_betterPlayerDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Normal player page"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(controller: _betterPlayerController),
          ),
        ],
      ),
    );
  }
}
