import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pokemon(),
    ));

class Pokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(child: Text('Kanto Pokemon Cries')),
      ),
      body: pokemonIcons(),
    );
  }
}

void playSound(String X){
  final player=AudioCache();
  player.play('$X.mp3');

}


Column pokemonEntry(
    {required String image,
    required Color divider,
    required String name,
    required String number,
    required String sound}) {
  return Column(
    children: [
      TextButton(
          onPressed: () {
            playSound(sound);
          },
          child: Image.asset('assets/$image.png', height: 100)),
      Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Container(
          width: 115,
          height: 2,
          color: divider,
        ),
      ),
      Text(
        '$name',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      Text('$number')
    ],
  );
}

class pokemonIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              pokemonEntry(image:'bulbasaur', divider: Colors.greenAccent,name: 'Bulbasaur',number: '#001',sound: 'bulbasaur'),
              pokemonEntry(image: 'charmander', divider: Colors.red.shade300, name: 'Charmander', number: '#004',sound: 'charmander')
            ],
          ),

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            pokemonEntry(image:'squirtle', divider: Colors.lightBlueAccent,name: 'Squirtle',number: '#007',sound: 'squirtle'),
            pokemonEntry(image: 'pikachu', divider: Colors.yellow.shade700, name: 'Pikachu', number: '#025',sound: 'pikachu')
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              pokemonEntry(image:'charizard', divider: Colors.red.shade300,name: 'Charizard',number: '#006',sound: 'charizard'),
              pokemonEntry(image: 'mewtwo', divider: Colors.deepPurpleAccent, name: 'Mewtwo', number: '#150',sound: 'mewtwo')
            ],
          ),
        ),
      ],
    );
  }
}
