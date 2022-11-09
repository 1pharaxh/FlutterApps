import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
List <CameraDescription>? camera;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  camera = await availableCameras();
  print(camera);
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false, theme: ThemeData(primaryColor: Colors.redAccent),));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  @override
  void initState()  {
    super.initState();
     loadCamera();
     loadmodel();
  }

  loadCamera() {
    cameraController = CameraController(camera![0], ResolutionPreset.medium, imageFormatGroup: ImageFormatGroup.yuv420,);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageSteam) {
            cameraImage = imageSteam;
            runModel();
          });
        });
      }
    });
  }
runModel() async {
    if (cameraImage! != null){
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {return plane.bytes;}).toList(),// required
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 180,
          numResults: 2,
          threshold: 0.1,
          asynch: true
      );
      predictions!.forEach((element) {
        setState(() {
          print('ELEMENT IS${element}');
          output = element['label'];
        });
      });
      print('OUTPUT IS${output}');
    }

}
loadmodel() async {
    var res = await Tflite.loadModel(model: "assets/model.tflite", labels: "assets/labels.txt",
        numThreads: 2, // defaults to 1
        isAsset: true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate: false);

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.redAccent, title: Text('AI🤖'), centerTitle: true,),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height*0.7,
            width: MediaQuery.of(context).size.width,
            child: !cameraController!.value.isInitialized ? Container() : AspectRatio(aspectRatio: cameraController!.value.aspectRatio,
            child: CameraPreview(cameraController!),),
          )
          ),
          Text(output, style: TextStyle(
            backgroundColor: Colors.white,
            fontSize: 30
          ),)
        ],
      )
    );
  }
}

