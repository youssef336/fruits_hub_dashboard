import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_feild.dart';
import 'package:fruits_hub_dashboard/feature/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/feature_product_check_box.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/image_feild.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/is_organic_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price, exparationMonth, numberOfCalories, unitAmount;
  File? image;
  bool isFeatureProduct = false;
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,

          child: Column(
            children: [
              CustomTextFormFeild(
                onSaved: (p0) {
                  name = p0!;
                },
                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormFeild(
                onSaved: (p0) {
                  price = num.parse(p0!);
                },
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              CustomTextFormFeild(
                onSaved: (p0) {
                  exparationMonth = num.parse(p0!);
                },
                hintText: 'Exparation Month',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormFeild(
                onSaved: (p0) {
                  numberOfCalories = num.parse(p0!);
                },
                hintText: 'Number Of Calories',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormFeild(
                onSaved: (p0) {
                  unitAmount = num.parse(p0!);
                },
                hintText: 'Unit Amount',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormFeild(
                onSaved: (p0) {
                  code = p0!.toLowerCase();
                },
                hintText: 'Product code',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormFeild(
                onSaved: (p0) {
                  description = p0!;
                },
                hintText: 'Product Description',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 16),
              FeatureProductCheckBox(
                onChanged: (value) {
                  isFeatureProduct = value;
                },
              ),
              SizedBox(height: 16),
              IsOrganicCheckBox(
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              SizedBox(height: 16),
              ImageFeild(
                onImageSelected: (image) {
                  this.image = image;
                },
              ),
              SizedBox(height: 24),
              CustomButtom(
                text: "AddProduct",
                onPressed: () {
                  if (image != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      AddProductInputEntity product = AddProductInputEntity(
                        name: name,
                        reviews: [],
                        experationMonths: exparationMonth.toInt(),
                        numbersOfCalories: numberOfCalories.toInt(),
                        unitAmount: unitAmount.toInt(),
                        isOrganic: isOrganic,
                        code: code,
                        description: description,
                        price: price,
                        image: image!,
                        isfeatured: isFeatureProduct,
                      );
                      context.read<AddProductCubit>().addProduct(product);
                    }
                  } else {
                    snowError(context);
                  }
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void snowError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please Select Image'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
