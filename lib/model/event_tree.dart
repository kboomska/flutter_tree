import 'package:tree/model/event_model.dart';
import 'package:tree/model/tree_node.dart';

/// Класс узла События в Дереве Событий в Визарда.
sealed class EventTree extends TreeNode<WizardEventModel> {
  /// Класс узла События в Дереве Событий в Визарда.
  EventTree(super.value, {super.parent});

  /// Корневой узел События в Дереве Событий в Визарда.
  factory EventTree.root(WizardEventModel value) => RootEventTree(value);

  /// Узел События в Дереве Событий в Визарда (не корневой).
  factory EventTree.node(
    WizardEventModel value, {
    required EventTree parent,
  }) =>
      NodeEventTree(value, parent: parent);
}

/// Класс для корневого узла События в Дереве Событий в Визарда.
final class RootEventTree extends EventTree {
  RootEventTree(super.value);

  /// Корневой узел не имеет родителя.
  @override
  EventTree? get parent => null;
}

/// Класс для узла События в Дереве Событий в Визарда (не корневого).
final class NodeEventTree extends EventTree {
  NodeEventTree(super.value, {required EventTree parent})
      : super(parent: parent);
}
