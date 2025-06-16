import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';

abstract class DatabaseServies {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<dynamic> getData({
    required String path,
    String? docuementId,
    Map<String, dynamic>? query,
  });
  Stream<dynamic> streamData({
    required String path,

    Map<String, dynamic>? query,
  });
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<void> deleteData({
    required String path,
    required String id,
  });
  Future<bool> checkifDataExists({
    required String path,
    required String documentId,
  });
  Future<Either<Failure, String>> uploadFile({
    required String path,
    required File file,
  });
}
