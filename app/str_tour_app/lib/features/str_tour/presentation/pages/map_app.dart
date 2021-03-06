import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
// import 'package:str_tour_app/features/str_tour/presentation/pages/virtual_tour.dart';
// import 'package:url_launcher/url_launcher.dart';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:js' as js;

class MyMap extends StatefulWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  final controller = MapController(
    location: LatLng(53.627707141967356, 55.93648481080392),
  );

  bool _darkMode = false;

  final markers = [
    LatLng(53.627707141967356, 55.93648481080392),
    //LatLng(35.676, 51.41),
    //LatLng(35.678, 51.41),
    //LatLng(35.68, 51.41),
    //LatLng(35.682, 51.41),
    //LatLng(35.684, 51.41),
    //LatLng(35.686, 51.41),
  ];

  void _gotoDefault() {
    controller.center = LatLng(53.627707141967356, 55.93648481080392);
    setState(() {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => WebViewPage()));
    });
  }

  void _onDoubleTap() {
    controller.zoom += 0.5;
    setState(() {});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      controller.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Widget _buildMarkerWidget(
      {required Offset pos,
      required Color color,
      required String icon,
      required String url,
      required String title}) {
    return Positioned(
      left: pos.dx - 16,
      top: pos.dy - 16,
      width: 200,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                // js.context.callMethod('open', [url]);
              },
              child: Image(image: AssetImage(icon), width: 50, height: 50),
            ),
          ),
          const SizedBox(width: 3),
          SizedBox(
            width: 100,
            height: 50,
            child: Text(
              title,
              style: TextStyle(
                  color: !_darkMode ? color : Colors.white,
                  inherit: true,
                  fontSize: 10),
            ),
          )

          // icon
          //  IconButton(
          //   icon: icon,
          //   color: color,
          //   iconSize: 40,
          //   onPressed: () {
          //     // Navigator.push(
          //     //   context,
          //     //  MaterialPageRoute(builder: (context) => WebViewPage()));
          //     // MaterialPageRoute(builder: (context) => _launchURL()));
          //     js.context.callMethod(
          //         'open', ['http://sonofmqe.beget.tech/park_gagarina']);
          //   }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('?????????? ????????????????????????'),
        actions: [
          IconButton(
            tooltip: 'Toggle Dark Mode',
            onPressed: () {
              setState(() {
                _darkMode = !_darkMode;
              });
            },
            icon: const Icon(Icons.wb_sunny),
          ),
        ],
      ),
      body: MapLayoutBuilder(
        controller: controller,
        builder: (context, transformer) {
          // final markerPositions =
          //  markers.map(transformer.fromLatLngToXYCoords).toList();

          // final markerWidgets = markerPositions.map(
          // (pos) => _buildMarkerWidget(pos, Colors.red),
          //  );

          // final homeLocation =
          //     transformer.fromLatLngToXYCoords(LatLng(53.647531, 55.946773));

          // final homeMarkerWidget =
          //     _buildMarkerWidget(homeLocation, Colors.black);

          final parkGagarina = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.647531, 55.946773)),
              color: const Color.fromARGB(255, 2, 62, 4),
              icon: 'assets/icons/park.png',
              url: 'http://sonofmqe.beget.tech/park_gagarina',
              title: '???????? ???????????????? ?? ???????????? ?????????? ??.??. ????????????????');

          final parkZhykov = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.628821, 55.921758)),
              color: const Color.fromARGB(255, 2, 62, 4),
              icon: 'assets/icons/park.png',
              url: '',
              title: '???????? ?????????? ???????????? ??.??.');

          final parkPobedi = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.630899, 55.926776)),
              color: const Color.fromARGB(255, 2, 62, 4),
              icon: 'assets/icons/park.png',
              url: '',
              title: '???????? ????????????');

          final pictureGallery = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.619338, 55.907182)),
              color: Colors.black,
              icon: 'assets/icons/museum.png',
              url: '',
              title: '?????????????????? ?????????????? ?????????? ??. ??. ??????????????????');

          // final citySquare = _buildMarkerWidget(
          //     pos: transformer
          //         .fromLatLngToXYCoords(LatLng(53.618756, 55.963194)),
          //     color: Colors.grey,
          //     icon: 'assets/icons/square.png',
          //     url: '',
          //     title: '?????????? ?????????? ?????????????? ????????????');

          final russianDramaTheater = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.619647, 55.962643)),
              color: const Color.fromARGB(255, 179, 110, 6),
              icon: 'assets/icons/theater-masks.png',
              url: '',
              title: '?????????????? ?????????????????????????? ??????????');

          final stateTheater = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.637227, 55.935659)),
              color: const Color.fromARGB(255, 179, 110, 6),
              icon: 'assets/icons/theater-masks.png',
              url: '',
              title:
                  '?????????????????????????????? ?????????????????????????????? ????????????????????-???????????????????? ??????????????????????');

          final museumOfHistoryAndLocalLore = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.617121, 55.964656)),
              color: Colors.black,
              icon: 'assets/icons/culture.png',
              url: '',
              title: '????????????????-?????????????????????????? ??????????');

          final parkKirova = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.620912, 55.967538)),
              color: const Color.fromARGB(255, 2, 62, 4),
              icon: 'assets/icons/park.png',
              url: '',
              title: '???????? ?????????? ????????????');

          final parkSodovik = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.642703, 55.972755)),
              color: const Color.fromARGB(255, 2, 62, 4),
              icon: 'assets/icons/park.png',
              url: '',
              title: '???????? ???????????????? ?? ???????????? ??????????????');

          final adminisrtation = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.630325, 55.905990)),
              color: Colors.black,
              icon: 'assets/icons/gerb.png',
              url: '',
              title:
                  '?????????????????????????? ???????????????????? ???????????? ?????????? ?????????????????????? ???????????????????? ????????????????????????');

          final sodaHouseCulture = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.642708, 55.964948)),
              color: Colors.black,
              icon: 'assets/icons/culture.png',
              url: '',
              title: '???????? ???????????????? ?? ???????????? ??????????????');

          // final centerLocation = Offset(
          //     transformer.constraints.biggest.width / 2,
          //     transformer.constraints.biggest.height / 2);

          // final centerMarkerWidget =
          //     _buildMarkerWidget(centerLocation, Colors.purple);

          return GestureDetector(
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => WebViewPage()));
            // },
            behavior: HitTestBehavior.opaque,
            onDoubleTap: _onDoubleTap,
            onScaleStart: _onScaleStart,
            onScaleUpdate: _onScaleUpdate,
            onTapUp: (details) {
              final location =
                  transformer.fromXYCoordsToLatLng(details.localPosition);

              final clicked = transformer.fromLatLngToXYCoords(location);

              // ignore: avoid_print
              print('${location.longitude}, ${location.latitude}');
              // ignore: avoid_print
              print('${clicked.dx}, ${clicked.dy}');
              // ignore: avoid_print
              print('${details.localPosition.dx}, ${details.localPosition.dy}');
            },
            child: Listener(
              behavior: HitTestBehavior.opaque,
              onPointerSignal: (event) {
                if (event is PointerScrollEvent) {
                  final delta = event.scrollDelta;

                  controller.zoom -= delta.dy / 1000.0;
                  setState(() {});
                }
              },
              child: Stack(
                children: [
                  Map(
                    controller: controller,
                    builder: (context, x, y, z) {
                      //Legal notice: This url is only used for demo and educational purposes. You need a license key for production use.

                      //Google Maps
                      final url =
                          'http://mt0.google.com/vt/lyrs=m&hl=en&x=$x&y=$y&z=$z&s=Ga';
                      //'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488';

                      // 'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

                      final darkUrl =
                          'http://mt0.google.com/vt/lyrs=s&hl=en&x=$x&y=$y&z=$z&s=Ga';
                      //Mapbox Streets
                      // final url =
                      //     'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/$z/$x/$y?access_token=YOUR_MAPBOX_ACCESS_TOKEN';

                      return CachedNetworkImage(
                        imageUrl: _darkMode ? darkUrl : url,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  //homeMarkerWidget,
                  //listObject(),
                  parkGagarina,
                  parkZhykov,
                  parkPobedi,
                  pictureGallery,
                  // citySquare,
                  russianDramaTheater,
                  stateTheater,
                  museumOfHistoryAndLocalLore,
                  parkKirova,
                  parkSodovik,
                  adminisrtation,
                  sodaHouseCulture,

                  // FlatButton(
                  //   onPressed: () => Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => WebViewPage())),
                  //   child: homeMarkerWidget,
                  // ),
                  //homeMarkerWidget,
                  //centerMarkerWidget,
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _gotoDefault,
        tooltip: 'My Location',
        child: const Icon(Icons.my_location),
      ),
    );
  }

  Widget listObject() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
      // decoration: ThemeProject().themeContainerWhite(),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
          children: [
            PopupMenuButton(
              shape: Border.all(
                color: Colors.green,
                width: 1.0,
                style: BorderStyle.solid,
              ),
              // icon: Icon(CupertinoIcons.money_rubl_circle),
              child: const Text(
                '???????????????? ??????????????????????????????????????????',
                // style: ThemeProject()
                //.themeGreenBattonTextStyle(context)
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text(
                    '???? ??????????????',
                    // style: ThemeProject()
                    //  .themeGreenBattonTextStyle(context)
                  ),
                  value: 1,
                  onTap: () {
                    setState(
                      () {
                        //   date = 'today';
                        //   head = '???????????? ???? ${time.day} ${month()}';
                        //   requestBonus();
                        // });
                        // listBonus.clear();
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// _launchURL() async {
//   const url = 'http://sonofmqe.beget.tech';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
