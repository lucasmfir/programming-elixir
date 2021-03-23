# 1
# Extend the Times module with a triple function that multiplies its parameter by three.

# 2
# Run the result in IEx. Use both techniques to compile the file.

# 3
# Add a quadruple function. (Maybe it could call the double function.…)

defmodule Times do
  def double(n), do: n * 2

  def triple(n), do: n * 3

  def quadruple(n), do: double(double(n))
end

# use the following command to compile file: iex modules_and_functions.ex

# 4
# Implement and run a function sum(n) that uses recursion to calculate the sum of the integers from 1 to n. 
# You’ll need to write this function inside a module in a separate file. 
# Then load up IEx, compile that file, and try your function.

# 5
# Write a function gcd(x,y) that finds the greatest common divisor between two nonnegative integers. 
# Algebraically, gcd(x,y) is x if y is zero; it’s gcd(y, rem(x,y)) otherwise.

defmodule Arithmetic do
  def sum(1), do: 1
  def sum(n), do: n + sum(n - 1)

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end
