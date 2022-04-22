//  import 'package:flutter/material.dart';
// import 'dart:js' as js;

// import 'package:str_tour_app/features/str_tour/presentation/pages/map.dart';

// class LocationTeg extends State<MyMap>{

//   final parkGagarina = _buildMarkerWidget(
//               transformer.fromLatLngToXYCoords(LatLng(53.647531, 55.946773)),
//               Colors.green,
//               Icon(Icons.park));

//           final parkZhykov = _buildMarkerWidget(
//               transformer.fromLatLngToXYCoords(LatLng(53.628821, 55.921758)),
//               Colors.green,
//               Icon(Icons.park));

//           final parkPobedi = _buildMarkerWidget(
//               transformer.fromLatLngToXYCoords(LatLng(53.630899, 55.926776)),
//               Colors.green,
//               Icon(Icons.park));

//           final pictureGallery = _buildMarkerWidget(
//               transformer.fromLatLngToXYCoords(LatLng(53.619338, 55.907182)),
//               Colors.grey,
//               Icon(Icons.home));

//     Widget _buildMarkerWidget(Offset pos, Color color, Icon icon) {
//     return Positioned(
//       left: pos.dx - 16,
//       top: pos.dy - 16,
//       width: 40,
//       height: 40,
//       child: IconButton(
//           icon: icon,
//           color: color,
//           iconSize: 40,
//           onPressed: () {
//             // Navigator.push(
//             //   context,
//             //  MaterialPageRoute(builder: (context) => WebViewPage()));
//             // MaterialPageRoute(builder: (context) => _launchURL()));
//             js.context.callMethod(
//                 'open', ['http://sonofmqe.beget.tech/park_gagarina']);
//           }),
//     );
//   }

//  }
