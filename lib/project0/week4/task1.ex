defmodule Worker do

  @doc """
  Pool.start_link(4)
  Pool.send_message(2, "Hello, worker 2!")
  Pool.kill_worker(3)
  Supervisor.which_children(pid(0,,0))
  """
  
  use GenServer

  def start_link(id) do
    IO.puts "Starting worker #{id}"
    
   # starts a new worker process, and registers it with a given id to allow other processes to send messages 
   # to the worker process using its registered name instead of its PID
    GenServer.start_link(__MODULE__, [], name: id)
  end

  # callback function required by the GenServer behaviour, which initializes the server state
  # in this case, the state is just an empty list.
  def init(_) do
    {:ok, []}
  end
  
  #  sends a message to a specific worker process identified by the id argument
  def echo(id, message) do
    GenServer.cast(:"#{id}", {:echo, message})
  end

  # sends a message to the same worker process identified by the id argument, requesting the worker process to stop executing
  def kill(id) do
    GenServer.cast(:"#{id}", :kill)
  end

  # handles asynchronous messages sent to the server
  # server can handle two types of messages: {:echo, message} and :kill.

  def handle_cast({:echo, message}, _state) do
    #  prints out a message to the console, indicating that a message has been received by the worker
    IO.puts "Worker #{inspect self()} received: #{inspect message}"
    {:noreply, message}
  end

  def handle_cast(:kill, state) do
    # prints out a message to the console, indicating that the worker has been killed, and then terminates the worker process
    IO.puts "Worker #{inspect self()} killed"
    Process.exit(self(), :kill)
    {:noreply, state}
  end
end


# the Pool module uses the Supervisor behaviour to manage a pool of Worker processes
# it defines three functions to be used externally: start_link/1, send_message/2, and kill_worker/1.
defmodule Pool do
  use Supervisor

  def start_link(num_workers) do
    # starts a supervisor process that manages a given number of Worker processes
    Supervisor.start_link(__MODULE__, num_workers)
  end

  def init(num_workers) do
    children = for i <- 1..num_workers do
      %{
        id: i,
        start: {Worker, :start_link, [:"#{i}"]}
      }
    end

    Supervisor.init(children, strategy: :one_for_one)
  end

  # sends a message to a specific Worker process identified by the worker_id argument using the Worker.echo function
  def send_message(worker_id, message) do
    Worker.echo(worker_id, message)
  end

  # sends a kill message to the same Worker process identified by the worker_id argument using the Worker.kill function
  def kill_worker(worker_id) do
    Worker.kill(worker_id)
  end
end