import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/data/datasources/firebase_device_datasource.dart';
import 'package:smart_home_app/data/models/device_model.dart';
import 'package:smart_home_app/data/repositories/device_repository_impl.dart';
import 'package:smart_home_app/presentation/cubits/device/device_cubit.dart';
import 'package:smart_home_app/presentation/cubits/device/device_state.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeviceCubit(DeviceRepositoryImpl(FirebaseDeviceDatasource()))..addDevice( 
        DeviceModel(
          id: 'leving_room_light',
          type: 'Light',
          location: 'Living Room',
          isActive: false,
        ),
      )..loadDevices(),
      child: Scaffold(
        appBar: AppBar(title: Text('Devices')),
        body: BlocBuilder<DeviceCubit, DeviceState>(
          builder: (context, state) {
            if (state is DeviceLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is DeviceLoaded) {
              return ListView.builder(
                itemCount: state.devices.length,
                itemBuilder: (context, index) {
                  final device = state.devices[index];
                  return ListTile(
                    title: Text(device.type),
                    subtitle: Text(device.location),
                    trailing: Icon(device.isActive ? Icons.check : Icons.close),
                  );
                },
              );
            } else if (state is DeviceError) {
              log('Error loading devices: ${state.message}');
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(child: Text('No Devices'));
          },
        ),
      ),
    );
  }
}
