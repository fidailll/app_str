// import 'package:flutter/material.dart';
// import 'package:str_tour_app/features/str_tour/presentation/pages/map_web.dart';

// class ListObject {
//   Widget listObject() {
//     return Container(
//       margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
//       // decoration: ThemeProject().themeContainerWhite(),
//       child: Container(
//         margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
//         child: Column(
//           children: [
//             PopupMenuButton(
//               shape: Border.all(
//                 color: Colors.green,
//                 width: 1.0,
//                 style: BorderStyle.solid,
//               ),
//               // icon: Icon(CupertinoIcons.money_rubl_circle),
//               child: const Text(
//                 'Показать достопримечательности',
//                 // style: ThemeProject()
//                 //.themeGreenBattonTextStyle(context)
//               ),
//               itemBuilder: (context) => [
//                 PopupMenuItem(
//                   child: const Text(
//                     'Парк культуры и отдыха имени Ю.А. Гагарина',
//                     // style: ThemeProject()
//                     //  .themeGreenBattonTextStyle(context)
//                   ),
//                   value: 1,
//                   onTap: () {
//                     MyMapWeb()._gotoObject(53.647531, 55.946773);

//                     // setState() {
//                     //   _onScaleUpdate;
//                     // //  _gotoObject(53.647531, 55.946773);
//                     // }
//                   },
//                 ),
//                 PopupMenuItem(
//                   child: Text(
//                     'Парк имени Жукова Г.К.',
//                     // style: ThemeProject()
//                     ////  .themeGreenBattonTextStyle(context)
//                   ),
//                   value: 2,
//                   onTap: () {
//                     _gotoObject(53.628821, 55.921758);
//                   },
//                 ),
//                 // PopupMenuItem(
//                 //   child: Text(
//                 //     'Парк культуры и отдыха имени Ю.А. Гагарина',
//                 //     // style: ThemeProject()
//                 //     //  .themeGreenBattonTextStyle(context)
//                 //   ),
//                 //   value: 3,
//                 //   onTap: () {
//                 //     setState() => _gotoObject(53.647531, 55.946773);
//                 //   },
//                 // ),
//                 PopupMenuItem(
//                   child: Text(
//                     'Парк Победы',
//                     // style: ThemeProject()
//                     //  .themeGreenBattonTextStyle(context)
//                   ),
//                   value: 4,
//                   onTap: () {
//                     _gotoObject(53.630899, 55.926776);
//                   },
//                 ),
//                 PopupMenuItem(
//                   child: Text(
//                     'Картинная галерея имени М. В. Нестерова',
//                     // style: ThemeProject()
//                     //  .themeGreenBattonTextStyle(context)
//                   ),
//                   value: 5,
//                   onTap: () {
//                     _gotoObject(53.619338, 55.907182);
//                   },
//                 ),
//                 PopupMenuItem(
//                   child: Text(
//                     'Русский драматический театр',
//                     // style: ThemeProject()
//                     //  .themeGreenBattonTextStyle(context)
//                   ),
//                   value: 6,
//                   onTap: () {
//                     _gotoObject(53.619647, 55.962643);
//                   },
//                 ),
//                 PopupMenuItem(
//                   child: Text(
//                     'Стерлитамакское государственное театрально-концертное объединение',
//                     // style: ThemeProject()
//                     //  .themeGreenBattonTextStyle(context)
//                   ),
//                   value: 7,
//                   onTap: () {
//                     _gotoObject(53.637227, 55.935659);
//                   },
//                 ),
//                 PopupMenuItem(
//                   child: Text(
//                     'Историко-краеведческий музей',
//                     // style: ThemeProject()
//                     //  .themeGreenBattonTextStyle(context)
//                   ),
//                   value: 8,
//                   onTap: () {
//                     _gotoObject(53.617121, 55.964656);
//                   },
//                 ),
//                 PopupMenuItem(
//                   child: Text(
//                     'Парк имени Кирова',
//                     // style: ThemeProject()
//                     //  .themeGreenBattonTextStyle(context)
//                   ),
//                   value: 9,
//                   onTap: () {
//                     _gotoObject(53.620912, 55.967538);
//                   },
//                 ),
//                 PopupMenuItem(
//                   child: Text(
//                     'Парк культуры и отдыха Содовик',
//                     // style: ThemeProject()
//                     //  .themeGreenBattonTextStyle(context)
//                   ),
//                   value: 10,
//                   onTap: () {
//                     _gotoObject(53.642703, 55.972755);
//                   },
//                 ),
//                 PopupMenuItem(
//                   child: Text(
//                     'Администрация городского округа город Стерлитамак Республики Башкортостан',
//                     // style: ThemeProject()
//                     //  .themeGreenBattonTextStyle(context)
//                   ),
//                   value: 11,
//                   onTap: () {
//                     _gotoObject(53.630325, 55.905990);
//                   },
//                 ),
//                 PopupMenuItem(
//                   child: Text(
//                     'Сода Дом культуры ',
//                     // style: ThemeProject()
//                     //  .themeGreenBattonTextStyle(context)
//                   ),
//                   value: 12,
//                   onTap: () {
//                     _gotoObject(53.642708, 55.964948);
//                   },
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
