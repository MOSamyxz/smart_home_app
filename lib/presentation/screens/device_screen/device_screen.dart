import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/core/theming.dart/app_colors.dart';
import 'package:smart_home_app/core/theming.dart/app_size.dart';
import 'package:smart_home_app/data/datasources/firebase_device_datasource.dart';
import 'package:smart_home_app/data/repositories/device_repository_impl.dart';
import 'package:smart_home_app/domain/entities/device_entity.dart';
import 'package:smart_home_app/presentation/cubits/device/device_cubit.dart';
import 'package:smart_home_app/presentation/cubits/device/device_state.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          DeviceCubit(DeviceRepositoryImpl(FirebaseDeviceDatasource()))
            ..loadDevices(),
      child: BlocBuilder<DeviceCubit, DeviceState>(
          builder: (context, state) {
            if (state is DeviceLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is DeviceLoaded) {
              return ListView.builder(
                itemCount: state.devices.length,
                itemBuilder: (context, index) {
                  final device = state.devices[index];
                  return DeviceCardItem(device: device);
                },
              );
            } else if (state is DeviceError) {
              log('Error loading devices: ${state.message}');
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(child: Text('No Devices'));
          },
        ),
    );
  }
}

class DeviceCardItem extends StatelessWidget {
  const DeviceCardItem({
    super.key,
    required this.device,
  });

  final DeviceEntity device;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceCubit, DeviceState>(
      buildWhen: (previous, current) {
        // علشان يعمل rebuild بس لو حالة الجهاز دا اتغيرت
        if (previous is DeviceLoaded && current is DeviceLoaded) {
          return previous.loadingDeviceIds.contains(device.id) !=
              current.loadingDeviceIds.contains(device.id);
        }
        return true;
      },
      builder: (context, state) {
        bool isLoading = false;
         if (state is DeviceLoaded) {
          isLoading = state.loadingDeviceIds.contains(device.id);
        } 

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadius + 2),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [AppColors.primary, AppColors.secondary, AppColors.tertiary],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkBackground,
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
            ),
          
            child: ListTile(
              title: Text(device.type),
              subtitle: Text(device.location),
              trailing: InkWell(
                onTap: () {
 context.read<DeviceCubit>().updateDevice(
                device,
                !device.isActive,
              );                },
                child: Container(
    width: 50,
    height: 50,
    padding: const EdgeInsets.all(2.0),
    decoration: BoxDecoration(
      color: AppColors.grey.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
    ),
    child: Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
      
          bottom: device.isActive ? 20 : 0,
          child: Container(
            height: 25,
            width: 46,
            decoration: BoxDecoration(
              color:device.isActive ? AppColors.green : AppColors.red,
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
            ),
            child: Center(
              child: device.isActive
                  ? Text(
                      'ON',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      'OFF',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                  )
          ),
        ),
        )
      ],
    ),
  ),
              ),
          ),
        ));
      },
    );
  }
}
