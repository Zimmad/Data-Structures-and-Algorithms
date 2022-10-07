// int calculations = 0;
// int fib(int n) {
//   calculations++; //fro n = 10 ,calculations =55. for n=15, calculations =1973. and this is horrific.
//   if (n < 2)
//     return n;
//   else {
//     return fib(n - 1) + fib(n - 2);
//   }
// }

// *******------Calculating Fib Dynamicly------------***************
int calculations =
    0; // in this case for n=10, calculations =19 and for n=15,calculations=29. now time complexity is O(n)
Map<int, int> cache = {};
int dynaminFib(int n) {
  calculations++;
  if (cache.containsKey(n)) {
    return cache[n]!;
  }
  if (n < 2) {
    return n;
  } else {
    cache[n] = dynaminFib(n - 1) + dynaminFib(n - 2);
    return cache[n]!;
  }
}

//******----Dynamic-Programming-Tabulation (BottomUp) Technique---------**********
int fibTabulation(int n) {
  final answer = [0, 1];
  for (var i = 2; i <= n; i++) {
    answer.add(answer[i - 2] + answer[i - 1]);
  }
  return answer.last;
}

void main(List<String> args) {
  var fibo = dynaminFib(15);
  print(fibo);
  print(calculations);
  print(fibTabulation(15));
}
