import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = ScrollController();
  List<int> _numbersList = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addNewImages();

    _scrollController.addListener(() {
      print("scroll");

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _addNewImages();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listas"),
        ),
        body: Stack(
          children: [_createList(), _createLoading()],
        ));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _getFirstPage,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (context, index) {
          final image = _numbersList[index];

          return FadeInImage(
              placeholder: AssetImage("assets/jar-loading.gif"),
              image:
                  NetworkImage("https://picsum.photos/500/300?random=$image"));
        },
        itemCount: _numbersList.length,
      ),
    );
  }

  Future _getFirstPage() async {
    final duration = new Duration(seconds: 2);
    Timer(duration, () {
      _numbersList.clear();
      _lastItem++;
      _addNewImages();
    });
    return Future.delayed(duration);
  }

  void _addNewImages() {
    for (var i = 1; i <= 10; i++) {
      _lastItem++;
      _numbersList.add(_lastItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, httpResponse);
  }

  void httpResponse() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _addNewImages();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    }
    return Container();
  }
}
