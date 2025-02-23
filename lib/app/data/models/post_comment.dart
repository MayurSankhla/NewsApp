class PostComment {
  final int? id;
  final int? parent;
  final int? time;
  final String? type;
  final String? by;
  final String? text;
  final bool? deleted;

  PostComment({
    required this.id,
    required this.parent,
    required this.time,
    required this.type,
    this.by,
    this.text,
    this.deleted,
  });

  factory PostComment.fromJson(Map<String, dynamic> json) {
    return PostComment(
      id: json['id'],
      parent: json['parent'],
      time: json['time'],
      type: json['type'],
      by: json['by'],
      text: json['text'],
      deleted: json['deleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parent': parent,
      'time': time,
      'type': type,
      'by': by,
      'text': text,
      'deleted': deleted,
    };
  }
}
