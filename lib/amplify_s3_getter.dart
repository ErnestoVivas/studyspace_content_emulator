/*
 * This file contains functions to access objects/files from aws S3 buckets
 */

// dart/flutter packages
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// amplify packages
import 'package:amplify_flutter/amplify_flutter.dart';

// TODO: check if better methods such as downloading the file explicitly to memory or
// directly accessing the S3 object contents without download can be implemented


// Files downloaded from S3 are stored in the app cache (can be retrieved next time from there)
Future<File> storeFileInCache(String s3ObjectKey) async {
  String filename = s3ObjectKey.split('/').last;
  Directory tempDir = await getTemporaryDirectory();
  String tempFilePath = '${tempDir.path}/$filename';
  final tempFile = File(tempFilePath);
  return tempFile;
}

// check, if file already exists in cache
Future<bool> cacheHasFile(String s3ObjectKey) async {
  String filename = s3ObjectKey.split('/').last;
  Directory tempDir = await getTemporaryDirectory();
  String filePath = '${tempDir.path}/$filename';
  bool fileExists = await File(filePath).exists();
  return fileExists;
}

// load a file from the cache
Future<File> loadFileFromCache(String filename) async {
  Directory tempDir = await getTemporaryDirectory();
  String filePath = '${tempDir.path}/$filename';
  File fileInCache = await File(filePath);
  return fileInCache;
}


// check, if file already exists in assets
Future<bool> assetsHasFile(String s3ObjectKey) async {
  String filePath = 'assets/$s3ObjectKey';
  bool fileExists = await File(filePath).exists();
  return fileExists;
}


// get the string of a text file, stored in S3 bucket under the s3ObjectKey
Future<String> getS3TextFile(String s3ObjectKey) async {

  // create temporary cache file where S3 object will be downloaded to
  //Directory tempDir = await getTemporaryDirectory();
  //String tempDirPath = tempDir.path + '/temp_text.txt';
  //final tempFile = File(tempDirPath);                 // writes to cache, not sure if memory or disk cache
  final tempFile = await storeFileInCache(s3ObjectKey);
  String fileContent = '';

  try {
    final result = await Amplify.Storage.downloadFile(
      key: s3ObjectKey,
      local: tempFile,
      onProgress: (progress) {/* insert debug statement if needed */}
    );
    fileContent = result.file.readAsStringSync();
  } on StorageException catch(e) {
    fileContent = '    [ERROR: failed to fetch data from server backend.]';
  }
  return fileContent;
}

// get the S3 object as a whole File
Future<File?> getS3ObjectFile(String s3ObjectKey) async {
  //Directory tempDir = await getTemporaryDirectory();
  //String tempDirPath = tempDir.path + '/temp_file';
  //final tempFile = File(tempDirPath);                 // writes to cache, not sure if memory or disk cache
  final tempFile = await storeFileInCache(s3ObjectKey);
  try {
    final result = await Amplify.Storage.downloadFile(
      key: s3ObjectKey,
      local: tempFile,
      onProgress: (progress) {/* insert debug statement if needed */}
    );
  } on StorageException catch(e) {
    debugPrint('$e: Could not load S3 file with key $s3ObjectKey.');
    return null;
  }
  return tempFile;
}



// get url of a S3 object
Future<String> getS3ObjectDownloadUrl(String s3ObjectKey) async {
  String objectDownloadUrl = '';
  try {
    final result = await Amplify.Storage.getUrl(key: s3ObjectKey);
    objectDownloadUrl = result.url;
  } on StorageException catch (e) {
    print('Error getting download URL: $e');
  }
  return objectDownloadUrl;
}


Future<List<List<String>>> getS3ContentsFile(String s3ObjectKey) async {
  List<List<String>> contents = [[]];
  List<String> lines = [];

  // get contents file, save it in temporary cache and get the content string
  Directory tempDir = await getTemporaryDirectory();
  String tempDirPath = tempDir.path + '/contents.txt';
  final tempFile = File(tempDirPath);                 // writes to cache, not sure if memory or disk cache
  String fileContent = '';
  try {
    final result = await Amplify.Storage.downloadFile(
      key: s3ObjectKey,
      local: tempFile,
      onProgress: (progress) {}
    );
    fileContent = result.file.readAsStringSync();
  } on StorageException catch(e) {
    fileContent: '    [Error: failed to fetch data from server backend.]';
  }

  // parse content string to return list of file indices and types
  lines = fileContent.split('\n');
  for(String line in lines) {
    contents.add(line.split(' '));
  }

  for(int i = 0; i < contents.length; ++i) {
    for(int j = 0; j < contents[i].length; ++j) {
      debugPrint(contents[i][j] + " ");
    }
    debugPrint("\n");
  }

  return contents;
}