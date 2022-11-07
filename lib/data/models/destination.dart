class Destination {
  int id ;
  String destinationName = "";
  double latitude = 0.0;
  double longitude = 0.0;
  DateTime createDateTime = DateTime.now();

  Destination(
      {required this.id,
      required this.destinationName,
      required this.latitude,
      required this.longitude,
      required this.createDateTime});
}
