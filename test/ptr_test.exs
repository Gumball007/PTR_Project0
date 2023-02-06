defmodule PtrTest do
  use ExUnit.Case

  test "outputs Hello PTR" do
    assert Ptr.hello() == "Hello PTR"
  end
end
