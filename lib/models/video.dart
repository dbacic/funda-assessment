import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:funda_assessment/models/source.dart';

class Video {
  final List<Source> sources; // Videos/Cdns

  Video({
    required this.sources,
  });

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      sources: List<Source>.from(map['Cdns']?.map((x) => Source.fromMap(x))),
    );
  }

  factory Video.fromJson(String source) => Video.fromMap(json.decode(source));

  Source? getFirstSource() {
    return sources.firstOrNull;
  }
}
