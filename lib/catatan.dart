class Catatan {
  int? id;
  String content;

  Catatan({
    this.id,
    required this.content,
  });

  factory Catatan.fromMap(Map<String, dynamic> map) {
    return Catatan(
      id: map['id'] as int,
      content: map['content'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
    };
  }
}