// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_pokedex/features/pokedex/screens/details/pages/detail_page.dart';

// import '../../../../../common/errors/failure.dart';
// import '../../../../../common/models/pokemon.dart';
// import '../../../../../common/repositories/pokemon_repository.dart';
// import '../../../../../shared/page_error.dart';
// import '../../../../../shared/page_loading.dart';

// class DetailContainer extends StatefulWidget {
//    const DetailContainer({super.key, required PokemonRepository repository});

//   @override
//   State<DetailContainer> createState() => _DetailContainer();
// }

// class _DetailContainer extends State<DetailContainer> {
//  late Future<List<Pokemon>> futureName;

//  @override
//   void initState() {
//     super.initState();
//     futureName = PokemonRepository(dio: Dio()).getAllPokemons();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
// return Scaffold(
//   appBar: AppBar(title: const Text("Details"),),
//   body: FutureBuilder<List<Pokemon>>(
//     future: futureName,
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const PageLoading();}
//         else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('Nenhum Pokémon encontrado'));
//           }
//       if ( snapshot.connectionState == ConnectionState.done &&
//       snapshot.hasData) {
//         return const DetailPage(pokemon: settings.arguments as Pokemon,);
//       }

//       if (snapshot.hasError) {
//         return PageError(error: (snapshot.error as Failure).message!,
//         );
//       }

//       return Container();
//     }
//   ), 
// );
//   }
//   }
