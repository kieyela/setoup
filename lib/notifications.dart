import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget{
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<String> notifications = [
    "John a commenté votre publication.",
    "Votre commande a été expédiée.",
    "Jane vous a invité à sa fête d'anniversaire.",
    "Vous avez un nouveau follower.",
    "Votre abonnement est sur le point d'expirer.",
    "Vous avez un nouveau message de Sarah.",
    "Le mot de passe de votre compte a été réinitialisé.",
    "Votre ami Mark vient de rejoindre la plateforme.",
    "Votre publication a été partagée par Emily.",
    "Vous avez été mentionné dans un commentaire par Tom."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(notifications[index]),
            subtitle: Text(DateTime.now().toString()),
            leading: Icon(Icons.notifications),
            onTap: () {
              // TODO: Implement the notification detail page.
            },
          );
        },
      ),
    );
  }
}
