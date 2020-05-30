import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GET',
      home: RandomWords(),
    );
  }
}
//Alamacena los datos en el estado
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords>{

  final _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Lista infinita'
          )),
        body:_buildSuggeestions(),
      );
  }

  Widget _buildSuggeestions(){
    return ListView.builder(
      itemBuilder: (context, i){
        if( i >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[i]);
      });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase),
    );
  }
          
}
