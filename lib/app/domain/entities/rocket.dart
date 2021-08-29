// To parse this JSON data, do
//
//     final rocket = rocketFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Rocket rocketFromJson(String str) => Rocket.fromJson(json.decode(str));

String rocketToJson(Rocket data) => json.encode(data.toJson());

class Rocket {
  Rocket({
    required this.active,
    required this.company,
    required this.costPerLaunch,
    required this.country,
    required this.description,
    required this.diameter,
    required this.firstFlight,
    required this.height,
    required this.mass,
    required this.name,
    required this.boosters,
    required this.engines,
    required this.stages,
    required this.id,
  });

  bool active;
  String company;
  int costPerLaunch;
  String country;
  String description;
  Diameter diameter;
  DateTime firstFlight;
  Diameter height;
  Mass mass;
  String name;
  int boosters;
  Engines engines;
  int stages;
  String id;

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
    active: json["active"],
    company: json["company"],
    costPerLaunch: json["cost_per_launch"],
    country: json["country"],
    description: json["description"],
    diameter: Diameter.fromJson(json["diameter"]),
    firstFlight: DateTime.parse(json["first_flight"]),
    height: Diameter.fromJson(json["height"]),
    mass: Mass.fromJson(json["mass"]),
    name: json["name"],
    boosters: json["boosters"],
    engines: Engines.fromJson(json["engines"]),
    stages: json["stages"],
    id: json["id"]
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "company": company,
    "cost_per_launch": costPerLaunch,
    "country": country,
    "description": description,
    "diameter": diameter.toJson(),
    "first_flight": "${firstFlight.year.toString().padLeft(4, '0')}-${firstFlight.month.toString().padLeft(2, '0')}-${firstFlight.day.toString().padLeft(2, '0')}",
    "height": height.toJson(),
    "mass": mass.toJson(),
    "name": name,
    "boosters": boosters,
    "engines": engines.toJson(),
    "stages": stages,
  };
}

class Diameter {
  Diameter({
    required this.meters,
  });

  double meters;

  factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
    meters: json["meters"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "meters": meters,
  };
}

class Engines {
  Engines({
    required this.engineLossMax,
    required this.layout,
    required this.number,
    required this.propellant1,
    required this.propellant2,
    required this.thrustSeaLevel,
    required this.thrustToWeight,
    required this.thrustVacuum,
    required this.type,
    required this.version,
  });

  String engineLossMax;
  String layout;
  int number;
  String propellant1;
  String propellant2;
  Thrust thrustSeaLevel;
  var thrustToWeight;
  Thrust thrustVacuum;
  String type;
  String version;

  factory Engines.fromJson(Map<String, dynamic> json) => Engines(
    engineLossMax: json["engine_loss_max"] ?? '',
    layout: json["layout"] ?? '',
    number: json["number"],
    propellant1: json["propellant_1"],
    propellant2: json["propellant_2"],
    thrustSeaLevel: Thrust.fromJson(json["thrust_sea_level"]),
    thrustToWeight: json["thrust_to_weight"],
    thrustVacuum: Thrust.fromJson(json["thrust_vacuum"]),
    type: json["type"],
    version: json["version"],
  );

  Map<String, dynamic> toJson() => {
    "engine_loss_max": engineLossMax,
    "layout": layout,
    "number": number,
    "propellant_1": propellant1,
    "propellant_2": propellant2,
    "thrust_sea_level": thrustSeaLevel.toJson(),
    "thrust_to_weight": thrustToWeight,
    "thrust_vacuum": thrustVacuum.toJson(),
    "type": type,
    "version": version,
  };
}

class Thrust {
  Thrust({
    required this.kN,
  });

  int kN;

  factory Thrust.fromJson(Map<String, dynamic> json) => Thrust(
    kN: json["kN"],
  );

  Map<String, dynamic> toJson() => {
    "kN": kN,
  };
}

class Mass {
  Mass({
    required this.kg,
  });

  int kg;

  factory Mass.fromJson(Map<String, dynamic> json) => Mass(
    kg: json["kg"],
  );

  Map<String, dynamic> toJson() => {
    "kg": kg,
  };
}
