defmodule Project0.Week2.Tasks do
  def isPrime(n) do
    listDivisors = for x <- 1..n do
      if rem(n, x) == 0 do
        x
      end
    end
    divisorsCount = listDivisors
    |> Enum.reject(fn x -> is_nil(x) end)
    |> Enum.count()

    cond do
      divisorsCount == 2 ->
        true
      divisorsCount != 2 ->
        false
    end
    # IO.inspect(Project0.Week2.Tasks.isPrime(11))
  end

  def cylinderArea(h, r) do
    2 * :math.pi * :math.pow(r,2) + 2 * :math.pi * r * h
    # IO.inspect(Project0.Week2.Tasks.cylinderArea(3,4))
  end

  def reverse(list) do
    Enum.reverse(list)
  end
  # IO.inspect(Project0.Week2.Tasks.reverse([1,2,4,8,4]))
end
