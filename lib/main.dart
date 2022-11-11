import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  get mainAxisAlignment => null;

  get floatingActionButton => null;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var stringflutter = 'Это моё приложение на Fluffer!';
    if (_counter % 2 == 0){
      stringflutter= 'Это моё приложение на Fluffer!';
    }
    else {
      stringflutter = 'Это крутой котик';
    }
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 20, bottom:0, left:0, right:0)),
          Row(mainAxisAlignment: MainAxisAlignment.start,
              children:[Text(stringflutter, style: TextStyle(fontSize: 16)),]),
          const Padding(padding: EdgeInsets.only(top: 20, bottom:0, left:0, right:0)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(onPressed: () async
            {
              Uri url1 = Uri.parse('https://github.com/katerinakarpenkova/lab_4');
              if (await canLaunchUrl(url1)){
                await launchUrl(url1);
              } else {
                throw 'Could not launch $url1';
              }
            },
                child: Text("Перейти на гит", style: TextStyle(fontSize: 16),),
                style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor: MaterialStateProperty.all(Colors.grey))
            )],),
          const Padding(padding: EdgeInsets.only(top: 20, bottom:0, left:0, right:0)),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: () async
              {
                Uri url2 = Uri.parse('https://smolgu.ru/');
                if (await canLaunchUrl(url2)){
                  await launchUrl(url2);
                } else {
                  throw 'Could not launch $url2';
                }
              },
                  child: Text("Перейти на сайт СмолГУ!", style: TextStyle(fontSize: 16),),
                  style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.black),
                      backgroundColor: MaterialStateProperty.all(Colors.grey))
              )],),

        ],
      ),


      floatingActionButton:
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: const EdgeInsets.only(bottom: 42.0),
                height: 288,
                width: 288,
                child: FloatingActionButton.large(onPressed: _incrementCounter,
                    child: Image.asset("assets/images/cat.png"))
            ),
          )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
