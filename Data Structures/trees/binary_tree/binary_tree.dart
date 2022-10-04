import 'dart:html';

class BinaryTreeNode<E> {
  E value;
  BinaryTreeNode<E>? leftChildNode;
  BinaryTreeNode<E>? rightChildNode;
  BinaryTreeNode({required this.value});

// It should only be used in BST. It gets the very left child of the tree..
  BinaryTreeNode<E> get min => leftChildNode?.min ?? this;

  //? ... Traersal Algorithms...

// inOrder traversal
  void inOrderTraversal(void Function(E value) action) {
    leftChildNode?.inOrderTraversal(action);
    action(value);
    rightChildNode?.inOrderTraversal(action);
  }

  // postOrderTraversal
  void postOrderTraversal(void Function(E value) action) {
    leftChildNode?.postOrderTraversal(action);
    rightChildNode?.postOrderTraversal(action);
    action(value);
  }

// preOrderTraversal
  void preOrdertraversa(void Function(E value) action) {
    action(value);
    leftChildNode?.preOrdertraversa(action);
    rightChildNode?.preOrdertraversa(action);
  }

  //? This algorithm is from "Károly Lőrentey" which he has specified(implemented) in his book  "Optimizing Collections.
  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    BinaryTreeNode<E>? node, [
    String top = '',
    String middle = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$middle null\n';
    }
    if (node.leftChildNode == null && node.rightChildNode == null) {
      return '$middle ${node.value}\n';
    }

    // ? Recursively Iterate through right node till there are right nodes availsable
    final a = _diagram(
      node.rightChildNode,
      '$top ',
      '$top┌──',
      '$top│ ',
    );

    //? store the value of node in 'b' as string along with "__"
    final b = '$middle${node.value}\n';
    //? if there are node in the left child recursively store them in the 'c'. This will be checked after every pop up from the call stack
    final c = _diagram(
      node.leftChildNode,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );

//? return this string value after all the conditions are checked for each side of the node. First side to be printed will be the very right leaf node...
    return '$a$b$c';
  }
}
