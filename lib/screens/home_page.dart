import 'package:flutter/material.dart';

import '../components/kalimba_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class CalimaModel {
  String no;
  int dotNumber;
  int height;

  CalimaModel({required this.no, required this.height,  this.dotNumber=0});
}

class _HomePageState extends State<HomePage> {
  List<CalimaModel> kalimbaTelleri = [
       CalimaModel(no: "2dotdot", dotNumber:2, height: 800),
        CalimaModel(no: "7dot", dotNumber: 1, height: 822),
    CalimaModel(no: "5dot", dotNumber: 1, height: 832),
    CalimaModel(no: "3dot", dotNumber: 1, height: 850),
    CalimaModel(no: "1dot", dotNumber: 1, height: 866),
    CalimaModel(no: "6", height: 883),
    CalimaModel(no: "4", height: 915),
    CalimaModel(no: "2",  height: 938),
    CalimaModel(no: "1",  height: 960),
    CalimaModel(no: "3", height: 915),
    CalimaModel(no: "5", height: 893),
    CalimaModel(no: "7",  height: 866),
    CalimaModel(no: "2dot", dotNumber: 1, height: 850),
    CalimaModel(no: "4dot", dotNumber: 1, height: 834),
    CalimaModel(no: "6dot", dotNumber: 1, height: 823),
    CalimaModel(no: "1dotdot", dotNumber: 2, height: 813),
      CalimaModel(no: "3dotdot", dotNumber: 2, height: 790),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double dynamicHeight = MediaQuery.of(context).size.height;
    double dynamicWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.brown.shade300,
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.brown,
              height: dynamicHeight * 0.2,
              child: const DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  child: Center(
                    child: Text(
                      'Benim\nKalimbam',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    style: ListTileStyle.list,
                    title: const Text("Kalimba Müzikleri"),
                    onTap: () => const SizedBox(),
                  ),
                  const ListTile(
                    style: ListTileStyle.list,
                    title: Text("Hakkımızda"),
                  ),
                  const ListTile(
                    style: ListTileStyle.list,
                    title: Text("Reklamları Kaldır"),
                  ),
                  const ListTile(
                    style: ListTileStyle.list,
                    title: Text("Çıkış"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
           
            Positioned(
              bottom: dynamicHeight * 0.08,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black, // Daire rengi beyaz
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5), // Gölge rengi
                        spreadRadius: 5, // Gölge yayılma yarıçapı
                        blurRadius: 7, // Gölge bulanıklık yarıçapı
                        offset: const Offset(0, 3), // Gölge ofseti (x, y)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...List.generate(
                          kalimbaTelleri.length,
                          (index) => KalimbaString(
                              dotNumber: kalimbaTelleri[index].dotNumber,
                              height: (dynamicHeight * 0.0005) *
                                  kalimbaTelleri[index].height,
                              width: dynamicWidth * 0.06,
                              number: kalimbaTelleri[index].no.toString()),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () =>
                            _scaffoldKey.currentState?.openEndDrawer(),
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
             Positioned(
              top: 0,
              left: 20,
              right: 20,
              child: Container(
              height: dynamicHeight*0.25,
              color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("KOYVERDUN GİTTUN BENİ",style: Theme.of(context).textTheme.headlineSmall,),
                  FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("""
                                    1' 1' 7 7 6 6 7 5\n
                                    1' 1' 7 7 6 6 6\n
                                    1'1' 7 7 6 6 7 5\n
                                    1' 1' 7 7 6 6 6\n
                                    5 6 7 1' 2' 1' 2' 1' 7\n
                                    """,style: Theme.of(context).textTheme.titleLarge)
                                    ,
                                    Text("""
                                    1' 7 6 2' 2' 2' 1' 7\n
                                    1' 1' 7 7 6 6 6\n
                                    5 6 7 1' 2' 1' 2' 1' 2' 1' 7\n
                                    1' 7 6 2' 2' 2' 1' 7\n
                                    1' 1' 7 7 6 6 6
                                    """,style: Theme.of(context).textTheme.titleLarge,),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
