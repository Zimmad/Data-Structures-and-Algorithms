# Dynamic-Preogramming 
### Dynamic Programming is an optimization technique using something called cahe. If we have something that can be cache than we can use dynamic programming. Dynamic programming is the way of solving problem by breaking it down into a collection of sub problems, solving each of those sub problems(overlaping sub problems) just once and storing there solutions(caching) if in case, next time that problem reoccurs(so that we don't have to resolve that).

## Dynamic-Programming Memoization (caching)
### Caching is a way to store values so that we can use them later on. It is a wa of speeding up our programs by storing the values(solutions) of overlaping problems.

## How it works? -- Fibonacci 
### Let assume we have a Function that calculates the Fib of a number . EveryTime we put a number in that function that function is  called and the Fibonacci is calculated recursively. So is there a way that enable us to avoid the recalculations of the already calculated fibonaccis. YES.. and that is called memoization(not memorization) . In this case we will store the values of every Fib(as value) of every input number(as Key) into a Map (key, values) and put a if else satatement in the function that if our input value is present as key in the Map then just return (no need to recalculate everything).
### So, Memoization is a way to remember the solution of overlaping sub problem so that we don't have re solve the whole stuff.