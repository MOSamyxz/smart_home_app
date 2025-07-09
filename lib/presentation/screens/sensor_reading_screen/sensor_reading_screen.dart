import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/data/datasources/firebase_sensor_reading_datasource.dart';
import 'package:smart_home_app/data/repositories/sensor_reading_repository_impl.dart';
import 'package:smart_home_app/domain/usecases/sensor_reading_usecase.dart';
import 'package:smart_home_app/presentation/cubits/sensor_reading/sensor_reading_cubit.dart';
import 'package:smart_home_app/presentation/widgets/sensor_chart.dart';

class SensorReadingScreen extends StatelessWidget {
  const SensorReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SensorReadingCubit(
            SensorReadingUsecase(
              SensorReadingRepositoryImpl(FirebaseSensorReadingDatasource()),
            ),
          )..fetchMultipleSensors([
            'dht11_temp',
            'dht11_humidity',
            'fc-28',
            'ldr',
            'mq2',
          ]),
      child: BlocBuilder<SensorReadingCubit, SensorReadingState>(
        builder: (context, state) {
          if (state.isLoading)
            return Center(child: CircularProgressIndicator());

          if (state.error != null) return Text('Error: ${state.error}');

          return ListView(
            children:
                state.sensorsData.entries.map((entry) {
                  final sensorType = entry.key;
                  final readings = entry.value;
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SensorChartInline(
                      readings: readings,
                      sensorType: sensorType,
                    ),
                  );
                }).toList(),
          );
        },
      ),
    );
  }
}
