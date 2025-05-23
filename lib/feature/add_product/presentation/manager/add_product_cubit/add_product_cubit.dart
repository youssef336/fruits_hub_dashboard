import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/manager/add_product_cubit/add_product_state.dart';

import '../../../domain/entities/add_product_input_entity.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productRepo)
    : super(AddProductInitial());
  final ImageRepo imageRepo;
  final AddProductRepo productRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imageRepo.uploadImage(addProductInputEntity.image);
    result.fold((failure) => emit(AddProductfailure(failure.message)), (
      url,
    ) async {
      addProductInputEntity.imageurl = url;
      var result = await productRepo.addProduct(addProductInputEntity);
      result.fold((failure) => emit(AddProductfailure(failure.message)), (r) {
        emit(AddProductSuccess());
      });
    });
  }
}
