import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class buildLocationWelcome extends StatelessWidget {
  const buildLocationWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return locationWelcome(size);
  }


  Stack locationWelcome(Size size) {
    return Stack(
      children: [
        ClipRRect(child: Image.asset('assets/images/locationBg.png',fit: BoxFit.cover,height: size.height*0.8,)),
        Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFF344E41),
                      Color(0xAA344E41),
                      Color(0x00121B12)
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter
                ),
              ),
            )
        ),
        Positioned.fill(
          top: size.height * 0.2,
          left: size.width * 0.1,
          right: size.width * 0.07,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("LOKASI LECI MANGGA RESIDENCE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                SizedBox(height: 10,),
                Text("Temukan Lokasi Strategis dengan akses mudah ke berbagai tempat penting",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFFF3ECDC)),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

}


class mainLocationWidget extends StatelessWidget {
  mainLocationWidget({super.key});

  final List<dynamic> locationCard = [
    {'location' : 'Kampus Telkom', 'jarak' : '1,5 km'},
    {'location' : 'Buah Batu', 'jarak' : '2,5 km'},
    {'location' : 'YOGYA Market', 'jarak' : '2,0 km'},
    {'location' : 'Trans Studio Mall', 'jarak' : '6,0 km'},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return buildLocation(size);
  }


  Container buildLocation(Size size) {
    return Container(
      color: Color(0xFFF3ECDC),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
      child: Column(
        children: [
          Text('LOKASI DAN LINGKUNGAN SEKITAR',style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),),
          SizedBox(height: 5,),
          Row(
            children: [
              Icon(Icons.location_pin,color: Color(0xFF588157),),
              Text('TULT',style: TextStyle(color: Color(0xFF588157), fontWeight: FontWeight.w400, fontSize: 14),)
            ],
          ),
          SizedBox(height: 10,),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: size.width * 0.9,
                height: size.height * 0.9,
              ),
              Positioned(
                top: size.height*0.05,
                right: size.width*0.1,
                left: size.width*0.1,
                child: SizedBox(
                  width: size.width*0.5,
                  height: size.height * 0.4,
                  child: FlutterMap(
                      options: MapOptions(
                          initialCenter: LatLng(-6.969312, 107.628225),
                          initialZoom: 18.0,
                          interactionOptions: const InteractionOptions(flags: InteractiveFlag.all)
                      ),
                      children: [
                        openStreetMapTileLayer,
                        MarkerLayer(markers: [
                          Marker(
                              point: LatLng(-6.969312, 107.628225),
                              width: 60,
                              height: 60,
                              alignment: Alignment.center,
                              child: Icon(Icons.location_pin, size: 60, color: Colors.red,)
                          ),
                        ]
                        )
                      ]
                  ),
                ),
              ),
              Positioned(
                top: size.height*0.5,
                left: size.width*0.05,
                right: size.width*0.05,
                child: Text(
                  'TEMPAT TERDEKAT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xFF073937),
                  ),
                ),
              ),
              Positioned(
                top: size.height*0.55,
                left: size.width*0.15,
                right: size.width*0.15,
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: locationCard.map<Widget>((card) => cardLocation(card)).toList(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }


  Container cardLocation(Map<String,String> cardLoc){
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(20)
      ),
      width: 100,
      height: 100,
      child: Column(
        children: [
          SizedBox(height: 30,child:
          Icon(Icons.location_on_outlined,color: Color(0xFF588157),),),
          SizedBox(height: 40,child: Text(cardLoc['location']!,textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF073937)),)),
          Text(cardLoc['jarak']!,textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12,color: Color(0xFF4D4D4D)),)
        ],
      ),
    );
  }


  TileLayer get openStreetMapTileLayer => TileLayer(
    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    userAgentPackageName: 'dev.lecimanggaresidence.flutter_map',
  );

}
