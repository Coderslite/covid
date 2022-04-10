import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class VaccineLocation extends StatefulWidget {
  VaccineLocation({Key? key}) : super(key: key);

  @override
  _VaccineLocationState createState() => _VaccineLocationState();
}

class _VaccineLocationState extends State<VaccineLocation> {
  final HDTRefreshController _hdtRefreshController = HDTRefreshController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vaccine Location"),
      ),
      body: _getBodyWidget(),
    );
  }

  Widget _getBodyWidget() {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 600,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: user.userInfo.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
        verticalScrollbarStyle: const ScrollbarStyle(
          thumbColor: Colors.yellow,
          isAlwaysShown: true,
          thickness: 4.0,
          radius: Radius.circular(5.0),
        ),
        horizontalScrollbarStyle: const ScrollbarStyle(
          thumbColor: Colors.red,
          isAlwaysShown: true,
          thickness: 4.0,
          radius: Radius.circular(5.0),
        ),
        enablePullToRefresh: true,
        refreshIndicator: const WaterDropHeader(),
        refreshIndicatorHeight: 60,
        onRefresh: () async {
          //Do sth
          await Future.delayed(const Duration(milliseconds: 500));
          _hdtRefreshController.refreshCompleted();
        },
        enablePullToLoadNewData: true,
        loadIndicator: const ClassicFooter(),
        onLoad: () async {
          //Do sth
          await Future.delayed(const Duration(milliseconds: 500));
          _hdtRefreshController.loadComplete();
        },
        htdRefreshController: _hdtRefreshController,
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: _getTitleItemWidget('District', 100),
          onPressed: () {}),
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget('Tehsil', 100),
        onPressed: () {},
      ),
      _getTitleItemWidget('Vaccination Center with Address', 300),
      _getTitleItemWidget('Contact No', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(user.userInfo[index].district),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[Text(user.userInfo[index].tehsil)],
          ),
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(user.userInfo[index].center),
          width: 300,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(user.userInfo[index].contact),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}

User user = User();

class User {
  List<UserInfo> userInfo = [
    UserInfo(
        "Islamabad",
        "Islamabad",
        "Quaid e Azam Internation Hospital, Street 9, G-8/2 G 8/2 G-8, Islamabad",
        "051-8449100"),
    UserInfo("Islamabad", "Islamabad",
        "NIRM, Near Murree Exoress Highway, Islamabad", "051-9262213"),
  ];

  // void initData(int size) {
  //   // for (int i = 0; i < size; i++) {
  //   userInfo
  //       .add(UserInfo("User", "hekko", '+001 9999 9999', '2019-01-01', 'N/A'));
  //   // }
  // }

  ///
  /// Single sort, sort district's id
  // void sortdistrict(bool isAscending) {
  //   userInfo.sort((a, b) {
  //     int aId = int.tryParse(a.district.replaceFirst('User_', '')) ?? 0;
  //     int bId = int.tryParse(b.district.replaceFirst('User_', '')) ?? 0;
  //     return (aId - bId) * (isAscending ? 1 : -1);
  //   });
  // }

  ///
  /// sort with tehsil and district as the 2nd Sort
}

class UserInfo {
  String district;
  String tehsil;
  String center;
  String contact;

  UserInfo(this.district, this.tehsil, this.center, this.contact);
}
