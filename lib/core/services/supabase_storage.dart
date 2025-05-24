import 'dart:io';

import 'package:fruits_hub_dashboard/constant.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageServices implements StorageService {
  static late Supabase _supabase;

  static createSupabaseBucket(String bucketname) async {
    var bucket = await _supabase.client.storage.listBuckets();
    bool isBucketExist = false;
    for (var bucket in bucket) {
      if (bucket.id == bucketname) {
        isBucketExist = true;
        break;
      }
    }

    if (!isBucketExist) {
      await _supabase.client.storage.createBucket(bucketname);
    }
  }

  static intSupabase() async {
    _supabase = await Supabase.initialize(
      url: KsupabaseURL,
      anonKey: KsupabaseAnonKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var result = await _supabase.client.storage
        .from(KsupabaseBucket)
        .upload("$path/$fileName$extensionName", file);
    final String publicUrl = _supabase.client.storage
        .from(KsupabaseBucket)
        .getPublicUrl("$path/$fileName$extensionName");

    return result;
  }
}
