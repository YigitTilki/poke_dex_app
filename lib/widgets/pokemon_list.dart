import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poke_dex_app/constant/ui_helper.dart';
import 'package:poke_dex_app/widgets/pokelist_item.dart';
import '../model/pokemon_model.dart';
import '../services/pokedex_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> myList = snapshot.data!;

          return GridView.builder(
            itemCount: myList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: UIHelper.pokeListItemDesigner()),
            itemBuilder: (context, index) {
              return PokeListItem(
                pokemon: myList[index],
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Hata Çıktı"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
