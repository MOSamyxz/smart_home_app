import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/data/datasources/firebase_sensor_datasource.dart';
import 'package:smart_home_app/data/models/sensor_model.dart';
import 'package:smart_home_app/data/repositories/sensor_repository_impl.dart';
import 'package:smart_home_app/presentation/cubits/sensore/sensor_cubit.dart';
import 'package:smart_home_app/presentation/cubits/sensore/sensor_state.dart';

class SensorsScreen extends StatelessWidget {
  const SensorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SensorCubit(SensorRepositoryImpl(FirebaseSensorDatasource ()))..addSensor(
        SensorModel(
          id: 'temperature_sensor',
          timestamp: DateTime.now(),
          eventType: 'temperature_update',
          severity: 'normal',
          sensorType: 'LM35',
          name: 'Kitchen Temperature Sensor',
          location: 'Kitchen',
          value: 30.5,
          unit: 'Celsius',
        ),
      ),
      child: BlocBuilder<SensorCubit, SensorState>(
          builder: (context, state) {
            if (state is SensorLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SensorLoaded) {
              return ListView.builder(
                itemCount: state.sensors.length,
                itemBuilder: (context, index) {
                  final sensor = state.sensors[index];
                  return ListTile(
                    title: Text(sensor.name),
                    subtitle: Row(
                      children: [
                        Text('${sensor.value} ${sensor.unit}'),
                        const SizedBox(width: 8),
                        Text(sensor.severity),
                      ],
                    ),
                    trailing: Text(sensor.timestamp.toLocal().toString()),
                  );
                },
              );
            } else if (state is SensorError) {
              // Log the error message for debugging
              debugPrint('Error loading sensors: ${state.message}');
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('No data'));
          },
        ),
    );
  }
}
