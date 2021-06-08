# 1
# Write a mapsum function that takes a list and a function.
# It applies the function to each element of the list and then sums the result, so

# ​   ​iex>​ MyList.mapsum [1, 2, 3], &(&1 * &1)
# ​   14

# 2
# Write a max(list) that returns the element with the maximum value in the list.
# (This is slightly trickier than it sounds.)

# 3
# An Elixir single-quoted string is actually a list of individual character codes.
# Write a caesar(list, n) function that adds n to each list element, wrapping if the addition results in a character greater than z.

# ​   ​iex>​ MyList.caesar(​'ryvkve'​, 13)
# ​   ?????? :)

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

  # 8
  #   The Pragmatic Bookshelf has offices in Texas (TX) and North Carolina (NC), so we have to charge sales tax on orders shipped to these states. The rates can be expressed as a keyword list (I wish it were that simple.…):

  # Write a function that takes both lists and returns a copy of the orders, but with an extra field, total_amount, which is the net plus sales tax. If a shipment is not to NC or TX, there’s no tax applied.

  def orders_with_total do
    tax_rates = [NC: 0.075, TX: 0.08]

    orders = [
      [id: 123, ship_to: :NC, net_amount: 100.00],
      [id: 124, ship_to: :OK, net_amount: 35.50],
      [id: 125, ship_to: :TX, net_amount: 24.00],
      [id: 126, ship_to: :TX, net_amount: 44.80],
      [id: 127, ship_to: :NC, net_amount: 25.00],
      [id: 128, ship_to: :MA, net_amount: 10.00],
      [id: 129, ship_to: :CA, net_amount: 102.00],
      [id: 130, ship_to: :NC, net_amount: 50.00]
    ]

    orders |> Enum.map(&add_total_to(&1, tax_rates))
  end

  def add_total_to(order = [id: _, ship_to: state, net_amount: net], tax_rates) do
    tax_rate = Keyword.get(tax_rates, state, 0)
    tax = net * tax_rate
    total = net + tax
    Keyword.put(order, :total_amount, total)
  end
end
