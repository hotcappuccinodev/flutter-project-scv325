import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/medical_appointment/ui/doctors/doctors_page.dart';
import 'package:flutter_projects/medical_appointment/ui/home/home_page.dart';
import 'package:flutter_projects/medical_appointment/ui/widgets/top_rounded_navigation_bar.dart';
import 'package:flutter_projects/medical_appointment/utils/md_app_colors.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    });
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[50],
          primaryColor: MdAppColors.kBlue,
          accentColor: Colors.pinkAccent,
          primaryColorLight: MdAppColors.kLightBlue,
          primaryColorDark: MdAppColors.kDarkBlue,
          textTheme: GoogleFonts.poppinsTextTheme(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: _MainPage());
  }
}

class _MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      body: OverflowBox(
        alignment: Alignment.topCenter,
        maxHeight: MediaQuery.of(context).size.height,
        child: AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          child: [
            MedicalHomePage(),
            DoctorsPage(),
            const Scaffold(body: Center(child: Text("History"))),
            const Scaffold(body: Center(child: Text("Urgency"))),
          ][indexPage],
        ),
      ),
      bottomNavigationBar: TopRoundedNavigationBar(
        currentIndex: indexPage,
        onTap: (value) => setState(() {
          indexPage = value;
        }),
        items: [
          TopRoundedNavigationBarItem(
            label: 'Home',
            selectedIcon: Icons.home_rounded,
          ),
          TopRoundedNavigationBarItem(
              label: 'Doctors',
              selectedIcon: FontAwesome.user_md,
              color: Colors.greenAccent[700]),
          TopRoundedNavigationBarItem(
              label: 'History',
              selectedIcon: Icons.history,
              color: Colors.purpleAccent),
          TopRoundedNavigationBarItem(
              label: 'Urgency',
              selectedIcon: Icons.notifications,
              color: Colors.redAccent),
        ],
      ),
    );
  }
}
