import 'node.dart';

class LinkedList<E> extends Iterable<E> {
  Node<E>? _head;
  Node<E>? _tail;

  // -------*******-------
  //? isEmpty ..

  bool get isEmpty {
    return _head == null;
  }

  //? pushing vlaue into the linked list

  void push(E value) {
    _head = Node(value: value, next: _head);
    if (_tail == null) {
      _tail = _head;
    }
  }

  //? append ..
  void append(E value) {
    if (_head == null) {
      push(value);
      return;
    }
    if (_tail != null) {
      _tail!.next = Node(value: value);

      _tail = _tail!.next;
    }
  }

  //? inserNodeAt... Inserting node at specific index

  void insertNodeAt({required int index, required E value}) {
    var currentNode = _head;
    var currentIndex = 0;
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex++;
    }
    // var temp = currentNode.next;
    currentNode!.next = Node(value: value, next: currentNode.next);
  }

//?  insertAfterNode .... inserting a node after a certain node.
  Node<E> insertAfterNode(Node<E> node, E value) {
    if (_tail == node) {
      append(value);
      return _tail!;
    }
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  //? poping  a node from the linked list..

  E? pop() {
    if (isEmpty) {
      print('Node connot be poped as the list is empty');
      return null;
    }
    final value = _head?.value;
    _head = _head!.next;
    if (isEmpty) {
      _tail = null;
    }
    return value;
  }

//? removeLast ....
  E? removeLast() {
    if (_head?.next == null) {
      return pop();
    }

    Node<E>? currentNode = _head;
    while (currentNode!.next != _tail) {
      currentNode = currentNode.next;
    }
    final value = _tail?.value;
    _tail = currentNode;
    _tail?.next = null;
    return value;
  }

  //? removeAfterNode...

  E? removeAfterNode(Node<E> node) {
    final value = node.next?.value;
    if (node.next == _tail) {
      _tail = node;
    }
    node.next = node.next?.next;
    return value;
  }

  @override
  String toString() {
    if (isEmpty) return "Linked List is Empty";
    return _head.toString();
  }

// To Make our linked List iterable we have to create The Linked List Iterator..
  @override
  // TODO: implement iterator
  Iterator<E> get iterator => throw UnimplementedError();
}
