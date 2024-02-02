import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  // create an instance of Firebase Messaging
  final firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize notification

  Future<void> initNotification() async {
    // ask permission from user
    firebaseMessaging.requestPermission();

    // fetch the FOM token for unique devices
    // ignore: unused_local_variable
    final fetchFCMToken = await firebaseMessaging.getToken();

    // print token(send to server)
    // print(fetchFCMToken);
  }

  String updateNotification =
      'There is an update. Please update to the latest version to enjoy new features.';

  // function to handle recieved notification
  void handleNotitfication(RemoteMessage? message) {
    // message from notification is null
    // if (message!.data.containsValue(updateNotification)) {
    //   return Navigator.currentState
    //       ?.pushNamed('/[Name of the destination screen]', argument: message);
    // }

    //navigate to new screen.
    // navigatorKey.currentState
    //     ?.pushNamed('/[Name of the destination screen]', argument: message);
  }
}
