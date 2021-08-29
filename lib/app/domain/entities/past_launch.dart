class PastLaunch {
  PastLaunch({
    required this.missionName,
    required this.launchDateLocal,
    required this.launchSite,
    required this.links,
    required this.rocket,
    required this.ships,
  });

  String missionName;
  DateTime launchDateLocal;
  LaunchSite launchSite;
  Links links;
  PastLaunchRocket rocket;
  List<Ship> ships;

  factory PastLaunch.fromJson(Map<String, dynamic> json) => PastLaunch(
    missionName: json["mission_name"] ?? '',
    launchDateLocal: DateTime.parse(json["launch_date_local"]),
    launchSite: LaunchSite.fromJson(json["launch_site"]),
    links: Links.fromJson(json["links"]),
    rocket: PastLaunchRocket.fromJson(json["rocket"]),
    ships: List<Ship>.from(json["ships"].map((x) => Ship.fromJson(x ?? {'name' : '', 'home_port': '', 'image': ''}))),
  );

  Map<String, dynamic> toJson() => {
    "mission_name": missionName,
    "launch_date_local": launchDateLocal.toIso8601String(),
    "launch_site": launchSite.toJson(),
    "links": links.toJson(),
    "rocket": rocket.toJson(),
    "ships": List<dynamic>.from(ships.map((x) => x.toJson())),
  };
}

class LaunchSite {
  LaunchSite({
    required this.siteNameLong,
  });

  String siteNameLong;

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
    siteNameLong: json["site_name_long"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "site_name_long": siteNameLong,
  };
}

class Links {
  Links({
    required this.articleLink,
    required this.videoLink,
  });

  dynamic articleLink;
  String videoLink;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    articleLink: json["article_link"] ?? '',
    videoLink: json["video_link"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "article_link": articleLink,
    "video_link": videoLink,
  };
}

class PastLaunchRocket {
  PastLaunchRocket({
    required this.rocketName,
  });

  String rocketName;

  factory PastLaunchRocket.fromJson(Map<String, dynamic> json) => PastLaunchRocket(
    rocketName: json["rocket_name"],
  );

  Map<String, dynamic> toJson() => {
    "rocket_name": rocketName,
  };
}

class Ship {
  Ship({
    required this.name,
    required this.homePort,
    required this.image,
  });

  String name;
  String homePort;
  String image;

  factory Ship.fromJson(Map<String, dynamic> json) => Ship(
    name: json["name"] ?? '',
    homePort: json["home_port"] ?? '',
    image: json["image"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "home_port": homePort,
    "image": image,
  };
}
