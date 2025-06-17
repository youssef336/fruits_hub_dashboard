import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_feild.dart';
import 'package:fruits_hub_dashboard/feature/notification/presentation/manager/cubits/notification/notification_cubit.dart';
import 'package:fruits_hub_dashboard/feature/notification/presentation/manager/cubits/notification/notification_state.dart';
import 'dart:io';

import '../../../../add_product/presentation/views/widgets/image_feild.dart';
import '../../../domain/entities/notification_entity.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  final _formKey = GlobalKey<FormState>();
  String? _description;
  String? descriptioninArabic;

  File? _image;
  final DateTime _date = DateTime.now();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 16),
                CustomTextFormFeild(
                  hintText: "Description in English",
                  textInputType: TextInputType.text,
                  onSaved: (value) => _description = value,
                ),
                const SizedBox(height: 16),
                CustomTextFormFeild(
                  hintText: "Description in Arabic",
                  textInputType: TextInputType.text,
                  onSaved: (value) => descriptioninArabic = value,
                ),
                const SizedBox(height: 16),
                ImageFeild(
                  onImageSelected: (value) {
                    setState(() {
                      _image = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                if (state is NotificationSuccess)
                  const Text('Notification sent successfully!'),
                if (state is NotificationFailure)
                  Text('Error: ${state.message}'),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (_image != null) {
                        context.read<NotificationCubit>().addNotification(
                          NotificationEntity(
                            descriptionInArabic: descriptioninArabic!,
                            descriptioninEnglish: _description!,
                            image: _image!,
                            date: _date,
                          ),
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    }
                  },
                  child: const Text('Send Notification'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
