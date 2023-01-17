import 'package:flutter/material.dart';
import 'package:flutter_v2ex/http/dio_web.dart';

import 'package:flutter_v2ex/models/web/item_tab_topic.dart';
import 'package:flutter_v2ex/models/web/model_topic_fav.dart';

import 'package:flutter_v2ex/components/home/list_item.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> with AutomaticKeepAliveClientMixin {
  late Future<FavTopicModel> topicListFuture;

  // 页面缓存
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    topicListFuture = getTopics();
  }

  Future<FavTopicModel> getTopics() async {
    return await DioRequestWeb.getFavTopics(1);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('收藏'),
      ),
      body: FutureBuilder<FavTopicModel>(
        future: topicListFuture,
        builder: (context, snapshot) {
          Widget widget;
          if (snapshot.hasError) {
            widget = const Icon(
              Icons.error,
              color: Colors.red,
              size: 48,
            );
          }
          if (snapshot.hasData) {
            widget = showRes(snapshot);
          } else {
            widget = showLoading();
          }
          return widget;
        },
      ),
    );
  }

  Widget showRes(snapshot) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(right: 12, top: 8, left: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: RefreshIndicator(
        onRefresh: () {
          setState(() {
            topicListFuture = getTopics();
          });
          return topicListFuture;
        },
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 1, bottom: 0),
          physics: const ClampingScrollPhysics(), //重要
          itemCount: snapshot.data.topicList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListItem(topic: snapshot.data!.topicList[index]);
          },
        ),
      ),
    );
  }

  Widget showLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            strokeWidth: 3,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
