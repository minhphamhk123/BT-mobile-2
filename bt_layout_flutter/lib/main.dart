import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Post {
  final String username;
  final String description;
  final int commentCount;

  Post({required this.username, required this.description, required this.commentCount});
}

List<Post> posts = [
  Post(username: 'User 1', description: 'Post 1 description', commentCount: 5),
  Post(username: 'User 2', description: 'Post 2 description', commentCount: 3),
  Post(username: 'User 3', description: 'Post 3 description', commentCount: 7),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<IconData> iconDataList = [
    Icons.account_circle_rounded,
    Icons.account_circle_rounded,
    Icons.account_circle_rounded,
    Icons.account_circle_rounded,
    Icons.account_circle_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
            child: Column(
// Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 150.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: iconDataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: Icon(
                              iconDataList[index],
                              size: 80,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(child: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.person),
                                  Text(posts[index].username),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child:
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(posts[index].description),
                                        ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child:
                                      TextButton(
                                        onPressed: () {


                                        },
                                        child: Text('View Comment'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            const ExpansionTile(
                                leading: Icon(Icons.message),
                                title: Text('Comment Section'),
                                /*trailing: TextButton(
                                  onPressed: () {
                                    // Handle View Comment button tap
                                  },
                                  child: Text('View Comment'),
                                ),*/
                                children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Something'),
                                    )
                                ]
                            )
                        ]
                        )
                        );
                      }
                  )
                  )
                ]
            )
        )
    );
  }
}
