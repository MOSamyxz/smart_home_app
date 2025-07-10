import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_home_app/core/theming.dart/app_size.dart';
import 'package:smart_home_app/domain/entities/sensor_reading_entity.dart';
import 'package:smart_home_app/generated/l10n.dart';

class SensorChartInline extends StatelessWidget {
  final String sensorType;
  final Color color;
  final String unit;
  final List<SensorReadingEntity> readings;

  const SensorChartInline({
    super.key,
    required this.readings,
    required this.sensorType,
    this.color = Colors.blue,
    this.unit = '',
  });

  @override
  Widget build(BuildContext context) {
final sortedReadings = List<SensorReadingEntity>.from(readings)
  ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

final last10Readings = sortedReadings.length > 10
    ? sortedReadings.sublist(sortedReadings.length - 10)
    : sortedReadings;

final spots = last10Readings.map((r) => FlSpot(
  r.timestamp.millisecondsSinceEpoch.toDouble(),
  r.value,
)).toList();
final yValues = spots.map((e) => e.y);
final minY = yValues.reduce((a, b) => a < b ? a : b);
final maxY = yValues.reduce((a, b) => a > b ? a : b);

    if (spots.isEmpty) return Text('لا توجد بيانات لـ $sensorType');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         getSensorName(sensorType   , context) ,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        AppSize.verticalSpacer(8.0),
        SizedBox(
          height: 250,
          child: LineChart(
            LineChartData(
                minY: minY - 2, 
  maxY: maxY + 2,
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: color,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval:
                        (spots.last.x - spots.first.x) /
                        4, 
                    getTitlesWidget: (value, _) {
                      log('Value: $value');
                      final date = DateTime.fromMillisecondsSinceEpoch(
                        value.toInt(),
                      );
                      log('Date: $date');
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          DateFormat('HH:mm').format(date), // خليها وقت بس
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      );
                    },
                  ),
                ),

                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: sensorType == 'dht11_temp' ? 2 : sensorType == 'dht11_humidity' ? 2 : sensorType == 'mq2' ? 20 : 5, // خليها حسب نوع السنسور
                    reservedSize: 40,
                    getTitlesWidget:
                        (value, meta) =>  Text(
                          value.toStringAsFixed(
                            1,
                          ), // تنسيق القيمة برقم عشري واحد فقط
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                  ),
                ),

                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

getSensorName(String sensor, BuildContext context) {
  switch (sensor) {
    case 'dht11_humidity':
      return S.of(context).humidity_sensor;
    case 'dht11_temp':
      return S.of(context).temperature_sensor;
    case 'ldr':
      return S.of(context).light_sensor;
    case 'mq2':
      return S.of(context).gas_sensor;
    case 'fc-28':
      return S.of(context).soil_moisture_sensor;
    case 'ultrasonic':
      return S.of(context).ultrasonic_sensor;
    default:
      return 'Unknown Sensor';
  }
}