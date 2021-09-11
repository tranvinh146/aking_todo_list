import 'package:aking_to_do_list/logic/base/base_event.dart';
import 'package:flutter/material.dart';

class AddNoteEvent extends BaseEvent {
  String description;
  Color color;

  AddNoteEvent(this.description, this.color);
}
