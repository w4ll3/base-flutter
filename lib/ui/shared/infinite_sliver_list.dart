import 'package:flutter/material.dart';

typedef Widget RowBuilder(BuildContext context, item, int index);
typedef void OnNewPage(int page);

class InfiniteSliverList extends StatefulWidget {
  const InfiniteSliverList({
    @required this.stream,
    @required this.rowBuilder,
    @required this.onNewPage,
    this.initialWidget,
    this.noDataWidget,
    this.loadingIndicator,
    this.infiniteSliverListData,
    key,
  }) : super(key: key);

  final InfiniteSliverListData infiniteSliverListData;
  final Stream stream;
  final RowBuilder rowBuilder;
  final OnNewPage onNewPage;
  final Widget initialWidget;
  final Widget noDataWidget;
  final Widget loadingIndicator;

  @override
  _InfiniteSliverListState createState() =>
      _InfiniteSliverListState(data: infiniteSliverListData);
}

class _InfiniteSliverListState extends State<InfiniteSliverList> {
  _InfiniteSliverListState({InfiniteSliverListData data}) {
    if (data == null) {
      this.data = InfiniteSliverListData(page: 1, lastLength: 0);
    } else {
      this.data = data;
    }
  }

  InfiniteSliverListData data;
  @override
  void initState() {
    widget.onNewPage(data.page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          data.lastLength = 0;
          return SliverToBoxAdapter(
            child:
                widget.initialWidget ?? widget.loadingIndicator ?? Container(),
          );
        }
        return SliverList(
            delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if (index < snapshot.data.length) {
              return widget.rowBuilder(context, snapshot.data[index], index);
            } else if (index > 0 && data.lastLength != snapshot.data.length) {
              data.lastLength = snapshot.data.length;
              widget.onNewPage(++data.page);
              return widget.loadingIndicator ?? Container();
            } else {
              return data.lastLength == 0 ? widget.noDataWidget : null;
            }
          },
          childCount: snapshot.data.length + 1,
        ));
      },
    );
  }
}

class InfiniteSliverListData {
  InfiniteSliverListData({this.page = 1, this.lastLength = 0});
  int page;
  int lastLength;

  void setDefault() {
    page = 1;
    lastLength = 0;
  }
}
