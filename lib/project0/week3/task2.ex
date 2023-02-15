defmodule Project0.Week3.Task2 do
  def message do
    receive do
      {:integers, a} when is_integer(a) -> IO.puts(a + 1)
      {:strings, b} when is_bitstring(b) -> IO.puts(String.downcase(b))
      _ -> IO.puts "I don't know how to HANDLE this!"
    end
    message()
  end
end

pid = spawn(Project0.Week3.Task2, :message, [])

send(pid, {:integers, 10})
send(pid, {:strings, "Hello"})
send(pid, {10, "Hello"})
