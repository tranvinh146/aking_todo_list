import 'package:flutter/cupertino.dart';

class Note {
  int? id;
  String description;
  Color color;

  Note.fromData(this.id, this.description, this.color);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': description,
      'color': color,
    };
  }
}
