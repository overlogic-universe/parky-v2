import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../shared/presentation/widgets/app_bar_custom.dart';
import '../../domain/entities/parking_lot_entity.dart';

class ParkingLotMapScreen extends StatelessWidget {
  final ParkingLotEntity parkingLot;
  const ParkingLotMapScreen({super.key, required this.parkingLot});

  @override
  Widget build(BuildContext context) {
    final latitude = parkingLot.latitude ?? -7.559575879798511;
    final longitude = parkingLot.longitude ?? 110.85400919905273;
    return Scaffold(
      appBar: AppBarCustom(
        title: Text(parkingLot.name, style: AppFont.titleLarge(context)),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(latitude, longitude),
          initialZoom: 17,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(latitude, longitude),
                width: 80.w,
                height: 80.w,
                child: Icon(
                  Icons.location_on,
                  color: AppColor.error(context),
                  size: 40.r,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
