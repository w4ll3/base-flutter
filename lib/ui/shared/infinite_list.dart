import 'package:flutter/material.dart';

typedef Widget RowBuilder(BuildContext context, item, int index);
typedef void OnNewPage(int page);

class InfiniteList extends StatefulWidget {
  const InfiniteList({
    @required this.stream,
    @required this.rowBuilder,
    @required this.onNewPage,
    this.initialWidget,
    this.noDataWidget,
    this.loadingIndicator,
    this.infiniteListData,
    key,
  }) : super(key: key);

  final InfiniteListData infiniteListData;
  final Stream stream;
  final RowBuilder rowBuilder;
  final OnNewPage onNewPage;
  final Widget initialWidget;
  final Widget noDataWidget;
  final Widget loadingIndicator;

  @override
  _InfiniteListState createState() =>
      _InfiniteListState(data: infiniteListData);
}

class _InfiniteListState extends State<InfiniteList> {
  _InfiniteListState({InfiniteListData data}) {
    if (data == null) {
      this.data = InfiniteListData(page: 1, lastLength: 0);
    } else {
      this.data = data;
    }
  }

  InfiniteListData data;
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
          return SingleChildScrollView(
            child:
                widget.initialWidget ?? widget.loadingIndicator ?? Container(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data.length + 1,
          itemBuilder: (BuildContext context, int index) {
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
        );
      },
    );
  }
}

class InfiniteListData {
  InfiniteListData({this.page = 1, this.lastLength = 0});
  int page;
  int lastLength;

  void setDefault() {
    page = 1;
    lastLength = 0;
  }
}
