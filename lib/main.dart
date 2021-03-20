import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(new MaterialApp(
  theme: new ThemeData(
    colorScheme: ColorScheme.light(
      background: Colors.amber,

    )
  ),
  home: new HomePage(),
),
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("LOAD JSON DATA"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future : DefaultAssetBundle.
            of(context).
            loadString('load_json/person.json'),

            builder:(context, snapshot){
              // DECODE THE JSON
                var myData = JsonDecoder().convert(snapshot.data.toString());
                return new ListView.builder(itemBuilder:(BuildContext context,int index){
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:<Widget>[
                        new Text("NAME : "+myData[index]['name']),
                        new Text("HEIGHT : "+myData[index]['height']),
                        new Text("AGE : "+myData[index]['age']),
                        new Text("GENDER : "+myData[index]['gender']),
                        new Text("COLOR : "+myData[index]['color']),
                      ],
                    ),
                  );
                },
                  itemCount: myData== null?0 : myData.length,
                );
            },
          ),
        ),
      ),
    );
  }
}
