// Declerartion of Dart Array. List are generics.
List<String> array = ['cat', 'pigeon', 'eagle'];

// Declerartion of Dart Map. Maps are generics.

Map<String, int> dartMap = {'team 1': 100, 'team 2': 150, 'team 3': 127};

// Declerartion of Dart Sets. Sets are generics.

Set<int> dartSet = {1, 2, 3, 4};

// --------------- *********** ------------------

void main(List<String> args) {
  // ? Arrays
  print(array.length); // this is O(1) operations and space complexity

  print(array[1]); // random access is O(1) time and space complexity

  array.add('peacock'); // adding element to the end. O(1)  Time and  Space.

  array.insert(4,
      'horse'); // inserting at any location. O(n) operations, cause the whole list shuffles and rearranges elements

  // ? Maps

  dartMap['team 4'] =
      140; // Inserting in the end. Constant time operatrion-- O(1). Searching for a particular Item is O(1) as compare to Lists

  print(dartMap
      .length); // its also an Iterable and retrin=ving length is constant time operations.

  // ? Sets

  dartSet.add(2); // 2 is already present. So it will doiscard one of the 2s.
  print(dartSet); // will print{1,2,3,4}
}
