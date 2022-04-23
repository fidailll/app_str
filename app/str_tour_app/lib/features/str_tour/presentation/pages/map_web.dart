import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:str_tour_app/features/str_tour/presentation/pages/virtual_tour.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:str_tour_app/features/str_tour/presentation/widgets/bottom_sheet_content.dart';
//import 'dart:js' as js;

class MyMapWeb extends StatefulWidget {
  @override
  _MyMapWebState createState() => _MyMapWebState();
}

class _MyMapWebState extends State<MyMapWeb> {
  final controller = MapController(
    location: LatLng(53.627707141967356, 55.93648481080392),
  );

  bool _darkMode = false;

  final markers = [
    LatLng(53.627707141967356, 55.93648481080392),
  ];

  void _gotoDefault() {
    controller.center = LatLng(53.627707141967356, 55.93648481080392);
    // setState(() {
    //   // Navigator.push(
    //   //     context, MaterialPageRoute(builder: (context) => WebViewPage()));
    // });
  }

  void _gotoObject(double latitude, double longitude) {
    controller.center = LatLng(latitude, longitude);
    controller.zoom += 1.5;
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

  void _showModalBottomSheet(BuildContext context, String title,
      final String urlAdress, String adress, String phone, String url) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return BottomSheetContent(
            title: title,
            urlAddress: urlAdress,
            address: adress,
            phone: phone,
            url: url);
      },
    );
  }

  Widget _buildMarkerWidget(
      {required Offset pos,
      required Color color,
      required String icon,
      required String url,
      required String title,
      required String urlAddress,
      required String address,
      required String phone}) {
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
                //   js.context.callMethod('open', ['$url']);
                // setState(() {
                _showModalBottomSheet(
                    context, title, urlAddress, address, phone, url);
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => WebViewPage()));
                // });
              },
              child: Image(image: AssetImage('$icon'), width: 50, height: 50),
            ),
          ),
          SizedBox(width: 3),
          Container(
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // SizedBox(width: 10),
            Image(
              image: AssetImage('assets/icons/str_logo.png'),
              width: 70,
              height: 70,
            ),
            //SizedBox(width: 50),
            Text(
              'Достопримечательности',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Режим отображение карты',
            onPressed: () {
              setState(() {
                _darkMode = !_darkMode;
              });
            },
            icon: Icon(
              Icons.wb_sunny,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: MapLayoutBuilder(
        controller: controller,
        builder: (context, transformer) {
          final markerPositions =
              markers.map(transformer.fromLatLngToXYCoords).toList();

          final parkGagarina = _buildMarkerWidget(
            pos: transformer.fromLatLngToXYCoords(LatLng(53.647531, 55.946773)),
            color: Color.fromARGB(255, 2, 62, 4),
            icon: 'assets/icons/park.png',
            url: 'http://sonofmqe.beget.tech/park_gagarina',
            title: 'Парк культуры и отдыха имени Ю.А. Гагарина',
            urlAddress: 'https://park-str.ru',
            address: 'ул. Фурманова, 15',
            phone: '+7 (937) 308-88-03',
          );

          final parkZhykov = _buildMarkerWidget(
            pos: transformer.fromLatLngToXYCoords(LatLng(53.628821, 55.921758)),
            color: Color.fromARGB(255, 2, 62, 4),
            icon: 'assets/icons/park.png',
            url: '',
            title: 'Парк имени Жукова Г.К.',
            urlAddress: '',
            address: '',
            phone: '',
          );

          final parkPobedi = _buildMarkerWidget(
            pos: transformer.fromLatLngToXYCoords(LatLng(53.630899, 55.926776)),
            color: Color.fromARGB(255, 2, 62, 4),
            icon: 'assets/icons/park.png',
            url: '',
            title: 'Парк Победы',
            urlAddress: '',
            address: '',
            phone: '',
          );

          final pictureGallery = _buildMarkerWidget(
            pos: transformer.fromLatLngToXYCoords(LatLng(53.619338, 55.907182)),
            color: Colors.black,
            icon: 'assets/icons/museum.png',
            url: '',
            title: 'Картинная галерея имени М. В. Нестерова',
            urlAddress: 'https://museum-nesterov.ru',
            address: 'Коммунистическая ул., 84',
            phone: '+7 (3473) 22-97-80',
          );

          final russianDramaTheater = _buildMarkerWidget(
            pos: transformer.fromLatLngToXYCoords(LatLng(53.619647, 55.962643)),
            color: Color.fromARGB(255, 179, 110, 6),
            icon: 'assets/icons/theater-masks.png',
            url: '',
            title: 'Русский драматический театр',
            urlAddress: 'https://www.rusdramteatr.ru',
            address: 'ул. Худайбердина, 18',
            phone: '+7(3473) 25-73-01',
          );

          final stateTheater = _buildMarkerWidget(
            pos: transformer.fromLatLngToXYCoords(LatLng(53.637227, 55.935659)),
            color: Color.fromARGB(255, 179, 110, 6),
            icon: 'assets/icons/theater-masks.png',
            url: '',
            title:
                'Стерлитамакское государственное театрально-концертное объединение',
            urlAddress: 'https://sgtko.ru',
            address: 'просп. Ленина, 30В',
            phone: '+7 (3473) 20-23-04',
          );

          final museumOfHistoryAndLocalLore = _buildMarkerWidget(
            pos: transformer.fromLatLngToXYCoords(LatLng(53.617121, 55.964656)),
            color: Colors.black,
            icon: 'assets/icons/culture.png',
            url: '',
            title: 'Историко-краеведческий музей',
            urlAddress: 'http://museumstr.ru',
            address: 'ул. Карла Маркса, 100',
            phone: '+7 (3473) 25-72-10',
          );

          final parkKirova = _buildMarkerWidget(
            pos: transformer.fromLatLngToXYCoords(LatLng(53.620912, 55.967538)),
            color: Color.fromARGB(255, 2, 62, 4),
            icon: 'assets/icons/park.png',
            url: '',
            title: 'Парк имени Кирова',
            urlAddress: '',
            address: '',
            phone: '',
          );

          final parkSodovik = _buildMarkerWidget(
            pos: transformer.fromLatLngToXYCoords(LatLng(53.642703, 55.972755)),
            color: Color.fromARGB(255, 2, 62, 4),
            icon: 'assets/icons/park.png',
            url: '',
            title: 'Парк культуры и отдыха Содовик',
            urlAddress: '',
            address: '',
            phone: '',
          );

          final adminisrtation = _buildMarkerWidget(
            pos: transformer.fromLatLngToXYCoords(LatLng(53.630325, 55.905990)),
            color: Colors.black,
            icon: 'assets/icons/gerb.png',
            url: '',
            title:
                'Администрация городского округа город Стерлитамак Республики Башкортостан',
            urlAddress: 'https://www.sterlitamakadm.ru',
            address: 'проспект Октября, 32',
            phone: '+7(3473) 25-23-50',
          );

          final sodaHouseCulture = _buildMarkerWidget(
            pos: transformer.fromLatLngToXYCoords(LatLng(53.642708, 55.964948)),
            color: Colors.black,
            icon: 'assets/icons/culture.png',
            url: '',
            title: 'Сода Дом культуры ',
            urlAddress: 'https://гдк-стерлитамак.рф',
            address: 'ул. Тукаева, 9',
            phone: '+7(3473) 28-13-43',
          );

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
                          'http://mt0.google.com/vt/lyrs=m&hl=en&x=${x}&y=${y}&z=${z}&s=Ga';
                      //'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488';

                      // 'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

                      final darkUrl =
                          'http://mt0.google.com/vt/lyrs=s&hl=en&x=${x}&y=${y}&z=${z}&s=Ga';
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
                  listObject(),

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
        backgroundColor: Colors.white,
        onPressed: _gotoDefault,
        tooltip: 'Центрировать по центру',
        child: Icon(
          Icons.my_location_outlined,
          color: Colors.black,
        ),
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
                color: Colors.black,
                width: 1.0,
                style: BorderStyle.solid,
              ),
              tooltip: 'достопримечательности',
              // icon: Icon(CupertinoIcons.money_rubl_circle),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.black),
                    left: BorderSide(width: 1.0, color: Colors.black),
                    right: BorderSide(width: 1.0, color: Colors.black),
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  child: Text(
                    'Показать достопримечательности',
                    // style:
                    //     TextStyle(color: !_darkMode ? Colors.black : Colors.white),
                    // style: ThemeProject()
                    //.themeGreenBattonTextStyle(context)
                  ),
                ),
              ),

              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text(
                    'Парк культуры и отдыха имени Ю.А. Гагарина',
                    // style: ThemeProject()
                    //  .themeGreenBattonTextStyle(context)
                  ),
                  value: 1,
                  onTap: () {
                    _gotoObject(53.647531, 55.946773);

                    // setState() {
                    //   _onScaleUpdate;
                    // //  _gotoObject(53.647531, 55.946773);
                    // }
                  },
                ),
                PopupMenuItem(
                  child: Text(
                    'Парк имени Жукова Г.К.',
                    // style: ThemeProject()
                    ////  .themeGreenBattonTextStyle(context)
                  ),
                  value: 2,
                  onTap: () {
                    _gotoObject(53.628821, 55.921758);
                  },
                ),
                // PopupMenuItem(
                //   child: Text(
                //     'Парк культуры и отдыха имени Ю.А. Гагарина',
                //     // style: ThemeProject()
                //     //  .themeGreenBattonTextStyle(context)
                //   ),
                //   value: 3,
                //   onTap: () {
                //     setState() => _gotoObject(53.647531, 55.946773);
                //   },
                // ),
                PopupMenuItem(
                  child: Text(
                    'Парк Победы',
                    // style: ThemeProject()
                    //  .themeGreenBattonTextStyle(context)
                  ),
                  value: 4,
                  onTap: () {
                    _gotoObject(53.630899, 55.926776);
                  },
                ),
                PopupMenuItem(
                  child: Text(
                    'Картинная галерея имени М. В. Нестерова',
                    // style: ThemeProject()
                    //  .themeGreenBattonTextStyle(context)
                  ),
                  value: 5,
                  onTap: () {
                    _gotoObject(53.619338, 55.907182);
                  },
                ),
                PopupMenuItem(
                  child: Text(
                    'Русский драматический театр',
                    // style: ThemeProject()
                    //  .themeGreenBattonTextStyle(context)
                  ),
                  value: 6,
                  onTap: () {
                    _gotoObject(53.619647, 55.962643);
                  },
                ),
                PopupMenuItem(
                  child: Text(
                    'Стерлитамакское государственное театрально-концертное объединение',
                    // style: ThemeProject()
                    //  .themeGreenBattonTextStyle(context)
                  ),
                  value: 7,
                  onTap: () {
                    _gotoObject(53.637227, 55.935659);
                  },
                ),
                PopupMenuItem(
                  child: Text(
                    'Историко-краеведческий музей',
                    // style: ThemeProject()
                    //  .themeGreenBattonTextStyle(context)
                  ),
                  value: 8,
                  onTap: () {
                    _gotoObject(53.617121, 55.964656);
                  },
                ),
                PopupMenuItem(
                  child: Text(
                    'Парк имени Кирова',
                    // style: ThemeProject()
                    //  .themeGreenBattonTextStyle(context)
                  ),
                  value: 9,
                  onTap: () {
                    _gotoObject(53.620912, 55.967538);
                  },
                ),
                PopupMenuItem(
                  child: Text(
                    'Парк культуры и отдыха Содовик',
                    // style: ThemeProject()
                    //  .themeGreenBattonTextStyle(context)
                  ),
                  value: 10,
                  onTap: () {
                    _gotoObject(53.642703, 55.972755);
                  },
                ),
                PopupMenuItem(
                  child: Text(
                    'Администрация городского округа город Стерлитамак Республики Башкортостан',
                    // style: ThemeProject()
                    //  .themeGreenBattonTextStyle(context)
                  ),
                  value: 11,
                  onTap: () {
                    _gotoObject(53.630325, 55.905990);
                  },
                ),
                PopupMenuItem(
                  child: Text(
                    'Сода Дом культуры ',
                    // style: ThemeProject()
                    //  .themeGreenBattonTextStyle(context)
                  ),
                  value: 12,
                  onTap: () {
                    _gotoObject(53.642708, 55.964948);
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

_launchURL() async {
  const url = 'http://sonofmqe.beget.tech';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
