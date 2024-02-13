class Quote {
  String text;
  String author;

  Quote({
    required this.text,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['title'],
      author: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'author': author,
    };
  }
}
