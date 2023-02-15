defmodule Project0.Week3.Task2 do
  def averager(count, accumulator) do
    receive do
      a when is_integer(a) ->
       IO.puts((accumulator + a) / (count + 1))
       averager(count + 1, accumulator + a)
    end
  end
end

pid = spawn(fn -> Project0.Week3.Task2.averager(0, 0) end)

send(pid, 10)
send(pid, 9)
send(pid, 5)
send(pid, 1)
