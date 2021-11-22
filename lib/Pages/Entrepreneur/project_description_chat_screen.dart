
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/Headings/widget_related_topics.dart';
import 'package:personal_branding/widgets/TextFields/widget_chatScreen_message_box.dart';
import 'package:personal_branding/widgets/widget_chat_screen_textfield_button.dart';

class ProjectDescriptionWithChatScreen extends StatefulWidget {
  const ProjectDescriptionWithChatScreen({Key? key}) : super(key: key);

  @override
  _ProjectDescriptionWithChatScreenState createState() => _ProjectDescriptionWithChatScreenState();
}

class _ProjectDescriptionWithChatScreenState extends State<ProjectDescriptionWithChatScreen> {

List relatedTopics = [RelatedTopics("Feasibility Report"),RelatedTopics("Feasibility Report"),RelatedTopics("Feasibility Report"),RelatedTopics("Feasibility Report")];
TextEditingController _MessageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Project Name"),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*1/70,left: 10,right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Heading2WithDescription("DESCRIPTION", "Descrition paragraph"),
                          Heading2("RELATED DOCUMENTS"),
                          Row(
                            children: <Widget>[
                              RelatedTopics("Feasibility Report"),
                              RelatedTopics("Feasibility Report"),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54)
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(width: MediaQuery.of(context).size.width,
                                  height: 50,color: Colors.black12,
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Heading2("Project Name")),),
                                  ChatBox(Container(child: Center(child: Text("Message here"),),)),
                                  TextFieldAndButton(_MessageController, "Send", "Enter Your Message", (){}),
                                ],
                              ),
                            ),
                        ],
                    ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
