// To parse this JSON data, do
//
//     final photoModel = photoModelFromJson(jsonString);

import 'dart:convert';

PhotoModel photoModelFromJson(String str) => PhotoModel.fromJson(json.decode(str));

String photoModelToJson(PhotoModel data) => json.encode(data.toJson());

class PhotoModel {
    PhotoModel({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.promotedAt,
        required this.width,
        required this.height,
        required this.color,
        required this.blurHash,
        this.description,
        required this.altDescription,
        required this.urls,
        required this.links,
        required this.likes,
        required this.likedByUser,
        required this.currentUserCollections,
        this.sponsorship,
        required this.topicSubmissions,
        required this.user,
        required this.exif,
        required this.location,
    });

    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    DateTime? promotedAt;
    int? width;
    int? height;
    String? color;
    String? blurHash;
    dynamic description;
    String? altDescription;
    Urls? urls;
    PhotoModelLinks? links;
    int? likes;
    bool? likedByUser;
    List<dynamic> currentUserCollections;
    dynamic sponsorship;
    TopicSubmissions? topicSubmissions;
    User? user;
    Exif? exif;
    Location? location;

    factory PhotoModel.fromJson(Map<String, dynamic>? json) => PhotoModel(
        id: json?["id"],
        createdAt: DateTime.parse(json?["created_at"]),
        updatedAt: DateTime.parse(json?["updated_at"]),
        promotedAt: DateTime.parse(json?["promoted_at"]),
        width: json?["width"],
        height: json?["height"],
        color: json?["color"],
        blurHash: json?["blur_hash"],
        description: json?["description"],
        altDescription: json?["alt_description"],
        urls: Urls.fromJson(json?["urls"]),
        links: PhotoModelLinks.fromJson(json?["links"]),
        likes: json?["likes"],
        likedByUser: json?["liked_by_user"],
        currentUserCollections: List<dynamic>.from(json?["current_user_collections"].map((x) => x)),
        sponsorship: json?["sponsorship"],
        topicSubmissions: TopicSubmissions.fromJson(json?["topic_submissions"]),
        user: User.fromJson(json?["user"]),
        exif: Exif.fromJson(json?["exif"]),
        location: Location.fromJson(json?["location"]),
    );

    Map<String, dynamic>? toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "urls": urls?.toJson(),
        "links": links?.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions?.toJson(),
        "user": user?.toJson(),
        "exif": exif?.toJson(),
        "location": location?.toJson(),
    };
}

class Exif {
    Exif({
        required this.make,
        required this.model,
        required this.name,
        required this.exposureTime,
        required this.aperture,
        required this.focalLength,
        required this.iso,
    });

    String? make;
    String? model;
    String? name;
    String? exposureTime;
    String? aperture;
    String? focalLength;
    int? iso;

    factory Exif.fromJson(Map<String, dynamic>? json) => Exif(
        make: json?["make"],
        model: json?["model"],
        name: json?["name"],
        exposureTime: json?["exposure_time"],
        aperture: json?["aperture"],
        focalLength: json?["focal_length"],
        iso: json?["iso"],
    );

    Map<String, dynamic>? toJson() => {
        "make": make,
        "model": model,
        "name": name,
        "exposure_time": exposureTime,
        "aperture": aperture,
        "focal_length": focalLength,
        "iso": iso,
    };
}

class PhotoModelLinks {
    PhotoModelLinks({
        required this.self,
        required this.html,
        required this.download,
        required this.downloadLocation,
    });

    String? self;
    String? html;
    String? download;
    String? downloadLocation;

    factory PhotoModelLinks.fromJson(Map<String, dynamic>? json) => PhotoModelLinks(
        self: json?["self"],
        html: json?["html"],
        download: json?["download"],
        downloadLocation: json?["download_location"],
    );

    Map<String, dynamic>? toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
    };
}

class Location {
    Location({
        this.name,
        this.city,
        this.country,
        required this.position,
    });

    dynamic name;
    dynamic city;
    dynamic country;
    Position? position;

    factory Location.fromJson(Map<String, dynamic>? json) => Location(
        name: json?["name"],
        city: json?["city"],
        country: json?["country"],
        position: Position.fromJson(json?["position"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "city": city,
        "country": country,
        "position": position?.toJson(),
    };
}

class Position {
    Position({
        required this.latitude,
        required this.longitude,
    });

    dynamic latitude;
    dynamic longitude;

    factory Position.fromJson(Map<String, dynamic>? json) => Position(
        latitude: json?["latitude"],
        longitude: json?["longitude"],
    );

    Map<String, dynamic>? toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

class TopicSubmissions {
    TopicSubmissions();

    factory TopicSubmissions.fromJson(Map<String, dynamic>? json) => TopicSubmissions(
    );

    Map<String, dynamic>? toJson() => {
    };
}

class Urls {
    Urls({
        required this.raw,
        required this.full,
        required this.regular,
        required this.small,
        required this.thumb,
        required this.smallS3,
    });

    String? raw;
    String? full;
    String? regular;
    String? small;
    String? thumb;
    String? smallS3;

    factory Urls.fromJson(Map<String, dynamic>? json) => Urls(
        raw: json?["raw"],
        full: json?["full"],
        regular: json?["regular"],
        small: json?["small"],
        thumb: json?["thumb"],
        smallS3: json?["small_s3"],
    );

    Map<String, dynamic>? toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
    };
}

class User {
    User({
        required this.id,
        required this.updatedAt,
        required this.username,
        required this.name,
        required this.firstName,
        this.lastName,
        required this.twitterUsername,
        required this.portfolioUrl,
        required this.bio,
        required this.location,
        required this.links,
        required this.profileImage,
        required this.instagramUsername,
        required this.totalCollections,
        required this.totalLikes,
        required this.totalPhotos,
        required this.acceptedTos,
        required this.forHire,
        required this.social,
    });

    String? id;
    DateTime? updatedAt;
    String? username;
    String? name;
    String? firstName;
    dynamic lastName;
    String? twitterUsername;
    String? portfolioUrl;
    String? bio;
    String? location;
    UserLinks? links;
    ProfileImage? profileImage;
    String? instagramUsername;
    int? totalCollections;
    int? totalLikes;
    int? totalPhotos;
    bool? acceptedTos;
    bool? forHire;
    Social? social;

    factory User.fromJson(Map<String, dynamic>? json) => User(
        id: json?["id"],
        updatedAt: DateTime.parse(json?["updated_at"]),
        username: json?["username"],
        name: json?["name"],
        firstName: json?["first_name"],
        lastName: json?["last_name"],
        twitterUsername: json?["twitter_username"],
        portfolioUrl: json?["portfolio_url"],
        bio: json?["bio"],
        location: json?["location"],
        links: UserLinks.fromJson(json?["links"]),
        profileImage: ProfileImage.fromJson(json?["profile_image"]),
        instagramUsername: json?["instagram_username"],
        totalCollections: json?["total_collections"],
        totalLikes: json?["total_likes"],
        totalPhotos: json?["total_photos"],
        acceptedTos: json?["accepted_tos"],
        forHire: json?["for_hire"],
        social: Social.fromJson(json?["social"]),
    );

    Map<String, dynamic>? toJson() => {
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links?.toJson(),
        "profile_image": profileImage?.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social?.toJson(),
    };
}

class UserLinks {
    UserLinks({
        required this.self,
        required this.html,
        required this.photos,
        required this.likes,
        required this.portfolio,
        required this.following,
        required this.followers,
    });

    String? self;
    String? html;
    String? photos;
    String? likes;
    String? portfolio;
    String? following;
    String? followers;

    factory UserLinks.fromJson(Map<String, dynamic>? json) => UserLinks(
        self: json?["self"],
        html: json?["html"],
        photos: json?["photos"],
        likes: json?["likes"],
        portfolio: json?["portfolio"],
        following: json?["following"],
        followers: json?["followers"],
    );

    Map<String, dynamic>? toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
    };
}

class ProfileImage {
    ProfileImage({
        required this.small,
        required this.medium,
        required this.large,
    });

    String? small;
    String? medium;
    String? large;

    factory ProfileImage.fromJson(Map<String, dynamic>? json) => ProfileImage(
        small: json?["small"],
        medium: json?["medium"],
        large: json?["large"],
    );

    Map<String, dynamic>? toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
    };
}

class Social {
    Social({
        required this.instagramUsername,
        required this.portfolioUrl,
        required this.twitterUsername,
        this.paypalEmail,
    });

    String? instagramUsername;
    String? portfolioUrl;
    String? twitterUsername;
    dynamic paypalEmail;

    factory Social.fromJson(Map<String, dynamic>? json) => Social(
        instagramUsername: json?["instagram_username"],
        portfolioUrl: json?["portfolio_url"],
        twitterUsername: json?["twitter_username"],
        paypalEmail: json?["paypal_email"],
    );

    Map<String, dynamic>? toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
    };
}
