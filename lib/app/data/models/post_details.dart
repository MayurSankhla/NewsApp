class PostDetails {
  String? by;
  int? descendants;
  int? id;
  List<int>? kids;
  int? score;
  int? time;
  String? title;
  String? type;
  String? url;

  PostDetails(
      {this.by,
        this.descendants,
        this.id,
        this.kids,
        this.score,
        this.time,
        this.title,
        this.type,
        this.url});

  PostDetails.fromJson(Map<String, dynamic> json) {
    by = json['by']?.toString();
    descendants = json['descendants'] != null ? int.parse(json['descendants'].toString()) : null;
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    kids = json['kids'] != null ? List<int>.from(json['kids'].map((e) => int.parse(e.toString()))) : [];
    score = json['score'] != null ? int.parse(json['score'].toString()) : null;
    time = json['time'] != null ? int.parse(json['time'].toString()) : null;
    title = json['title']?.toString();
    type = json['type']?.toString();
    url = json['url']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['by'] = by;
    data['descendants'] = descendants;
    data['id'] = id;
    data['kids'] = kids;
    data['score'] = score;
    data['time'] = time;
    data['title'] = title;
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}
