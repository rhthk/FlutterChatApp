import 'package:flutter/material.dart';
class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Sliver'),
            floating: true,
            flexibleSpace: Container(
              child: Center(child: Hero(
                  tag: args['name'],
                  child: Icon(Icons.account_box, size: 100,))),
            ),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 100,
            ),
          )
        ],
      ),
    );
  }
}
