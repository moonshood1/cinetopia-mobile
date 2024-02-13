class Paragraph {
  String type;
  String? title;
  String? img;
  String? text;

  Paragraph({
    required this.type,
    this.title,
    this.img,
    this.text,
  });

  factory Paragraph.fromJson(Map<String, dynamic> json) => Paragraph(
      type: json['type'],
      title: json['title'],
      img: json['img'],
      text: json['text']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['title'] = title;
    data['img'] = img;
    data['text'] = text;
    return data;
  }
}

class Article {
  String title;
  String articleTitle;
  String description;
  String cover;
  String duration;
  String author;
  String type;
  String status;
  List<Paragraph> content;

  Article({
    required this.title,
    required this.articleTitle,
    required this.description,
    required this.cover,
    required this.duration,
    required this.author,
    required this.type,
    required this.status,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json['title'],
        articleTitle: json['articleTitle'],
        description: json['description'],
        cover: json['cover'],
        duration: json['duration'],
        author: json['author'],
        type: json['type'],
        status: json['status'],
        content: (json['content'] as List<dynamic>)
            .map((e) => Paragraph.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['articleTitle'] = articleTitle;
    data['description'] = description;
    data['cover'] = cover;
    data['duration'] = duration;
    data['author'] = author;
    data['type'] = type;
    data['status'] = status;
    data['content'] = content.map((e) => e.toJson()).toList();
    return data;
  }
}
