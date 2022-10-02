import '../../queues/list_queue.dart';

class TreeNode<E> {
  E vlaue;
  List<TreeNode<E>> children = [];

  TreeNode({required this.vlaue});

  void add({required TreeNode<E> childNode}) {
    children.add(childNode);
  }

  void LeftDepthFirst(void Function(TreeNode<E> node) anonymousFunc) {
// This will go deep to the left first and then will go to the right.
    for (final child in children) {
      child.LeftDepthFirst(
          anonymousFunc); // this is recursion and this function will be called until the base condition is met.
    }
    anonymousFunc(this); // "this" keyword refers to the current class instance
  }

  void forEachLevelFirst(void Function(TreeNode<E> node) fun) {
    final queue = ListQueue<TreeNode<E>>();
    fun(this);
    this.children.forEach((element) {
      queue.enqueue(element);
    });
    var node = queue.dequeue();
    while (node != null) {
      fun(node);
      node.children.forEach((element) {
        queue.enqueue(element);
      });
      node = queue.dequeue();
    }
  } //  forEachLeve

  //? searchTreeNode ... searchin through a node

  TreeNode? searchTreeNode(E value) {
    TreeNode? found;
    LeftDepthFirst((node) {
      if (node.vlaue == value) {
        found = node;
      }
    });
    return found;
  }
}
