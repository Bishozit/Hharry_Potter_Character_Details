import 'package:flutter/material.dart';
import 'package:harry_potter_character_details/character_detail_screen.dart';
import 'package:http/http.dart' as http; 
import 'dart:convert';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Harry Potter Characters', style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchCharacters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else {
            List<dynamic> characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    width: 80, 
                    height: 60, 
                    child: CircleAvatar(
                       backgroundImage: NetworkImage(characters[index]['image']),
                    ),
                  ),
                  title: Text(characters[index]['name'], style: const TextStyle(color: Colors.white, fontSize: 20)),
                  subtitle: Text('Actor: ${characters[index]['actor']}', style: const TextStyle(color: Colors.white, fontSize: 15)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CharacterDetailScreen(character: characters[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

Future<List<dynamic>> fetchCharacters() async {
  final response = await http.get(Uri.parse('https://hp-api.onrender.com/api/characters'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load characters');
  }
}
