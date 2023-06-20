class ForcastModel {
  ForcastModel({
    //required this.description,
    required this.feelsLike,
    required this.humidity,
    required this.name,
    required this.temp,
    required this.windSpeed,
  });
  final String name;
  final double temp;
  final double windSpeed;
  //final String description;
  final double feelsLike;
  final int humidity;

  factory ForcastModel.fromjason(Map<String, dynamic> data) {
    return ForcastModel(
      //description: data["weather"]["description"],
      feelsLike: data["main"]["feels_like"],
      humidity: data["main"]["humidity"],
      name: data["name"],
      temp: data["main"]["temp"],
      windSpeed: data["main"]["temp"],
    );
  }
}
