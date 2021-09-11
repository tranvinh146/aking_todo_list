import 'package:aking_to_do_list/logic/bloc/note_bloc.dart';
import 'package:aking_to_do_list/logic/event/quick_note_event/add_note_event.dart';
import 'package:aking_to_do_list/ui/components/color_picker.dart';
import 'package:aking_to_do_list/ui/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../others/constant.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteBloc bloc = Provider.of<NoteBloc>(context);
    TextEditingController descriptionController = TextEditingController();
    Color noteColor = Color(0xFF6074F9);
    return Stack(
      children: [
        _buildHeader(context),
        Positioned(
          child: Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(3, 3),
                  blurRadius: 9,
                  color: Color(0xFFDDDDDD).withOpacity(0.5),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildDescriptionField(descriptionController),
                  _buildChooseColor((value) {
                    noteColor = value;
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 50,
                    ),
                    child: DefaultButton(
                      "Done",
                      press: () {
                        _onClickedAddNote(
                          bloc,
                          descriptionController,
                          noteColor,
                        );
                        print(noteColor);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding _buildChooseColor(Function setColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 24,
      ),
      child: ColorPicker(
        availablaColors: [
          Color(0xFF6074F9),
          Color(0xFFE42B6A),
          Color(0xFF5ABB56),
          Color(0xFF3D3A62),
          Color(0xFFF4CA8F),
        ],
        onSelectColor: (value) {
          setColor(value);
        },
      ),
    );
  }

  Container _buildDescriptionField(TextEditingController textController) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: blackPrimaryColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            child: TextField(
              controller: textController,
              maxLines: 7,
              style: TextStyle(
                height: 1.5,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildHeader(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width,
        color: redPrimaryColor,
      ),
    );
  }

  _onClickedAddNote(
      NoteBloc bloc, TextEditingController descriptionController, Color color) {
    if (descriptionController.text.isNotEmpty) {
      bloc.event.add(AddNoteEvent(descriptionController.text, color));
    }
    return;
  }
}
