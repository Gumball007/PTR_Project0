defmodule Project0.Week3.Task3 do

  @doc """
  iex -S mix
  import Project0.Week3.Task3

  child = spawn(fn -> actor2 end)
  parent = spawn(fn -> actor1(child) end)

  send(child, :work)
  """

  def actor2 do
    receive do
      :work ->
        IO.puts("Working...")
        :timer.sleep(2_000)
        IO.puts("Finished!")
    end
  end

  def actor1(pid) do
    Process.monitor(pid)
    receive do
      {:DOWN, _, :process, _, _} ->
        IO.puts "Process exited!!!"
        Process.exit(self(), :ok)
    end
    actor1(pid)
  end
end
