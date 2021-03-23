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

# 6
# The most efficient way to find the number is to guess halfway between the low and high numbers of the range.
# If our guess is too big, then the answer lies between the bottom of the range and one less than our guess.
# If our guess is too small, then the answer lies between one more than our guess and the end of the range.

defmodule Chop do
  def guess(n, range = low..high) do
    g = div(low + high, 2)
    IO.puts("Is it #{g}")

    guess(n, g, range)
  end

  def guess(n, g, _low..high) when g < n do
    guess(n, (g + 1)..high)
  end

  def guess(n, g, low.._high) when g > n do
    guess(n, low..(g - 1))
  end

  def guess(n, n, _) do
    IO.puts("Its #{n}")
  end
end
