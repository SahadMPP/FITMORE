import 'dart:convert';
import 'package:e_commerce/Widgets/favorite_card.dart';
import 'package:e_commerce/data_base/function/favorite_function.dart';
import 'package:e_commerce/data_base/models/favorite/favorite_model.dart';
import 'package:e_commerce/user_functions/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    favoritee.getAllFavorite();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle('Favorite'),
      body: ValueListenableBuilder(
        valueListenable: favoriteNotifier,
        builder: (BuildContext context, List<FavoriteModel> favoriteList,
            Widget? child) {
          if (favoriteList.isEmpty) {
            return const Center(
              child: SizedBox(
                height: 350,
                width: 400,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('asset/download favoriteEmpty.png'),
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: favoriteList.length,
            itemBuilder: (context, index) {
              final data = favoriteList[index];
              final base64Image = data.image;
              final imagebytes = base64.decode(base64Image);
              GlobalKey<FormState> formkey = GlobalKey<FormState>();
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 130,
                  child: ValueListenableBuilder(
                    valueListenable:
                        Hive.box<FavoriteModel>('favorite_db').listenable(),
                    builder: (context, box, child) {
                      return Dismissible(
                        key: formkey,
                        onDismissed: (direction) async {
                          setState(() {
                            favoriteList.removeAt(index);
                          });
                          await box.delete(data.id);
                          // favoritee.deleteFavorite(data.id!);
                        },
                        direction: DismissDirection.endToStart,
                        background: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 280),
                            child: Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 248, 55, 41),
                            ),
                          ),
                        ),
                        child: FavoriteCard(
                            imagebytes: imagebytes, data: data, index: index),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
