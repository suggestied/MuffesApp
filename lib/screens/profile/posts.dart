import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:muffesapp/ad_state.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:muffesapp/utils/components/bottomNavBar.dart';
import 'package:muffesapp/utils/components/page.dart';
import 'package:muffesapp/utils/components/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePosts extends StatefulWidget {
  const ProfilePosts({
    Key key,
    this.data,
    this.userToken,
    this.currentPost,
    this.username,
    this.displayName,
  }) : super(key: key);

  final data;
  final userToken;
  final currentPost;
  final username;
  final displayName;

  @override
  _ProfilePostsState createState() => _ProfilePostsState();
}

class _ProfilePostsState extends State<ProfilePosts> {
  BannerAd bannerPostAd;
  List<Object> postList;

  @override
  void initState() {
    super.initState();
    postList = List.from(widget.data[0]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((value) => {
          setState(() {
            bannerPostAd = BannerAd(
              size: AdSize.mediumRectangle,
              adUnitId: adState.adUnitId,
              listener: adState.adListener,
              request: AdRequest(),
            )..load();
          })
        });
  }

  Widget build(BuildContext context) {
    return PageDesign(
      withSafeTop: true,
      withAppBar: false,
      children: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: widget.data.length,
              itemBuilder: (BuildContext context, int index) {
                print(widget.data[0]);
                return MuffesPost(
                  id: widget.data[index]['id'],
                  username: widget.username.toString(),
                  textContent: widget.data[index]['content'].toString(),
                  profilePicture: "https://api.muffes.com/v1/user/avatar/1",
                  displayName: widget.displayName.toString(),
                  story: true,
                  storyWatched: true,
                  files: widget.data[index]['files_count'],
                  token: widget.userToken,
                  isLikedCount: widget.data[index]['is_liked_count'],
                );
              })
        ]),
      ),
      pageTitle: "${widget.username}'s posts",
      actionChildren: Container(),
    );
  }
}
