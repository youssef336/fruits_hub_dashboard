import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_feild.dart';
import 'package:fruits_hub_dashboard/feature/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/image_feild.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/feature_product.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price;
  File? image;
  bool isFeatureProduct = false;
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
              FeatureProductWidget(
                onChanged: (value) {
                  isFeatureProduct = value;
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
