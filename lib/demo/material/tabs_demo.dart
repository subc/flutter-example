// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
        padding: const EdgeInsets.all(2.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new SizedBox(
//              width: 144.0,
              height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 18), // ディスプレイの高さ基準で計算
              child: new Padding(
                padding: new EdgeInsets.only(top: (MediaQuery.of(context).size.height / 18)), // viewerの上部空白
                child: _buildDocuments(),
              ),
            ),
            new Center(
              child: new Text(
                '- 10 -', // ページ番号
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocuments(){
    double table_row_height = 20.0;
    String s = "　吾輩は人間と同居して彼等を観察すればするほど";
    String s2 = "彼等は我儘わがままなものだと断言せざるを得ないようになった。";
    String s3 = "ことに吾輩が時々同衾どうきんする小供のごときに至っては言語同断ごんごどうだんである";
    return new DefaultTextStyle(
//      maxLines: 1, // 最大行数
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontFamily: 'NasuM',
        textBaseline: TextBaseline.ideographic,
        letterSpacing: 1.24, // 水平方向の文字の詰め方
        wordSpacing: -5.24,
        fontSize: 20.0,
        color: CupertinoColors.black,
        decorationStyle: TextDecorationStyle.wavy,
      ),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: new Table(
          defaultColumnWidth: const FixedColumnWidth(24.0),
//          columnWidths: const <int, TableColumnWidth>{
//            0: const FixedColumnWidth(24.0),
//            1: const FixedColumnWidth(24.0),
//            2: const FixedColumnWidth(24.0),
//            3: const FixedColumnWidth(24.0),
//            4: const FixedColumnWidth(24.0),
//            5: const FixedColumnWidth(24.0),
//            6: const FixedColumnWidth(24.0),
//            7: const FixedColumnWidth(24.0),
//            8: const FixedColumnWidth(24.0),
//          },
          children: <TableRow>[
            new TableRow(
                children: <Widget>[
                  new SizedBox(
                    child: new Text("あ",),
                  ),
                  new SizedBox(
                    child: new Text("あ",),
                  ),
                  new SizedBox(
                    child: new Text("あ",),
                  ),
                  new SizedBox(
                    child: new Text("あ",),
                  ),
                  new SizedBox(
                    child: new Text("あ",),
                  ),
//                  new TableCell(
//                      verticalAlignment: TableCellVerticalAlignment.middle,
//                      child: new Text("い",),
//                  ),
//                  new TableCell(
//                      verticalAlignment: TableCellVerticalAlignment.middle,
//                      child: new Text("u",),
//                  ),
//                  new TableCell(
//                      verticalAlignment: TableCellVerticalAlignment.middle,
//                      child: new Text("え",),
//                  ),
//                  new TableCell(
//                      verticalAlignment: TableCellVerticalAlignment.middle,
//                      child: new Text("o",),
//                  ),
                ]
            ),
            new TableRow(
                children: <Widget>[
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("あ",),
                  ),
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("i",),
                  ),
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("あ",),
                  ),
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("あ",),
                  ),
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("あ",),
                  ),
                ]
            ),
            new TableRow(
                children: <Widget>[
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("あ",),
                  ),
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("i",),
                  ),
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("あ",),
                  ),
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("あ",),
                  ),
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("あ",),
                  ),
                ]
            ),
            new TableRow(
                children: <Widget>[
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("あ",),
                  ),
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("i",),
                  ),
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("あ",),
                  ),
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("あ",),
                  ),
                  new SizedBox(
                    height: table_row_height,
                    child: new Text("あ",),
                  ),
                ]
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
  bool _showPageSlideBar = false;
  Slider pageSlider;
  double _progress = 25.0;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: _allPages.length,
      child: new GestureDetector(
        // ボタン長押し
        onLongPress: () {
          setState(() {
            print('onLongPress');
            _showShoppingCart();
            _logoHorizontal = !_logoHorizontal;
            if (!_logoHasName)
              _logoHasName = true;
          });
        },
        // タップイベント
        onTap: () {
          setState(() {
            print('onTap');
            _logoHasName = !_logoHasName;
            _showPageSlideBar = !_showPageSlideBar; // ページ選択の出力可否切り替え
          });
        },
        child: new Scaffold(
          body: _buildCenter()
        ),
      ),
    );
  }

  Center _buildCenter(){
    return new Center(
      child: _buildNestedScrollView()
    );
  }

  NestedScrollView _buildNestedScrollView(){
    return new NestedScrollView(
      // スクロールの初期位置
      controller: new ScrollController(
        initialScrollOffset: -50.0,
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {

        // 特定の条件のときウィジェットを生成する
        print('NestedScrollView body');
        pageSlider = _buildSlider();

        // 本来のUI描写
        return <Widget>[
          new SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            child: new SliverAppBar(
              title: const Text('novel viewer'),
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
      body: _buildTabBarView()
    );
  }

  TabBarView _buildTabBarView() {
    return new TabBarView(
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
                          return _buildViewerContent(page, data);
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
    );
  }

  Widget _buildViewerContent(_Page page, _CardData data){
    var contents;
    if (_showPageSlideBar){
      contents = [pageSlider, new _CardDataItem(page: page, data: data,)];
    }
    else {
      contents = [new _CardDataItem(page: page, data: data,)];
    }

    return new Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
      ),
      child: new Column(
          children: contents
      ),
    );
  }

  Slider _buildSlider() {
    return new Slider(
      value: _progress,
      min: 0.0,
      max: 100.0,
      onChanged: (double value) {
        setState(() {
          _progress = value;
        });
      }
    );
  }

  void _showShoppingCart() {
    final ThemeData theme = Theme.of(context);
    showModalBottomSheet<Null>(context: context, builder: (BuildContext context) {
      return new Container(
        padding: const EdgeInsets.all(0.0),
        height: MediaQuery.of(context).size.height / 9, // 高さは画面全体の1/n割
        child: new AppBar(
          iconTheme: theme.iconTheme,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title: new Text('page', style: theme.textTheme.title.copyWith(color: Colors.black54)),
          centerTitle: true,
          actions: <Widget>[
            // 前ページ
            new IconButton(
                icon: const Icon(Icons.skip_previous),
                tooltip: 'previous page',
                onPressed: _showPrevPage
            ),
            // 次ページ
            new IconButton(
                icon: const Icon(Icons.skip_next),
                tooltip: 'next page',
                onPressed: _showNextPage
            ),
          ],
          ),
        );
      }
    );
  }

  void _showPrevPage(){
    print('show Prev Page');
  }

  void _showNextPage(){
    print('show Next Page');
  }
}
