any_message = fn ->
  # receive statement causes the actor to block until a message arrives in its mailbox
  receive do
    message -> IO.puts message
  end
end

# an actor is created by using the spawn functions
# spawn takes a function and returns a “process identifier”, aka a pid
actor = spawn(any_message)

# send takes a pid and a string, adds the string to the actor’s mailbox and returns immediately
send(actor, "This is a message")
