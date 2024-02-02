import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DirectoryPath {
  getPath() async {
    final Directory? suppDir = await getExternalStorageDirectory();
    final filePath = Directory("${suppDir!.path}/files");
    if (await filePath.exists()) {
      return filePath.path;
    } else {
      await filePath.create(recursive: true);
      return filePath.path;
    }
  }
}
