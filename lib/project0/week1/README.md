
# P0W1 – Welcome...

**Minimal Task** Follow an installation guide to install the language / development environment of your choice.

**Minimal Task** Write a script that would print the message “Hello PTR” on the screen. Execute it.

Printing a message can be done in two ways :

- interactive mode (from terminal, using `iex`, `elixir` or `elixirc`):
  
```elixir
iex(3)> "HELLO" <> " PTR"
"HELLO PTR"
```

- running a script:

```elixir
defmodule Ptr do
  def hello do
    "Hello PTR"
  end
end

IO.puts(Ptr.hello)
```

**Main Task** Initialize a VCS repository for your project. Push your project to a remote repo.

**Bonus Task** Write a comprehensive readme for your repository.

**Bonus Task** Create a unit test for your project. Execute it.

Unit test :

```elixir
defmodule PtrTest do
  use ExUnit.Case

  test "outputs Hello PTR" do
    assert Ptr.hello() == "Hello PTR"
  end
end
```

The output :

```txt
Compiling 1 file (.ex)
Hello PTR
.
Finished in 0.01 seconds (0.00s async, 0.01s sync)
1 test, 0 failures

Randomized with seed 141943
```
