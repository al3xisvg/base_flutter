class Response {
  String? id;
  String? slug;
  int? code;
  dynamic data;
  String? message;
  String? status;
  String? createdAt;
  String? updatedAt;

  Response();

  Response.fromJson(Map<String, dynamic> json)
    : id = json['_id'],
      slug = json['slug'],
      code = json['code'],
      data = json['data'],
      message = json['message'],
      status = json['status'],
      createdAt = json['createdAt'],
      updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson() => {
    '_id': id,
    'slug': slug,
    'code': code,
    'data': data,
    'message': message,
    'status': status,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}