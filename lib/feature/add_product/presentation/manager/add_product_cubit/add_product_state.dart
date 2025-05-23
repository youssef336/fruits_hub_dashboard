sealed class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductSuccess extends AddProductState {}

class AddProductfailure extends AddProductState {
  final String message;
  AddProductfailure(this.message);
}

class AddProductLoading extends AddProductState {}
