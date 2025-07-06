import 'package:iconsax/iconsax.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/core/theming.dart/app_colors.dart';
import 'package:smart_home_app/core/theming.dart/app_size.dart';
import 'package:smart_home_app/core/theming.dart/app_text_styles.dart';
import 'package:smart_home_app/domain/entities/device_entity.dart';
import 'package:smart_home_app/presentation/cubits/home/home_cubit.dart';
import 'package:smart_home_app/presentation/cubits/home/home_state.dart';

class DeviceCardItem extends StatelessWidget {
  const DeviceCardItem({super.key, required this.device});

  final DeviceEntity device;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        if (previous is HomeLoaded && current is HomeLoaded) {
          return previous.loadingHomeIds.contains(device.id) !=
              current.loadingHomeIds.contains(device.id);
        }
        return true;
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadius + 2),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                AppColors.primary,
                AppColors.secondary,
                AppColors.tertiary,
              ],
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.darkBackground,
              gradient:
                  device.isActive
                      ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primary.withValues(alpha: 0.2),
                          AppColors.secondary.withValues(alpha: 0.2),
                        ],
                      )
                      : null,
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Iconsax.lamp,
                      color:
                          device.isActive
                              ? AppColors.darkBackground
                              : AppColors.white,
                    ),
                    Spacer(),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Transform.scale(
                        scale: .7,
                        child: Switch(
                          activeColor: AppColors.primary,
                          inactiveThumbColor: AppColors.grey,
                          activeTrackColor: AppColors.darkBackground,
                          value: device.isActive,
                          onChanged: (value) {
                            context.read<HomeCubit>().updateDevice(
                              device,
                              value,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  device.type,
                  style: AppTextStyles.titleSmall.copyWith(
                    color:
                        device.isActive
                            ? AppColors.darkBackground
                            : AppColors.white,
                  ),
                ),
                AppSize.verticalSpacer(4.0),
                Text(
                  device.location,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}