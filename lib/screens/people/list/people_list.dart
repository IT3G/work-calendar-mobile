import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/screens/people/filters/birthday_message.dart';
import 'package:it2g_calendar_mobile/screens/people/list/people_list_item.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PeopleList extends StatelessWidget {
  final List<User> people;
  final bool loading;
  final Function onScroll;
  final List<String> birthdaysToday;
  final Function setSerachQuery;

  PeopleList(
      {Key? key,
      required this.people,
      required this.loading,
      required this.onScroll,
      required this.setSerachQuery,
      this.birthdaysToday = const []})
      : super(key: key);

  final ScrollController scrollController = new ScrollController();

  void handleScroll() {
    onScroll(scrollController.offset);
  }

  Widget getBirthdaysMessage() {
    if (loading || birthdaysToday.length == 0) {
      return Container();
    }

    return Positioned(
      child: BirthdaysMessage(),
      bottom: 50,
    );
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(handleScroll);

    if (loading) {
      return Container(
        height: 200,
        child: Center(
          child: SpinKitDualRing(
            color: Colors.blue,
            size: 25,
            lineWidth: 3,
          ),
        ),
      );
    }

    void handleSearch(String value) {
      setSerachQuery(value);
    }

    return Stack(
      children: [
        ListView(
          controller: scrollController,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Colors.grey.shade400, width: 0.5))),
              padding:
                  EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
              child: CupertinoTextField(
                onChanged: handleSearch,
                style: TextStyle(fontSize: 20),
                prefix: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey.shade400,
                  ),
                ),
                padding: EdgeInsets.only(top: 7, bottom: 7, right: 7, left: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade100,
                    ),
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8)),
                placeholder: "Поиск",
              ),
            ),
            for (User user in people)
              PeopleListItem(
                user: user,
              )
          ],
        ),
        getBirthdaysMessage()
      ],
    );

    // return ;
  }
}
