import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Map<String, dynamic> character;

  const CharacterDetailScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(character['name'], style: const TextStyle(color: Colors.white, fontSize: 40),),
        iconTheme: const IconThemeData(color: Colors.white, size: 40),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(character['image']),
            const SizedBox(height: 20),
            Text('Actor: ${character['actor']}', style: const TextStyle(color: Colors.white, fontSize: 45), ),
            Text('House: ${character['house']}', style: const TextStyle(color: Colors.white, fontSize: 35),),
            Text('Species: ${character['species']}', style: const TextStyle(color: Colors.white, fontSize: 35),),
            Text('Gender: ${character['gender']}', style: const TextStyle(color: Colors.white, fontSize: 35),),
            Text('Date of Birth: ${character['dateOfBirth']}', style: const TextStyle(color: Colors.white, fontSize: 35),),
          ],
        ),
      ),
    );
  }
}