defmodule Project0.Week2.Tasks do
  # Minimal tasks
  def isPrime(n) do
    listDivisors =
      for x <- 1..n do
        if rem(n, x) == 0 do
          x
        end
      end

    divisorsCount =
      listDivisors
      |> Enum.reject(fn x -> is_nil(x) end)
      |> Enum.count()

    cond do
      divisorsCount == 2 ->
        true

      divisorsCount != 2 ->
        false
    end
  end

  # IO.inspect(Project0.Week2.Tasks.isPrime(11))

  def cylinderArea(h, r) do
    2 * :math.pi() * :math.pow(r, 2) + 2 * :math.pi() * r * h
  end

  def reverse(list) do
    Enum.reverse(list)
  end

  def uniqueSum(list) do
    Enum.frequencies(list)
    |> Map.keys()
    |> Enum.sum()
  end

  def extractRandomN(list, n) do
    Enum.take_random(list, n)
  end

  def firstFibonacciElements(n) do
    for x <- 1..n do
      fib(x)
    end
  end

  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(n) do fib(n - 1) + fib(n - 2) end

  def translator(dictionary, original_string) do
    original_string
    |> String.split(" ")
    |> Enum.map(fn x -> if Map.get(dictionary, String.to_atom(x)) do
        Map.get(dictionary,String.to_atom(x))
      else
        x
      end
    end)
    |> Enum.join(" ")
  end

  def smallestNumber(a, b, c) do
    sorted_list = Enum.sort([a, b, c])
    zero_count = Enum.count(sorted_list, fn x -> x == 0 end)

    number =
      cond do
        zero_count == 0 ->
          sorted_list

        zero_count == 1 ->
          [Enum.fetch!(sorted_list, 1), 0, Enum.fetch!(sorted_list, 2)]

        zero_count == 2 ->
          Enum.reverse(sorted_list)
      end

    Enum.reduce(number, "", fn x, acc ->
      acc <> "#{x}"
    end)
    |> String.to_integer()
  end

  def rotateLeft(list, n) do
    Enum.slice(list, n..-1) ++ Enum.slice(list, 0..(n - 1))
  end

  def listRightAngleTriangles do
    list =
      for a <- 1..20, b <- 1..20 do
        if trunc(:math.sqrt(a * a + b * b)) - :math.sqrt(a * a + b * b) == 0 do
          {a, b, trunc(:math.sqrt(a * a + b * b))}
        end
      end

    list
    |> Enum.filter(fn x -> !is_nil(x) end)
  end

  # Main tasks
  def removeConsecutiveDuplicates(list) do
    Enum.dedup(list)
  end
end
