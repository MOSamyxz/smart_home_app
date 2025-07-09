
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_home_app/domain/entities/sensor_reading_entity.dart';

class SensorChartMulti extends StatelessWidget {
  final Map<String, List<SensorReadingEntity>> sensorsData; // key = sensorType
  final Map<String, Color> colors;
  final Map<String, String> units;

  const SensorChartMulti({
    super.key,
    required this.sensorsData,
    required this.colors,
    required this.units,
  });
@override
Widget build(BuildContext context) {
  // دمج كل القراءات في قائمة واحدة من الخطوط
  List<LineChartBarData> lines = [];

  for (var entry in sensorsData.entries) {
    final sensor = entry.key;
    final readings = entry.value;

    if (readings.isEmpty) continue;

    // ترتيب وقطع آخر 10 قراءات
    readings.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    final lastReadings = readings.length > 10
        ? readings.sublist(readings.length - 10)
        : readings;

    final spots = lastReadings.map((r) => FlSpot(
      r.timestamp.millisecondsSinceEpoch.toDouble(),
      r.value,
    )).toList();

    lines.add(LineChartBarData(
      spots: spots,
      isCurved: true,
      color: colors[sensor] ?? Colors.white,
      barWidth: 2,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    ));
  }

  if (lines.isEmpty) return Text('لا توجد بيانات');

  final allSpots = lines.expand((l) => l.spots).toList();
  allSpots.sort((a, b) => a.x.compareTo(b.x));
  final minX = allSpots.first.x;
  final maxX = allSpots.last.x;

  return SizedBox(
    height: 300,
    child: LineChart(
      LineChartData(
        minX: minX,
        maxX: maxX,
        lineBarsData: lines,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: (maxX - minX) / 4,
              getTitlesWidget: (value, _) {
                final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                return Text(
                  DateFormat('HH:mm').format(date),
                  style: TextStyle(color: Colors.white, fontSize: 10),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, _) => Text(
                value.toStringAsFixed(1),
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      ),
    ),
  );
}
}