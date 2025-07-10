/// name : "Dean Morgan"
/// character_name : "Mel"
/// imdb_code : "5925816"

class Cast {
  Cast({
      this.name, 
      this.characterName, 
      this.imdbCode,
    this.urlSmallImage
  });

  Cast.fromJson(dynamic json) {
    name = json['name'];
    characterName = json['character_name'];
    imdbCode = json['imdb_code'];
    urlSmallImage = json["url_small_image"];
  }
  String? name;
  String? characterName;
  String? imdbCode;
  String? urlSmallImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['character_name'] = characterName;
    map['imdb_code'] = imdbCode;
    map['url_small_image'] = urlSmallImage;
    return map;
  }

}