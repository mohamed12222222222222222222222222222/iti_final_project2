import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class type {
  String name;
  String image;

  type(
      {required this.name,
        required this.image});
}
class categoriesScreen extends StatelessWidget
{
  Future<List<type>> fetchtypes() async {
    QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('type').get();

    return snapshot.docs
        .map((doc) => type(
      name: doc['name'],
      image: doc["image"],
    ))
        .toList();
  }
  Widget build(BuildContext context) {
    return FutureBuilder<List<type>>(
        future: fetchtypes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
                  color: Colors.indigoAccent,
                ));
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          List<type> types = snapshot.data!;
          return ListView.separated(
            itemBuilder:(context, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Image(
                      image: NetworkImage(types[index].image),
                      height: 70,
                      width: 100,
                      fit:BoxFit.cover,

                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: Text(
                        '${types[index].name}',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            } ,
            separatorBuilder: (context, index) => const Divider(),
            itemCount:types.length,
          );
          },
        );
    }
}