import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/models/ig_activity.dart';
import 'package:flutter_projects/instagram_redesign/ui/activity/widgets/activity_container.dart';
import 'package:flutter_projects/instagram_redesign/ui/activity/widgets/type_activity_toggle_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key key}) : super(key: key);

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  int selectedIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Activity",
        style: GoogleFonts.lato(fontSize: 24),
      )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //-------------------------------
          //-----TOGGLE BUTTONS LIST
          //-------------------------------
          SizedBox(
            height: 70,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              children:
                  List.generate(IgTypeActivity.values.length + 1, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TypeActivityToggleButton(
                    value: index,
                    onPressed: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                      _pageController.jumpToPage(value);
                    },
                    selectValue: selectedIndex,
                    notifications: index == 0
                        ? 0
                        : _getLengthActivities(
                            IgTypeActivity.values[index - 1]),
                    labelButton: index == 0
                        ? "All activity"
                        : IgTypeActivity.values[index - 1]
                            .toString()
                            .split(".")
                            .last,
                  ),
                );
              }),
            ),
          ),

          //-----------------------------
          //----TEXT ACTIVITIES LENGTH
          //-----------------------------
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Text(
              "New (${IgActivity.listActivities.length})",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //--------------------------------
          //----LIST ACTIVITIES
          //--------------------------------
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: IgTypeActivity.values.length + 1,
              itemBuilder: (context, index) {
                final listActivities = selectedIndex == 0
                    ? IgActivity.listActivities
                    : _getActivitiesByType(
                        IgTypeActivity.values[selectedIndex - 1]);

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
                  itemCount: listActivities.length,
                  itemBuilder: (context, index) {
                    final activity = listActivities[index];
                    return ActivityContainer(activity: activity);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int _getLengthActivities(IgTypeActivity typeActivity) {
    return IgActivity.listActivities
        .where((n) => n.typeNotification == typeActivity)
        .length;
  }

  List<IgActivity> _getActivitiesByType(IgTypeActivity typeActivity) {
    return IgActivity.listActivities
        .where((n) => n.typeNotification == typeActivity)
        .toList();
  }
}
