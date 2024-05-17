import 'package:tree/model/event_model.dart';
import 'package:tree/model/tree_node.dart';

/// Класс узла События в Дереве Событий в Визарда.
class EventNode extends TreeNode<WizardEventModel> {
  /// Класс узла События в Дереве Событий в Визарда.
  EventNode(super.event, {super.parent});

  /// Корневой узел События в Дереве Событий в Визарда.
  EventNode.root(super.event);

  /// Узел События в Дереве Событий в Визарда (не корневой).
  EventNode.node(super.event, {required super.parent});
}
