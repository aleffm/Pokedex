import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/nav_cubit.dart';
import 'constants.dart';

class PokedexView extends StatelessWidget {

  final pokeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aleff Poakedex'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding/4),
            decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: kDefaultPadding/4,),
                        Expanded(
                            child: TextFormField(
                              controller: pokeController,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 1,
                              style: TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                  labelText: "Pokemon",
                                  hintText: "Nome ou Id",border: InputBorder.none),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _getButtomSearch(context),
            ],
          ),
        ],
      ),
    );
  }

  _getButtomSearch(BuildContext) => Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: OutlinedButton(
          onPressed: () => BlocProvider.of<NavCubit>(BuildContext)
              .showPokemonDetails(pokeController.text),
          child: Text("Search")
      ),
    ),
  );
}
