# 1
# Write a mapsum function that takes a list and a function.
# It applies the function to each element of the list and then sums the result, so

# ​ 	​iex>​ MyList.mapsum [1, 2, 3], &(&1 * &1)
# ​ 	14

# 2
# Write a max(list) that returns the element with the maximum value in the list.
# (This is slightly trickier than it sounds.)

# 3
# An Elixir single-quoted string is actually a list of individual character codes.
# Write a caesar(list, n) function that adds n to each list element, wrapping if the addition results in a character greater than z.

# ​ 	​iex>​ MyList.caesar(​'ryvkve'​, 13)
# ​ 	?????? :)

# 4
# Write a function MyList.span(from, to) that returns a list of the numbers from from up to to.

defmodule MyList do
  def mapsum([], _func), do: 0

  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def max_val([x]), do: x

  def max_val([head | tail]), do: Kernel.max(head, max_val(tail))

  def caesar([], _n), do: []

  def caesar([head | tail], n) when head + n <= ?z do
    [head + n | caesar(tail, n)]
  end

  def caesar([head | tail], n), do: [head + n - 26 | caesar(tail, n)]

  # book solution for 4
  # def span(from, to) when from > to, do: []

  def span(to, to), do: [to]

  def span(from, to), do: [from | span(from + 1, to)]
end
