import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/mains/storage_service.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageService {
  final storageRefarence = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var fileRefarence = storageRefarence.child("$path/$fileName$extensionName");

    await fileRefarence.putFile(file);
    var fileUrl = await fileRefarence.getDownloadURL();
    return fileUrl;
  }
}
