import 'dart:async';
import 'dart:io';

import 'package:flutter_app/globals.dart' as globals;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

final String name = 'madira_test';
final String kTestString = 'test';

void main() async {
  print("start");
  WidgetsFlutterBinding.ensureInitialized();

  final FirebaseOptions options = const FirebaseOptions(
    googleAppID: '1:668312398180:android:0043f8431f6989ae733271',
    gcmSenderID: '668312398180',
    apiKey: 'AIzaSyAG6nkQB3kWQWifGyFrnQdjoyR_XMVniS4',
  );
  final FirebaseApp app= await FirebaseApp.configure(
    name: name,
    options: options,
  );
  final FirebaseStorage storage = FirebaseStorage(
      app: app, storageBucket: 'gs://shrine00-21700.appspot.com');
  globals.storage=storage;
//  print(storage);
  print("end");

//    StorageHomePageApp map=new StorageHomePageApp(storage: storage);
}

class StorageHomePage {
  //final User user;
  //HomePage(this.user);

//  void main() async {
//    WidgetsFlutterBinding.ensureInitialized();
//
//    final FirebaseOptions options = const FirebaseOptions(
//      googleAppID: '1:668312398180:android:0043f8431f6989ae733271',
//      gcmSenderID: '668312398180',
//      apiKey: 'AIzaSyAG6nkQB3kWQWifGyFrnQdjoyR_XMVniS4',
//    );
//    final FirebaseApp app= await FirebaseApp.configure(
//      name: name,
//      options: options,
//    );
//    final FirebaseStorage storage = FirebaseStorage(
//        app: app, storageBucket: 'gs://shrine00-21700.appspot.com');
//
////    StorageHomePageApp map=new StorageHomePageApp(storage: storage);
//  }

}
class StorageHomePageApp extends StatelessWidget {
//  StorageHomePageApp({this.storage});
//  FirebaseStorage storage;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storage',
      home: StorageMyHomePage(),
    );
  }
}
class StorageMyHomePage extends StatefulWidget {
  StorageMyHomePage();

//    StorageHomePage();
//    storage=globals.storage;
  @override
  _StorageHomePageState createState() => _StorageHomePageState();
}

class _StorageHomePageState extends State<StorageMyHomePage> {
  _StorageHomePageState();
  FirebaseStorage storage;



  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<StorageUploadTask> _tasks = <StorageUploadTask>[];

  Future<void> _uploadFile() async {
    final String uuid = Uuid().v1();
    final Directory systemTempDir = Directory.systemTemp;
    final File file = await File('${systemTempDir.path}/foo$uuid.txt').create();
    await file.writeAsString(name);
    assert(await file.readAsString() == kTestString);
    final StorageReference ref =
    widget.storage.ref().child('text').child('foo$uuid.txt');
    final StorageUploadTask uploadTask = ref.putFile(
      file,
      StorageMetadata(
        contentLanguage: 'en',
        customMetadata: <String, String>{'activity': 'test'},
      ),
    );

    setState(() {
      _tasks.add(uploadTask);
    });
  }

  Future<void> _downloadFile(StorageReference ref) async {
    final String url = await ref.getDownloadURL();
    final String uuid = Uuid().v1();
    final http.Response downloadData = await http.get(url);
    final Directory systemTempDir = Directory.systemTemp;
    final File tempFile = File('${systemTempDir.path}/tmp$uuid.txt');
    if (tempFile.existsSync()) {
      await tempFile.delete();
    }
    await tempFile.create();
    assert(await tempFile.readAsString() == "");
    final StorageFileDownloadTask task = ref.writeToFile(tempFile);
    final int byteCount = (await task.future).totalByteCount;
    final String tempFileContents = await tempFile.readAsString();
    assert(tempFileContents == kTestString);
    assert(byteCount == kTestString.length);

    final String fileContents = downloadData.body;
    final String name = await ref.getName();
    final String bucket = await ref.getBucket();
    final String path = await ref.getPath();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        'Success!\n Downloaded $name \n from url: $url @ bucket: $bucket\n '
            'at path: $path \n\nFile contents: "$fileContents" \n'
            'Wrote "$tempFileContents" to tmp.txt',
        style: const TextStyle(color: Color.fromARGB(255, 0, 155, 0)),
      ),
    ));
  }

//  void main(FirebaseStorage storage) async {
//    WidgetsFlutterBinding.ensureInitialized();
//
//    final FirebaseOptions options = const FirebaseOptions(
//      googleAppID: '1:668312398180:android:0043f8431f6989ae733271',
//      gcmSenderID: '668312398180',
//      apiKey: 'AIzaSyAG6nkQB3kWQWifGyFrnQdjoyR_XMVniS4',
//    );
//    final FirebaseApp app= await FirebaseApp.configure(
//      name: name,
//      options: options,
//    );
//    storage = FirebaseStorage(
//        app: app, storageBucket: 'gs://shrine00-21700.appspot.com');
//
////    StorageHomePageApp map=new StorageHomePageApp(storage: storage);
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    main(storage);
////    StorageHomePage();
////    storage=globals.storage;
//
//  }

  @override
  void initState(){
    super.initState();
    print("hi");
    main();
    storage=globals.storage;
    StorageReference listRef=storage.ref().child("products");
    listRef.listAll()

  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    _tasks.forEach((StorageUploadTask task) {
      final Widget tile = UploadTaskListTile(
        task: task,
        onDismissed: () => setState(() => _tasks.remove(task)),
        onDownload: () => _downloadFile(task.lastSnapshot.ref),
      );
      children.add(tile);
    });
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter Storage Example'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed:
            _tasks.isNotEmpty ? () => setState(() => _tasks.clear()) : null,
          )
        ],
      ),
      body: ListView(
        children: children,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _uploadFile,
        tooltip: 'Upload',
        child: const Icon(Icons.file_upload),
      ),
    );
  }
}

class UploadTaskListTile extends StatelessWidget {
  const UploadTaskListTile(
      {Key key, this.task, this.onDismissed, this.onDownload})
      : super(key: key);

  final StorageUploadTask task;
  final VoidCallback onDismissed;
  final VoidCallback onDownload;

  String get status {
    String result;
    if (task.isComplete) {
      if (task.isSuccessful) {
        result = 'Complete';
      } else if (task.isCanceled) {
        result = 'Canceled';
      } else {
        result = 'Failed ERROR: ${task.lastSnapshot.error}';
      }
    } else if (task.isInProgress) {
      result = 'Uploading';
    } else if (task.isPaused) {
      result = 'Paused';
    }
    return result;
  }

  String _bytesTransferred(StorageTaskSnapshot snapshot) {
    return '${snapshot.bytesTransferred}/${snapshot.totalByteCount}';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StorageTaskEvent>(
      stream: task.events,
      builder: (BuildContext context,
          AsyncSnapshot<StorageTaskEvent> asyncSnapshot) {
        Widget subtitle;
        if (asyncSnapshot.hasData) {
          final StorageTaskEvent event = asyncSnapshot.data;
          final StorageTaskSnapshot snapshot = event.snapshot;
          subtitle = Text('$status: ${_bytesTransferred(snapshot)} bytes sent');
        } else {
          subtitle = const Text('Starting...');
        }
        return Dismissible(
          key: Key(task.hashCode.toString()),
          onDismissed: (_) => onDismissed(),
          child: ListTile(
            title: Text('Upload Task #${task.hashCode}'),
            subtitle: subtitle,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Offstage(
                  offstage: !task.isInProgress,
                  child: IconButton(
                    icon: const Icon(Icons.pause),
                    onPressed: () => task.pause(),
                  ),
                ),
                Offstage(
                  offstage: !task.isPaused,
                  child: IconButton(
                    icon: const Icon(Icons.file_upload),
                    onPressed: () => task.resume(),
                  ),
                ),
                Offstage(
                  offstage: task.isComplete,
                  child: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () => task.cancel(),
                  ),
                ),
                Offstage(
                  offstage: !(task.isComplete && task.isSuccessful),
                  child: IconButton(
                    icon: const Icon(Icons.file_download),
                    onPressed: onDownload,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
