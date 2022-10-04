import 'dart:html';

import '../binary_tree/binary_tree.dart';

class BST<E extends Comparable<dynamic>> {
  BinaryTreeNode<E>? root;

  // helper (private) methods

  BinaryTreeNode<E> _insertHelper(BinaryTreeNode<E>? node, E value) {
    if (node == null)
      return BinaryTreeNode(
          value:
              value); // Base case (The recursion stops whe met with base case)
    if (value.compareTo(node.value) < 0) {
      node.leftChildNode = _insertHelper(node.leftChildNode, value);
    } else {
      node.rightChildNode = _insertHelper(node.rightChildNode, value);
    }
    return node; //This Return statement is for keeping the track of previous recursive call.
  }

//? insert .. to insert a vlaue in the tree.
// this is O(n) operations. But when tree is balanced then this becomes O(log n) operations
  void insert({required E value}) {
    root = _insertHelper(root, value);
  }
//? search.. searching for a value in a tree.
// We can use the Binary-Tree Traversal methods (inOrder, PreOrder and postOrder Traversals) for searching in the tree but they are O(n) operations in all cases
//to have O(log n) time complexity we will do some comparisons before going deep in the subtrees

  // BinaryTreeNode<E>? search({required E value}) {
  //   var current = root;
  //   while (current != null) {
  //     if (current.value == value)
  //       return current;
  //     else if (value.compareTo(current.value) < 0) {
  //       current = current.leftChildNode;
  //     } else {
  //       current = current.rightChildNode;
  //     }
  //   }
  //   return null;
  // }

// isPresent // checks if the value is present in the tree
  bool isPresent(E value) {
    var current = root;
    while (current != null) {
      if (current.value == value)
        return true;
      else if (current.value.compareTo(value) > 0) {
        current = current.leftChildNode;
      } else {
        current = current.rightChildNode;
      }
    }
    return false;
  }

//? remove .. remove method is comming soon...
  @override
  String toString() => "$root";
}
