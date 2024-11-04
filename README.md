# flutter_riverpod_ref_practice

flutter riverpod ref practice

## 引用

以下の記事を引用

[Flutter RiverpodのProviderのドキュメントメモ](https://qiita.com/nemo-855/items/226184c4b4ccc1d3c8f8)

## 各種ref系統のメソッドの使い分け

- `ref.watch`

  - stateの監視を行い、stateが変わったらwidgetを再構築（リビルド）する
    
  - `final personName = ref.watch(personProvider.select((person) => person.name));` と言った`select`メソッドを使えば監視したいstateを絞り込むことができ、そのstateが変わったタイミングの時だけにwidgetの再構築を限定することができる！

- `ref.listen`

  - stateの監視を行い、stateが変わったらコールバック関数を実行する（widgetの再構築はしない）
    
  - 例：`ref.listen(personProvider, (previous, next) {
      print('previous: $previous, next: $next');
    });`

- `ref.read`

  - stateの監視は行わず、このコードが実行されたタイミングのstateの値を取得する
    
  - または、`ref.read(personProvider.notifier).state = Person(name: "nemo", age: 16);` といったstateの書き換えを行う際にも使われる
    
  - ただし、[この記事](https://qiita.com/yuto_swift_flutter/items/39ebce2fcd561ea01898)のように、使い方には注意する

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
