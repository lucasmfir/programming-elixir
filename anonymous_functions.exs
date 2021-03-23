# 1
# list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]

list_concat = fn list_1, list_2 -> list_1 ++ list_2 end

IO.inspect(list_concat.([:a, :b], [:c, :d]))

# sum.(1, 2, 3) #=> 6

sum = fn x, y, z -> x + y + z end

IO.inspect(sum.(1, 2, 3))

# pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]

pair_tuple_to_list = fn {x, y} -> [x, y] end

IO.inspect(pair_tuple_to_list.({1234, 5678}))

# 2
# Write a function that takes three arguments. 
# If the first two are zero, return “FizzBuzz.” 
# If the first is zero, return “Fizz.” If the second is zero, return “Buzz.” 
# Otherwise return the third argument.

fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, arg -> arg
end

IO.puts(fizz_buzz.(0, 0, 1))
IO.puts(fizz_buzz.(1, 0, 1))
IO.puts(fizz_buzz.(1, 1, 13))

# 3
# The operator rem(a, b) returns the remainder after dividing a by b. 
# Write a function that takes a single integer (n) and calls the function in the previous exercise, passing it rem(n,3), rem(n,5), and n. 
# Call it seven times with the arguments 10, 11, 12, and so on. You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16.”

fb = fn n ->
  fizz_buzz.(rem(n, 3), rem(n, 5), n)
end

IO.puts(fb.(10))
IO.puts(fb.(11))
IO.puts(fb.(12))
IO.puts(fb.(13))
IO.puts(fb.(14))
IO.puts(fb.(15))
IO.puts(fb.(16))

# 4
# Write a function prefix that takes a string. 
# It should return a new function that takes a second string. 
# When that second function is called, it will return a string containing the first string, a space, and the second string.

prefix = fn str_1 -> fn str_2 -> "#{str_1} #{str_2}" end end

mrs = prefix.("mr")
IO.puts(mrs.("balboa"))

IO.puts(prefix.("rocky").("balboa"))

# 5
# Use the & notation to rewrite the following:

# Enum.map [1,2,3,4], fn x -> x + 2 end

Enum.map([1, 2, 3, 4], &(&1 + 2))

IO.inspect Enum.map([1, 2, 3, 4], &(&1 + 2))

# Enum.each [1,2,3,4], fn x -> IO.inspect x end

Enum.each([1,2,3,4], &(IO.inspect(&1)))

Enum.each([1,2,3,4], &IO.inspect/1)
