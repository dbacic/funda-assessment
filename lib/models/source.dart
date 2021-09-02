import 'dart:convert';

class Source {
  final VideoDeliveryType deliveryType; //DeliveryType
  final String url; //Url

  Source({
    required this.deliveryType,
    required this.url,
  });

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      deliveryType: VideoDeliveryType.values.firstWhere(
        (element) => element.toString().toLowerCase().contains(
              map['DeliveryType'].toString().toLowerCase(),
            ),
        orElse: () => VideoDeliveryType.download,
      ),
      url: map['Url'],
    );
  }

  factory Source.fromJson(String source) => Source.fromMap(json.decode(source));
}

enum VideoDeliveryType { download, streaming }
