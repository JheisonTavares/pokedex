import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_pokedex/common/consts/api_consts.dart';
import 'package:flutter_pokedex/common/errors/failure.dart';

import '../models/pokemon.dart';
abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}
class PokemonRepository implements IPokemonRepository {
  final Dio dio;
  PokemonRepository({required this.dio});
@override
  Future<List<Pokemon>> getAllPokemons() async{
    try {
      final response = await dio.get(ApiConsts.apiAllPokemons);
  final json = jsonDecode(response.data) as Map<String, dynamic>;
  final list = json ['pokemon'] as List<dynamic>;
  return list.map ((e)=>Pokemon.fromMap(e)).toList();
  }catch (e) {
    throw Failure(message: 'Erro ao buscar dados');
  }
  }
}