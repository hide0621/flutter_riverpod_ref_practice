import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ref_practice/person.dart';

final personProvider = StateProvider((ref) => Person(name: 'nemo', age: 15));
