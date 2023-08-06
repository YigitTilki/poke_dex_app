import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_dex_app/constant/ui_helper.dart';
import 'package:poke_dex_app/model/pokemon_model.dart';

class PokeImgandBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImgandBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeBallImgUrl = "images/pokeball.png";
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeBallImgUrl,
            width: UIHelper.calculatePokeImgandBallSize(),
            height: UIHelper.calculatePokeImgandBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? "",
              errorWidget: (context, url, error) => Image.asset(pokeBallImgUrl),
              width: UIHelper.calculatePokeImgandBallSize(),
              height: UIHelper.calculatePokeImgandBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
