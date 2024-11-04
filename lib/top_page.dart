import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ref_practice/person.dart';
import 'package:flutter_riverpod_ref_practice/person_provider.dart';

class TopPage extends ConsumerStatefulWidget {
  const TopPage({super.key});

  @override
  ConsumerState<TopPage> createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<TopPage> {
  @override
  Widget build(BuildContext context) {
    // final person = ref.watch(personProvider);

    /// 上記のコードは以下のように細分化もでき、
    /// それぞれのstateを個別に監視することもできる（無駄なリビルドを防ぐことができる）
    final personName =
        ref.watch(personProvider.select((person) => person.name));
    final personAge = ref.watch(personProvider.select((person) => person.age));

    ref.listen(personProvider, (previous, next) {
      print('previous: $previous, next: $next');
    });

    return Column(
      children: [
        Text(personName),
        Text(personAge.toString()),
        ElevatedButton(
          onPressed: () {
            ref.read(personProvider.notifier).state =
                Person(name: "nemo", age: 16);
          },
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
