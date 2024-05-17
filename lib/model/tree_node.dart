import 'package:flutter/foundation.dart';

/// Класс для узла небинарного Дерева.
class TreeNode<T> {
  /// Значение узла Дерева.
  T value;

  /// Родительский узел Дерева.
  TreeNode<T>? parent;

  /// Список дочерних узлов Дерева.
  List<TreeNode<T>> children;

  /// Класс для узла небинарного Дерева.
  TreeNode(this.value, {this.parent}) : children = [];

  /// Добавление дочернего узла Дерева.
  void addChild(TreeNode<T> child) {
    child.parent = this;
    children.add(child);
  }

  /// Поиск узла по значению (обход в глубину).
  TreeNode<T>? find(T value) {
    if (this.value == value) {
      return this;
    }

    for (TreeNode<T> child in children) {
      final found = child.find(value);
      if (found != null) {
        return found;
      }
    }

    return null;
  }

  /// Печать Дерева относительно данного узла.
  ///
  /// Параметр level отвечает за отступы отражающие уровень вложенности узлов.
  void printTree([int level = 0]) {
    print('${' ' * level}$value');
    for (TreeNode<T> child in children) {
      child.printTree(level + 2);
    }
  }

  // TreeNode<T> copyWith({
  //   T? value,
  //   List<TreeNode<T>>? children,
  // }) {
  //   return TreeNode<T>(
  //     value: value ?? this.value,
  //     children: children ?? this.children,
  //   );
  // }

  @override
  String toString() => '${TreeNode<T>}(value: $value,'
      ' parent: ${parent?.value} children: $children)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TreeNode<T> &&
        other.value == value &&
        other.parent == parent &&
        listEquals(other.children, children);
  }

  @override
  int get hashCode => value.hashCode ^ parent.hashCode ^ children.hashCode;
}