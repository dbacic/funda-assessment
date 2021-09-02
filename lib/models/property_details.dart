import 'dart:convert';

import 'package:funda_assessment/models/video.dart';
import 'package:intl/intl.dart';

// I choose not to do the model in full null safe mode since it would take more
// time later when using the model but also the server must return some
// guarantied data
class PropertyDetails {
  final int id;
  final String headPhoto; //HoofdFoto
  final String address; //Adres
  final String location; //Ligging
  final String constructionYear; //Bouwjaar
  final String url; //URL to we page
  final String fullDescription; //VolledigeOmschrijving
  final int price; // Prijs/Koopprijs
  final List<String> images; //Media-Foto
  final List<Video> videos; //Video

  PropertyDetails({
    required this.id,
    required this.headPhoto,
    required this.address,
    required this.location,
    required this.constructionYear,
    required this.url,
    required this.fullDescription,
    required this.price,
    required this.images,
    required this.videos,
  });

  factory PropertyDetails.fromMap(Map<String, dynamic> map) {
    return PropertyDetails(
      id: map['Id'],
      headPhoto: map['HoofdFoto'],
      address: map['Adres'],
      location: map['Ligging'],
      constructionYear: map['Bouwjaar'],
      url: map['URL'],
      fullDescription: map['VolledigeOmschrijving'],
      price: map['Prijs']['Koopprijs'],
      images: List<String>.from(map['Media-Foto'])
          .map((e) => e.replaceFirst('klein', 'grotere'))
          .toList(), // hacking the image size so that I don't need to extract the Media object
      videos:
          List<Video>.from(map['Video']['Videos'].map((x) => Video.fromMap(x))),
    );
  }

  factory PropertyDetails.fromJson(String source) =>
      PropertyDetails.fromMap(json.decode(source));

  String formatCurrency() {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'NL');
    return formatCurrency.format(price);
  }
}
