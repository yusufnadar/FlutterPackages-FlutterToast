import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToastPage extends StatefulWidget {
  const FlutterToastPage({Key? key}) : super(key: key);

  @override
  _FlutterToastPageState createState() => _FlutterToastPageState();
}

class _FlutterToastPageState extends State<FlutterToastPage> {
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Toast'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: 'Flutter Toast İlk Kullanım',
                    toastLength: Toast.LENGTH_LONG,
                    backgroundColor: Colors.red);
              },
              child: const Text('Flutter Default Toast'),
            ),
            ElevatedButton(
              onPressed: () {
                Fluttertoast.cancel();
              },
              child: const Text('Flutter Default Toast Remove'),
            ),
            ElevatedButton(
              onPressed: () {
                fToast!.showToast(
                  gravity: ToastGravity.BOTTOM,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'İşlem Başarılı',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  toastDuration: const Duration(seconds: 3),
                );
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text('Flutter Our Toast'),
            ),
            ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.green),onPressed: (){
              fToast!.removeCustomToast();
            }, child: const Text('Flutter Our Toast Remove One')),
            ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.green),onPressed: (){
              fToast!.removeQueuedCustomToasts();
            }, child: const Text('Flutter Our Toast Remove All'))
          ],
        ),
      ),
    );
  }
}
