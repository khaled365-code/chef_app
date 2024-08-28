

class LocalNotificationsModel
{
  final int id;
  final String title;
  final String body;
  final String? image;
  final String? payload;
  final String? sound;

  LocalNotificationsModel(this.payload, this.sound, {required this.id, required this.title, required this.body,this.image});

}