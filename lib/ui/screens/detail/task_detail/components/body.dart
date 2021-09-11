import 'package:aking_to_do_list/others/constant.dart';
import 'package:aking_to_do_list/ui/components/default_button.dart';
import 'package:aking_to_do_list/ui/screens/detail/task_detail/components/edit_popup.dart';
import 'package:aking_to_do_list/ui/screens/detail/task_detail/components/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildFooter(context),
        Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(16, 70, 16, 30),
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Column(
            children: [
              _buildButtonHeader(context),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(),

                      //Assigned to
                      _buildAssignee(),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),

                      //Due Data
                      buildDueDate(),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),

                      //Description
                      _buildDescription(),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),

                      //Members
                      _buildMembers(),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),

                      //Tag
                      _buildTag(),

                      //Build Comment

                      //Button
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: DefaultButton(
                          "Complete Task",
                          backgroundColor: bluePrimaryColor,
                          press: () {},
                        ),
                      ),

                      //Show comment
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Comment",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 16),
                            SvgPicture.asset(
                              "assets/icons/show_more_icon.svg",
                              width: 12,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Section _buildTag() {
    return Section(
      leading: SvgPicture.asset(
        "assets/icons/tag_icon.svg",
        width: 20,
      ),
      title: "Tag",
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Text(
          "Personal",
          style: TextStyle(
            fontSize: 16,
            color: bluePrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Section _buildMembers() {
    return Section(
      leading: SvgPicture.asset(
        "assets/icons/members_icon.svg",
        width: 20,
      ),
      title: "Members",
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Section _buildDescription() {
    return Section(
      leading: SvgPicture.asset(
        "assets/icons/description_icon.svg",
        width: 20,
      ),
      title: "Description",
      child: Container(
        width: 250,
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing.",
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ),
    );
  }

  Section buildDueDate() {
    return Section(
      leading: SvgPicture.asset(
        "assets/icons/calendar_icon.svg",
        width: 20,
      ),
      title: "Due Date",
      child: Text(
        "Aug 5, 2019",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Section _buildAssignee() {
    return Section(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("assets/images/avatar.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: "Assigned to",
      child: Text(
        "Stephen Chow",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Text _buildTitle() {
    return Text(
      "Meeting according with design team in Central Park",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        height: 1.8,
      ),
    );
  }

  Row _buildButtonHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            size: 25,
          ),
        ),
        IconButton(
          onPressed: () {
            EditPopup.show(context);
          },
          iconSize: 25,
          icon: Icon(Icons.settings),
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
        color: Color(0xFF191C2F),
      ),
    );
  }

  Container _buildBackground() {
    return Container(
      color: Color(0xFF953A3A),
      width: double.infinity,
      height: double.infinity,
    );
  }
}
