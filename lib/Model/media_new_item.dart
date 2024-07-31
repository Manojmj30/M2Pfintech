// To parse this JSON data, do
//
//     final mediaNewItem = mediaNewItemFromJson(jsonString);

import 'dart:convert';

MediaNewItem mediaNewItemFromJson(String str) => MediaNewItem.fromJson(json.decode(str));

String mediaNewItemToJson(MediaNewItem data) => json.encode(data.toJson());

class MediaNewItem {
  int? resultCount;
  List<Result>? results;

  MediaNewItem({
    this.resultCount,
    this.results,
  });

  factory MediaNewItem.fromJson(Map<String, dynamic> json) => MediaNewItem(
    resultCount: json["resultCount"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "resultCount": resultCount,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  WrapperType? wrapperType;
  Kind? kind;
  int? collectionId;
  int? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  int? collectionArtistId;
  String? collectionArtistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  double? trackRentalPrice;
  double? collectionHdPrice;
  double? trackHdPrice;
  double? trackHdRentalPrice;
  DateTime? releaseDate;
  Explicitness? collectionExplicitness;
  Explicitness? trackExplicitness;
  int? discCount;
  int? discNumber;
  int? trackCount;
  int? trackNumber;
  int? trackTimeMillis;
  Country? country;
  Currency? currency;
  String? primaryGenreName;
  String? contentAdvisoryRating;
  String? shortDescription;
  String? longDescription;
  bool? hasITunesExtras;
  int? artistId;
  String? artistViewUrl;
  bool? isStreamable;
  String? collectionArtistName;

  Result({
    this.wrapperType,
    this.kind,
    this.collectionId,
    this.trackId,
    this.artistName,
    this.collectionName,
    this.trackName,
    this.collectionCensoredName,
    this.trackCensoredName,
    this.collectionArtistId,
    this.collectionArtistViewUrl,
    this.collectionViewUrl,
    this.trackViewUrl,
    this.previewUrl,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.trackPrice,
    this.trackRentalPrice,
    this.collectionHdPrice,
    this.trackHdPrice,
    this.trackHdRentalPrice,
    this.releaseDate,
    this.collectionExplicitness,
    this.trackExplicitness,
    this.discCount,
    this.discNumber,
    this.trackCount,
    this.trackNumber,
    this.trackTimeMillis,
    this.country,
    this.currency,
    this.primaryGenreName,
    this.contentAdvisoryRating,
    this.shortDescription,
    this.longDescription,
    this.hasITunesExtras,
    this.artistId,
    this.artistViewUrl,
    this.isStreamable,
    this.collectionArtistName,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    wrapperType: wrapperTypeValues.map[json["wrapperType"]],
    kind: kindValues.map[json["kind"]],
    collectionId: json["collectionId"],
    trackId: json["trackId"],
    artistName: json["artistName"],
    collectionName: json["collectionName"],
    trackName: json["trackName"],
    collectionCensoredName: json["collectionCensoredName"],
    trackCensoredName: json["trackCensoredName"],
    collectionArtistId: json["collectionArtistId"],
    collectionArtistViewUrl: json["collectionArtistViewUrl"],
    collectionViewUrl: json["collectionViewUrl"],
    trackViewUrl: json["trackViewUrl"],
    previewUrl: json["previewUrl"],
    artworkUrl30: json["artworkUrl30"],
    artworkUrl60: json["artworkUrl60"],
    artworkUrl100: json["artworkUrl100"],
    collectionPrice: json["collectionPrice"].toDouble(),
    trackPrice: json["trackPrice"].toDouble(),
    trackRentalPrice: json["trackRentalPrice"].toDouble(),
    collectionHdPrice: json["collectionHdPrice"].toDouble(),
    trackHdPrice: json["trackHdPrice"].toDouble(),
    trackHdRentalPrice: json["trackHdRentalPrice"].toDouble(),
    releaseDate: DateTime.parse(json["releaseDate"]),
    collectionExplicitness: explicitnessValues.map[json["collectionExplicitness"]],
    trackExplicitness: explicitnessValues.map[json["trackExplicitness"]],
    discCount: json["discCount"],
    discNumber: json["discNumber"],
    trackCount: json["trackCount"],
    trackNumber: json["trackNumber"],
    trackTimeMillis: json["trackTimeMillis"],
    country: countryValues.map[json["country"]],
    currency: currencyValues.map[json["currency"]],
    primaryGenreName: json["primaryGenreName"],
    contentAdvisoryRating: json["contentAdvisoryRating"],
    shortDescription: json["shortDescription"],
    longDescription: json["longDescription"],
    hasITunesExtras: json["hasITunesExtras"],
    artistId: json["artistId"],
    artistViewUrl: json["artistViewUrl"],
    isStreamable: json["isStreamable"],
    collectionArtistName: json["collectionArtistName"],
  );

  Map<String, dynamic> toJson() => {
    "wrapperType": wrapperTypeValues.reverse[wrapperType],
    "kind": kindValues.reverse[kind],
    "collectionId": collectionId,
    "trackId": trackId,
    "artistName": artistName,
    "collectionName": collectionName,
    "trackName": trackName,
    "collectionCensoredName": collectionCensoredName,
    "trackCensoredName": trackCensoredName,
    "collectionArtistId": collectionArtistId,
    "collectionArtistViewUrl": collectionArtistViewUrl,
    "collectionViewUrl": collectionViewUrl,
    "trackViewUrl": trackViewUrl,
    "previewUrl": previewUrl,
    "artworkUrl30": artworkUrl30,
    "artworkUrl60": artworkUrl60,
    "artworkUrl100": artworkUrl100,
    "collectionPrice": collectionPrice,
    "trackPrice": trackPrice,
    "trackRentalPrice": trackRentalPrice,
    "collectionHdPrice": collectionHdPrice,
    "trackHdPrice": trackHdPrice,
    "trackHdRentalPrice": trackHdRentalPrice,
    "releaseDate": releaseDate!.toIso8601String(),
    "collectionExplicitness": explicitnessValues.reverse[collectionExplicitness],
    "trackExplicitness": explicitnessValues.reverse[trackExplicitness],
    "discCount": discCount,
    "discNumber": discNumber,
    "trackCount": trackCount,
    "trackNumber": trackNumber,
    "trackTimeMillis": trackTimeMillis,
    "country": countryValues.reverse[country],
    "currency": currencyValues.reverse[currency],
    "primaryGenreName": primaryGenreName,
    "contentAdvisoryRating": contentAdvisoryRating,
    "shortDescription": shortDescription,
    "longDescription": longDescription,
    "hasITunesExtras": hasITunesExtras,
    "artistId": artistId,
    "artistViewUrl": artistViewUrl,
    "isStreamable": isStreamable,
    "collectionArtistName": collectionArtistName,
  };
}

enum Explicitness {
  EXPLICIT,
  NOT_EXPLICIT
}

final explicitnessValues = EnumValues({
  "explicit": Explicitness.EXPLICIT,
  "notExplicit": Explicitness.NOT_EXPLICIT
});

enum Country {
  USA
}

final countryValues = EnumValues({
  "USA": Country.USA
});

enum Currency {
  USD
}

final currencyValues = EnumValues({
  "USD": Currency.USD
});

enum Kind {
  FEATURE_MOVIE,
  SONG
}

final kindValues = EnumValues({
  "feature-movie": Kind.FEATURE_MOVIE,
  "song": Kind.SONG
});

enum WrapperType {
  TRACK
}

final wrapperTypeValues = EnumValues({
  "track": WrapperType.TRACK
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
