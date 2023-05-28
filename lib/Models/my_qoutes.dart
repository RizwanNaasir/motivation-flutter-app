class MyQuote{

  String ?text;
  String ?author;
  bool ?isLiked;

  MyQuote(this.text, this.author, this.isLiked);

  factory MyQuote.fromJson(Map<String, dynamic> json) {
    return MyQuote(
      json['text'] as String,
      json['author'] as String,
      json['isLiked'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
    'text': text,
    'author': author,
    'isLiked': isLiked,
  };
}