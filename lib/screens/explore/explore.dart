import 'package:muffesapp/screens/explore/stories.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:muffesapp/utils/components/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:muffesapp/utils/components/user.dart';

class Explore extends StatelessWidget {
  const Explore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDesign(
      withSafeTop: true,
      withAppBar: true,
      children: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MuffesStoriesExplore(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "PEOPLE YOU MAY KNOW",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.grey[800]),
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: UserWidget(
                      username: "suggestied",
                      displayname: "suggestied",
                      profilePicture: "https://api.muffes.com/v1/user/avatar/1",
                      id: "1",
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "FOR YOU",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.grey[800]),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: StaggeredGridView.countBuilder(
                primary: false,
                shrinkWrap: true,
                crossAxisCount: 3,
                itemCount: 18,
                itemBuilder: (context, index) => Center(
                    child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13.0),
                    child: Image.network(
                      "https://source.unsplash.com/1600x1600/?nature",
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
                staggeredTileBuilder: (index) => StaggeredTile.count(
                    (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
            ),
          ],
        ),
      ),
      pageTitle: "Explore",
      actionChildren: Container(),
    );
  }
}
