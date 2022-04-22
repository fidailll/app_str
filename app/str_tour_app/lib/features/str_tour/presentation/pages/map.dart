import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:str_tour_app/features/str_tour/presentation/pages/virtual_tour.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;

class MyMap extends StatefulWidget {
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
      width: 100,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              js.context.callMethod('open', ['$url']);
            },
            child: Image(image: AssetImage('$icon'), width: 40, height: 40),
          ),
          //SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(color: color, inherit: true, fontSize: 10),
          ),
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
        title: Text('Карта Стерлитамака'),
        actions: [
          IconButton(
            tooltip: 'Toggle Dark Mode',
            onPressed: () {
              setState(() {
                _darkMode = !_darkMode;
              });
            },
            icon: Icon(Icons.wb_sunny),
          ),
        ],
      ),
      body: MapLayoutBuilder(
        controller: controller,
        builder: (context, transformer) {
          final markerPositions =
              markers.map(transformer.fromLatLngToXYCoords).toList();

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
              color: Color.fromARGB(255, 2, 62, 4),
              icon: 'assets/icons/park.png',
              url: 'http://sonofmqe.beget.tech/park_gagarina',
              title: 'Парк культуры и отдыха имени Ю.А. Гагарина');

          final parkZhykov = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.628821, 55.921758)),
              color: Color.fromARGB(255, 2, 62, 4),
              icon: 'assets/icons/park.png',
              url: '',
              title: 'Парк имени Жукова Г.К.');

          final parkPobedi = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.630899, 55.926776)),
              color: Color.fromARGB(255, 2, 62, 4),
              icon: 'assets/icons/park.png',
              url: '',
              title: 'Парк Победы');

          final pictureGallery = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.619338, 55.907182)),
              color: Colors.black,
              icon: 'assets/icons/museum.png',
              url: '',
              title: 'Картинная галерея имени М. В. Нестерова');

          // final citySquare = _buildMarkerWidget(
          //     pos: transformer
          //         .fromLatLngToXYCoords(LatLng(53.618756, 55.963194)),
          //     color: Colors.grey,
          //     icon: 'assets/icons/square.png',
          //     url: '',
          //     title: 'Сквер имени Маршала Жукова');

          final russianDramaTheater = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.619647, 55.962643)),
              color: Color.fromARGB(255, 179, 110, 6),
              icon: 'assets/icons/theater-masks.png',
              url: '',
              title: 'Русский драматический театр');

          final stateTheater = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.637227, 55.935659)),
              color: Color.fromARGB(255, 179, 110, 6),
              icon: 'assets/icons/theater-masks.png',
              url: '',
              title:
                  'Стерлитамакское государственное театрально-концертное объединение');

          final museumOfHistoryAndLocalLore = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.617121, 55.964656)),
              color: Colors.black,
              icon: 'assets/icons/culture.png',
              url: '',
              title: 'Историко-краеведческий музей');

          final parkKirova = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.620912, 55.967538)),
              color: Color.fromARGB(255, 2, 62, 4),
              icon: 'assets/icons/park.png',
              url: '',
              title: 'Парк имени Кирова');

          final parkSodovik = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.642703, 55.972755)),
              color: Color.fromARGB(255, 2, 62, 4),
              icon: 'assets/icons/park.png',
              url: '',
              title: 'Парк культуры и отдыха Содовик');

          final adminisrtation = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.630325, 55.905990)),
              color: Colors.black,
              icon: 'assets/icons/gerb.png',
              url: '',
              title:
                  'Администрация городского округа город Стерлитамак Республики Башкортостан');

          final sodaHouseCulture = _buildMarkerWidget(
              pos: transformer
                  .fromLatLngToXYCoords(LatLng(53.642708, 55.964948)),
              color: Colors.black,
              icon: 'assets/icons/culture.png',
              url: '',
              title: 'Парк культуры и отдыха Содовик');

          final centerLocation = Offset(
              transformer.constraints.biggest.width / 2,
              transformer.constraints.biggest.height / 2);

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

              print('${location.longitude}, ${location.latitude}');
              print('${clicked.dx}, ${clicked.dy}');
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
                          // 'https://www.google.com/maps/@?api=1&map_action=map';
                          'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488';

                      // 'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

                      final darkUrl =
                          'https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i$z!2i$x!3i$y!4i256!2m3!1e0!2sm!3i556279080!3m17!2sen-US!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC52Om9uLHMuZTpsfHAudjpvZmZ8cC5zOi0xMDAscy5lOmwudC5mfHAuczozNnxwLmM6I2ZmMDAwMDAwfHAubDo0MHxwLnY6b2ZmLHMuZTpsLnQuc3xwLnY6b2ZmfHAuYzojZmYwMDAwMDB8cC5sOjE2LHMuZTpsLml8cC52Om9mZixzLnQ6MXxzLmU6Zy5mfHAuYzojZmYwMDAwMDB8cC5sOjIwLHMudDoxfHMuZTpnLnN8cC5jOiNmZjAwMDAwMHxwLmw6MTd8cC53OjEuMixzLnQ6NXxzLmU6Z3xwLmM6I2ZmMDAwMDAwfHAubDoyMCxzLnQ6NXxzLmU6Zy5mfHAuYzojZmY0ZDYwNTkscy50OjV8cy5lOmcuc3xwLmM6I2ZmNGQ2MDU5LHMudDo4MnxzLmU6Zy5mfHAuYzojZmY0ZDYwNTkscy50OjJ8cy5lOmd8cC5sOjIxLHMudDoyfHMuZTpnLmZ8cC5jOiNmZjRkNjA1OSxzLnQ6MnxzLmU6Zy5zfHAuYzojZmY0ZDYwNTkscy50OjN8cy5lOmd8cC52Om9ufHAuYzojZmY3ZjhkODkscy50OjN8cy5lOmcuZnxwLmM6I2ZmN2Y4ZDg5LHMudDo0OXxzLmU6Zy5mfHAuYzojZmY3ZjhkODl8cC5sOjE3LHMudDo0OXxzLmU6Zy5zfHAuYzojZmY3ZjhkODl8cC5sOjI5fHAudzowLjIscy50OjUwfHMuZTpnfHAuYzojZmYwMDAwMDB8cC5sOjE4LHMudDo1MHxzLmU6Zy5mfHAuYzojZmY3ZjhkODkscy50OjUwfHMuZTpnLnN8cC5jOiNmZjdmOGQ4OSxzLnQ6NTF8cy5lOmd8cC5jOiNmZjAwMDAwMHxwLmw6MTYscy50OjUxfHMuZTpnLmZ8cC5jOiNmZjdmOGQ4OSxzLnQ6NTF8cy5lOmcuc3xwLmM6I2ZmN2Y4ZDg5LHMudDo0fHMuZTpnfHAuYzojZmYwMDAwMDB8cC5sOjE5LHMudDo2fHAuYzojZmYyYjM2Mzh8cC52Om9uLHMudDo2fHMuZTpnfHAuYzojZmYyYjM2Mzh8cC5sOjE3LHMudDo2fHMuZTpnLmZ8cC5jOiNmZjI0MjgyYixzLnQ6NnxzLmU6Zy5zfHAuYzojZmYyNDI4MmIscy50OjZ8cy5lOmx8cC52Om9mZixzLnQ6NnxzLmU6bC50fHAudjpvZmYscy50OjZ8cy5lOmwudC5mfHAudjpvZmYscy50OjZ8cy5lOmwudC5zfHAudjpvZmYscy50OjZ8cy5lOmwuaXxwLnY6b2Zm!4e0&key=AIzaSyAOqYYyBbtXQEtcHG7hwAwyCPQSYidG8yU&token=31440';
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
        child: Icon(Icons.my_location),
      ),
    );
  }
}

_launchURL() async {
  const url = 'http://sonofmqe.beget.tech';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
