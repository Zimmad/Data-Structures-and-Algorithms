# Heaps
### A complete binary tree that is implemented by usng Array(List).

## Note -- 
### Memory Heaps is a complete different concept. Memory Heaps are used for memory allocation that can be randomly accessed. For further info, It should be searched on google.

### There are two types of heaps on the bases of priority.

## Max Heap
### In Max Heap elements with a higher value have a higher priority.

## Min Heap
### In Min Heap elements with lower values have higher priority.

## In Max Heap parent node must be greater than or equal to its child node.
## IN Min Heap parent node must be smalller than or equal to its child node.

### Heaps are partialy sorted arrays . 

## As we uses array (lists) for building heaps, So we will call '2 * index + 1' as Left child and '2 * index + 1 ' as right child. The index of the parent node will be '((index - 1) / 2 ). truncate() ' or (index - 1) ~/2'.s