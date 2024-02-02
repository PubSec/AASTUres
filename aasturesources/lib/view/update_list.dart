import 'package:aasturesources/consts/shimmer_effect.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart' as line;

// this view must work only if there is internet connection.
class MyUpdateListView extends StatefulWidget {
  const MyUpdateListView({super.key});

  @override
  State<MyUpdateListView> createState() => _MyUpdateListViewState();
}

class _MyUpdateListViewState extends State<MyUpdateListView> {
  late Future<ListResult> appUpdate;

  @override
  void initState() {
    appUpdate = FirebaseStorage.instance.ref('/app_update/').listAll();
    super.initState();
  }

  bool checkIfFirstTile({required int index}) {
    if (index == 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'App Updates',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const line.LineIcon.accusoft(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: appUpdate,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final app = snapshot.data!.items;
            return ListView.builder(
              itemCount: app.length,
              itemBuilder: (BuildContext context, int index) {
                final appFile = app[index];
                return Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                  ),
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text(
                      appFile.name,
                    ),
                    enabled: checkIfFirstTile(index: index),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
            );

            // if something happens this will be shown to the user
          } else if (snapshot.hasError) {
            return AlertDialog(
              title: const Text(
                'Unable to load',
                style: TextStyle(color: Colors.white),
              ),
              content: const Text(
                "An error has occured. The data can't be loaded.",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                )
              ],
            );
            // before the content loads this widget will show
          } else {
            return const ShimmerEffectView();
          }
        },
      ),
    );
  }
}
