// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:math' as math;

// Each TabBarView contains a _Page and for each _Page there is a list
// of _CardData objects. Each _CardData object is displayed by a _CardItem.

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';
const int headerHeight = 30;

class _Page {
  _Page({ this.label });
  final String label;
  String get id => label[0];
  @override
  String toString() => '$runtimeType("$label")';
}

class _CardData {
  const _CardData({ this.title, this.imageAsset, this.imageAssetPackage });
  final String title;
  final String imageAsset;
  final String imageAssetPackage;
}

final Map<_Page, List<_CardData>> _allPages = <_Page, List<_CardData>>{
  new _Page(label: 'LEFT'): <_CardData>[
    const _CardData(
      title: 'Vintage Bluetooth Radio',
      imageAsset: 'shrine/products/radio.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
  ],
  new _Page(label: 'RIGHT'): <_CardData>[
    const _CardData(
      title: 'Clock',
      imageAsset: 'shrine/products/clock.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
  ],
  new _Page(label: 'RIGHT2'): <_CardData>[
    const _CardData(
      title: 'Beachball',
      imageAsset: 'shrine/products/beachball.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
  ],
};

class _CardDataItem extends StatelessWidget {
  const _CardDataItem({ this.page, this.data });

  static const double height = 272.0;
  final _Page page;
  final _CardData data;

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Padding(
        padding: const EdgeInsets.all(5.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Align(
              alignment: page.id == 'L'
                ? Alignment.centerLeft
                : Alignment.centerRight,
              child: new CircleAvatar(child: new Text('${page.id}')),
            ),
            new SizedBox(
              width: 144.0,
              height: 144.0,
              child: new Image.asset(
                data.imageAsset,
                package: data.imageAssetPackage,
                fit: BoxFit.contain,
              ),
            ),
            new Center(
              child: new Text(
                data.title,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class TabsDemo extends StatefulWidget {
  const TabsDemo({ Key key, this.light }) : super(key: key);

  final bool light;

  @override
  _TabsDemoState createState() => new _TabsDemoState();
}

class _TabsDemoState extends State<TabsDemo> {
  static const String routeName = '/material/tabs';
  bool _logoHasName = true;
  bool _logoHorizontal = true;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: _allPages.length,
      child: new GestureDetector(
        // ボタン長押し
        onLongPress: () {
          setState(() {
            _logoHorizontal = !_logoHorizontal;
            if (!_logoHasName)
              _logoHasName = true;
          });
        },
        // タップイベント
        onTap: () {
          setState(() {
            _logoHasName = !_logoHasName;
          });
        },
        child: new Scaffold(
          body: new NestedScrollView(
              // スクロールの初期位置
              controller: new ScrollController(
                initialScrollOffset: -50.0,
              ),
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  child: new SliverAppBar(
                    title: const Text('Tabs and scrolling'),
                    pinned: false,
                    primary: true,
                    snap: false,
                    expandedHeight: 2.0,
                    forceElevated: innerBoxIsScrolled,
  // コメントアウトを外すとタブが出現
  //                  bottom: new TabBar(
  //                    tabs: _allPages.keys.map(
  //                      (_Page page) => new Tab(text: page.label),
  //                    ).toList(),
  //                  ),
                  ),
                ),
              ];
            },
            body: new TabBarView(
              children: _allPages.keys.map((_Page page) {
                return new SafeArea(
                  top: false,
                  bottom: false,
                  child: new Builder(
                    builder: (BuildContext context) {
                      return new CustomScrollView(
                        key: new PageStorageKey<_Page>(page),
                        slivers: <Widget>[
                          new SliverOverlapInjector(
                            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                          ),
                          new SliverPadding(
                            padding: const EdgeInsets.symmetric(
  //                            vertical: 8.0,
                              horizontal: 2.0,
                            ),
                            sliver: new SliverFixedExtentList(
                              itemExtent: MediaQuery.of(context).size.height,
                              delegate: new SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  final _CardData data = _allPages[page][index];
                                  return new Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    child: new _CardDataItem(
                                      page: page,
                                      data: data,
                                    ),
                                  );
                                },
                                childCount: _allPages[page].length,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
