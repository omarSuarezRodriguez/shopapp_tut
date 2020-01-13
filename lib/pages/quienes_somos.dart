import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:shopapp_tut/home_page.dart';

void main() {
  runApp(
    ChewieDemo(),
  );
}

class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.title = 'Quienes Somos'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 =
        VideoPlayerController.asset('videos/IntroVideo.mp4');
    _videoPlayerController2 = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/480/asdasdas.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.red, //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Desactivar Banner
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        appBar: AppBar(
          //Con esta configuración podemos implementar boton para atras en AppBar
          automaticallyImplyLeading: true,
          backgroundColor: Colors.red,
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
//          actions: <Widget>[
//            // action button
//
//          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Chewie(
                    controller: _chewieController,
                  ),
                ),
              ),
//            FlatButton(
//              onPressed: () {
//                _chewieController.enterFullScreen();
//              },
//              child: Text('Fullscreen'),
//            ),
//            Row(
//              children: <Widget>[
//                Expanded(
//                  child: FlatButton(
//                    onPressed: () {
//                      setState(() {
//                        _chewieController.dispose();
//                        _videoPlayerController2.pause();
//                        _videoPlayerController2.seekTo(Duration(seconds: 0));
//                        _chewieController = ChewieController(
//                          videoPlayerController: _videoPlayerController1,
//                          aspectRatio: 3 / 2,
//                          autoPlay: true,
//                          looping: true,
//                        );
//                      });
//                    },
//                    child: Padding(
//                      child: Text("Video 1"),
//                      padding: EdgeInsets.symmetric(vertical: 16.0),
//                    ),
//                  ),
//                ),
//                Expanded(
//                  child: FlatButton(
//                    onPressed: () {
//                      setState(() {
//                        _chewieController.dispose();
//                        _videoPlayerController1.pause();
//                        _videoPlayerController1.seekTo(Duration(seconds: 0));
//                        _chewieController = ChewieController(
//                          videoPlayerController: _videoPlayerController2,
//                          aspectRatio: 3 / 2,
//                          autoPlay: true,
//                          looping: true,
//                        );
//                      });
//                    },
//                    child: Padding(
//                      padding: EdgeInsets.symmetric(vertical: 16.0),
//                      child: Text("Error Video"),
//                    ),
//                  ),
//                )
//              ],
//            ),
//            Row(
//              children: <Widget>[
//                Expanded(
//                  child: FlatButton(
//                    onPressed: () {
//                      setState(() {
//                        _platform = TargetPlatform.android;
//                      });
//                    },
//                    child: Padding(
//                      child: Text("Android controls"),
//                      padding: EdgeInsets.symmetric(vertical: 16.0),
//                    ),
//                  ),
//                ),
//                Expanded(
//                  child: FlatButton(
//                    onPressed: () {
//                      setState(() {
//                        _platform = TargetPlatform.iOS;
//                      });
//                    },
//                    child: Padding(
//                      padding: EdgeInsets.symmetric(vertical: 16.0),
//                      child: Text("iOS controls"),
//                    ),
//                  ),
//                )
//              ],
//            )
            ],
          ),
        ),
      ),
    );
  }
}

//import 'chewie_list_item.dart';
//import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(),
//    );
//  }
//}
//
//class MyHomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Video Player'),
//      ),
//      body: ListView(
//        children: <Widget>[
//          ChewieListItem(
//            videoPlayerController: VideoPlayerController.asset(
//              'videos/IntroVideo.mp4',
//            ),
//            looping: true,
//          ),
//        ],
//      ),
//    );
//  }
//}
