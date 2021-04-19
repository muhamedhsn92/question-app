import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: 20,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/35297160?v=4'),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Chats',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.search),
                      SizedBox(
                        width: 20,
                      ),
                      Text('search'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildStoreyItem(),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20,
                    ),
                    itemCount: 7,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildChatItem(),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 30,
                        ),
                    itemCount: 12)
              ],
            ),
          ),
        ));
  }

  Widget buildStoreyItem() {
    return Container(
      width: 60,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/35297160?v=4'),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 3, bottom: 3),
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.red,
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Muhamed Hassan abd elkader ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget buildChatItem() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/35297160?v=4'),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(end: 3, bottom: 3),
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.red,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Muhamed hassan abd elkader hassan  hassan abd elkader hassan',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Message from magdi hassan about going to meeting office now ',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Text('05:00 PM'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
