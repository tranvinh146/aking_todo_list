import 'package:aking_to_do_list/logic/bloc/task_bloc.dart';
import 'package:aking_to_do_list/logic/event/task_event/add_task_event.dart';
import 'package:aking_to_do_list/ui/components/default_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../others/constant.dart';
import 'date_picker.dart';

class Body extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    TaskBloc bloc = Provider.of<TaskBloc>(context);
    TextEditingController titleTaskController = TextEditingController();
    return Stack(
      children: [
        _buildHeader(context),
        _buildFooter(context),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
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
                  _buildInfo(),
                  _buildTitleField(titleTaskController),
                  _buildDescriptionField(),
                  _buildDueDate(),
                  _buildAddMenber(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: DefaultButton(
                      "Add Task",
                      press: () {
                        _onClickedAddTask(bloc, titleTaskController);
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

  Positioned _buildFooter(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF292E4E),
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

  Container _buildAddMenber() {
    return Container(
      height: 130,
      padding: EdgeInsets.all(24),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add Member",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Text(
              "Anyone",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDueDate() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      color: greyColor,
      child: Row(
        children: [
          Text(
            "Due Date",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            width: 10,
          ),
          DatePicker(),
        ],
      ),
    );
  }

  Container _buildInfo() {
    return Container(
      padding: EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "For",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Text(
              "Asignee",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            width: 35,
          ),
          Text(
            "In",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Text(
              "Project",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildTitleField(TextEditingController textController) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      color: greyColor,
      child: TextField(
        controller: textController,
        style: TextStyle(
          fontSize: 18,
          color: blackPrimaryColor,
        ),
        decoration: InputDecoration(
          hintText: "Title",
          hintStyle: TextStyle(
            fontSize: 18,
            color: blackPrimaryColor,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
        ),
      ),
    );
  }

  Container _buildDescriptionField() {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 75,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              border: Border.all(
                color: Color(0xFFEAEAEA),
              ),
            ),
            child: TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 48,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              color: Color(0xFFF8F8F8),
              border: Border.all(
                color: Color(0xFFEAEAEA),
              ),
            ),
            child: Icon(
              Icons.attach_file,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  _onClickedAddTask(TaskBloc bloc, TextEditingController titleController) {
    if (titleController.text.isNotEmpty)
      bloc.event.add(AddTaskEvent(titleController.text));
    return;
  }
}
