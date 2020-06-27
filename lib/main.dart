// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //final wordPair = WordPair.random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pestañita: Randoms Names',
      home: RandomWords(),
    );
  }
}

/*########################################*/
class RandomWords extends StatefulWidget {

  @override
  _RandomWordsState createState() {
    return _RandomWordsState();
  }
}

class _RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[]; //guarda las combinaciones de palabras
  final _biggerFont = TextStyle(fontSize: 18.0); 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {

    //Para trabajar con listas que contienen una gran cantidad de elementos, uso de ListView.builder
    //El constructor ListView.builder creará los elementos a medida que se desplazan por la pantalla.

    return ListView.builder(

        padding: EdgeInsets.all(16.0),
        
        itemBuilder: (context, i) {

          if (i.isOdd) return Divider(); //Si es impar, retorna Divider

          final index = i ~/ 2; 
          if (index >= _suggestions.length) { 

            _suggestions.addAll(generateWordPairs().take(2));
          }

          return _buildRow(_suggestions[index]); 
        }
    );
  }

  Widget _buildRow(WordPair pair) {

    return ListTile(

      title: Text(
        pair.asPascalCase, //String data
        style: _biggerFont, //Estilo
      ),
    );
  }
  
}
/*########################################*/