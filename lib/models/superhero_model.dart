// To parse this JSON data, do
//
//     final superHeroModel = superHeroModelFromJson(jsonString);

import 'dart:convert';

class SuperHeroModel {
  String? response;
  String? id;
  String? name;
  Powerstats? powerstats;
  Biography? biography;
  Appearance? appearance;
  Work? work;
  Connections? connections;
  Image? image;

  SuperHeroModel({
    this.response,
    this.id,
    this.name,
    this.powerstats,
    this.biography,
    this.appearance,
    this.work,
    this.connections,
    this.image,
  });

  factory SuperHeroModel.fromRawJson(String str) =>
      SuperHeroModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SuperHeroModel.fromJson(Map<String, dynamic> json) => SuperHeroModel(
        response: json["response"],
        id: json["id"],
        name: json["name"] ?? "Unknown",
        powerstats: json["powerstats"] == null
            ? Powerstats.empty()
            : Powerstats.fromJson(json["powerstats"]),
        biography: json["biography"] == null
            ? Biography.empty()
            : Biography.fromJson(json["biography"]),
        appearance: json["appearance"] == null
            ? Appearance.empty()
            : Appearance.fromJson(json["appearance"]),
        work: json["work"] == null ? Work.empty() : Work.fromJson(json["work"]),
        connections: json["connections"] == null
            ? Connections.empty()
            : Connections.fromJson(json["connections"]),
        image: json["image"] == null ? Image() : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "id": id,
        "name": name,
        "powerstats": powerstats?.toJson(),
        "biography": biography?.toJson(),
        "appearance": appearance?.toJson(),
        "work": work?.toJson(),
        "connections": connections?.toJson(),
        "image": image?.toJson(),
      };
}

class Appearance {
  String? gender;
  String? race;
  List<String>? height;
  List<String>? weight;
  String? eyeColor;
  String? hairColor;

  Appearance({
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor,
  });

  factory Appearance.fromRawJson(String str) =>
      Appearance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Appearance.fromJson(Map<String, dynamic> json) => Appearance(
        gender: json["gender"] ?? "Unknown",
        race: json["race"] ?? "Unknown",
        height: json["height"] == null
            ? []
            : List<String>.from(json["height"]!.map((x) => x)),
        weight: json["weight"] == null
            ? []
            : List<String>.from(json["weight"]!.map((x) => x)),
        eyeColor: json["eye-color"] ?? "Unknown",
        hairColor: json["hair-color"] ?? "Unknown",
      );

  factory Appearance.empty() => Appearance(
        gender: "Unknown",
        race: "Unknown",
        height: List<String>.empty(),
        weight: List<String>.empty(),
        eyeColor: "Unknown",
        hairColor: "Unknown",
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "race": race,
        "height":
            height == null ? [] : List<dynamic>.from(height!.map((x) => x)),
        "weight":
            weight == null ? [] : List<dynamic>.from(weight!.map((x) => x)),
        "eye-color": eyeColor,
        "hair-color": hairColor,
      };
}

class Biography {
  String? fullName;
  String? alterEgos;
  List<String>? aliases;
  String? placeOfBirth;
  String? firstAppearance;
  String? publisher;
  String? alignment;

  Biography({
    this.fullName,
    this.alterEgos,
    this.aliases,
    this.placeOfBirth,
    this.firstAppearance,
    this.publisher,
    this.alignment,
  });

  factory Biography.fromRawJson(String str) =>
      Biography.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Biography.empty() => Biography(
        fullName: "Unknown",
        alterEgos: "Unknown",
        aliases: List<String>.empty(),
        placeOfBirth: "Unknown",
        firstAppearance: "Unknown",
        publisher: "Unknown",
        alignment: "Unknown",
      );

  factory Biography.fromJson(Map<String, dynamic> json) => Biography(
        fullName: json["full-name"] ?? "Unknown",
        alterEgos: json["alter-egos"] ?? "Unknown",
        aliases: json["aliases"] == null
            ? []
            : List<String>.from(json["aliases"]!.map((x) => x)),
        placeOfBirth: json["place-of-birth"] ?? "Unknown",
        firstAppearance: json["first-appearance"] ?? "Unknown",
        publisher: json["publisher"] ?? "Unknown",
        alignment: json["alignment"] ?? "Unknown",
      );

  Map<String, dynamic> toJson() => {
        "full-name": fullName,
        "alter-egos": alterEgos,
        "aliases":
            aliases == null ? [] : List<dynamic>.from(aliases!.map((x) => x)),
        "place-of-birth": placeOfBirth,
        "first-appearance": firstAppearance,
        "publisher": publisher,
        "alignment": alignment,
      };
}

class Connections {
  String? groupAffiliation;
  String? relatives;

  Connections({
    this.groupAffiliation,
    this.relatives,
  });

  factory Connections.fromRawJson(String str) =>
      Connections.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
        groupAffiliation: json["group-affiliation"] ?? "Unknown",
        relatives: json["relatives"] ?? "Unknown",
      );

  factory Connections.empty() => Connections(
        groupAffiliation: "Unknown",
        relatives: "Unknown",
      );

  Map<String, dynamic> toJson() => {
        "group-affiliation": groupAffiliation,
        "relatives": relatives,
      };
}

class Image {
  String? url;

  Image({
    this.url,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Powerstats {
  String? intelligence;
  String? strength;
  String? speed;
  String? durability;
  String? power;
  String? combat;

  Powerstats({
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });

  factory Powerstats.fromRawJson(String str) =>
      Powerstats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Powerstats.fromJson(Map<String, dynamic> json) => Powerstats(
        intelligence: json["intelligence"] ?? "Unknown",
        strength: json["strength"] ?? "Unknown",
        speed: json["speed"] ?? "Unknown",
        durability: json["durability"] ?? "Unknown",
        power: json["power"] ?? "Unknown",
        combat: json["combat"] ?? "Unknown",
      );

  factory Powerstats.empty() => Powerstats(
        intelligence: "Unknown",
        strength: "Unknown",
        speed: "Unknown",
        durability: "Unknown",
        power: "Unknown",
        combat: "Unknown",
      );

  Map<String, dynamic> toJson() => {
        "intelligence": intelligence,
        "strength": strength,
        "speed": speed,
        "durability": durability,
        "power": power,
        "combat": combat,
      };
}

class Work {
  String? occupation;
  String? base;

  Work({
    this.occupation,
    this.base,
  });

  factory Work.fromRawJson(String str) => Work.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        occupation: json["occupation"] ?? "Unknown",
        base: json["base"] ?? "Unknown",
      );

  factory Work.empty() => Work(
        occupation: "Unknown",
        base: "Unknown",
      );

  Map<String, dynamic> toJson() => {
        "occupation": occupation,
        "base": base,
      };
}
