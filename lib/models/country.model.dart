class Country {
  String? id;
  String? slug;
  String? name;
  String? title;
  String? description;
  String? prefix;
  int? tam;
  String? imageUrl;
  String? iconUrl;
  String? status;
  String? createdAt;
  String? updatedAt;

  Country();

  Country.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        slug = json['slug'],
        name = json['name'],
        title = json['title'],
        description = json['description'],
        prefix = json['prefix'],
        tam = json['tam'],
        imageUrl = json['imageUrl'],
        iconUrl = json['iconUrl'],
        status = json['status'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson() => {
        '_id': id,
        'slug': slug,
        'name': name,
        'title': title,
        'description': description,
        'prefix': prefix,
        'tam': tam,
        'imageUrl': imageUrl,
        'iconUrl': iconUrl,
        'status': status,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
