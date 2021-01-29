import 'package:flutter/material.dart';
class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(args['fname']),
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                    tag: args['fname'],
                   child: Container(
                     child: Image.network(
                       args['image'],
                       fit: BoxFit.cover,
                       loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                         if (loadingProgress == null) return child;
                         return Center(
                           child: CircularProgressIndicator(
                             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                             //valueColor: AlwaysStoppedAnimation<Color>(GLOBALS.difficultyMap[boulderList[index].difficulty]),
                             value: loadingProgress.expectedTotalBytes != null ?
                             loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                 : null,
                           ),
                         );
                       },
                     ),
                   ),
                ),
              ),
              expandedHeight: 200,
              stretch: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Divider(),
                ListTile(
                  title: Text(args['fname'].toString()+" "+args['lname'].toString(),style: TextStyle(fontSize: 30.0),),
                ),
                Divider(),
                ListTile(
                  title: Text(args['status']),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
