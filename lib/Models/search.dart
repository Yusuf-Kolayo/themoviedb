import 'package:hooks_riverpod/hooks_riverpod.dart';


  final searchTxtProvider = StateProvider <String>((ref) {
        return '';
  });


  final searchBooleanProvider = StateProvider.autoDispose<bool>((ref) {
        return false;
  });