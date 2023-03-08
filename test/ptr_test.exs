defmodule PtrTest do
  use ExUnit.Case

  test "outputs Hello PTR" do
    assert Ptr.hello() == "Hello PTR"
  end

  test "is not prime" do
    assert Project0.Week2.Tasks.isPrime(10) == false
  end

  test "is prime" do
    assert Project0.Week2.Tasks.isPrime(11) == true
  end

  test "verify translate" do
    assert Project0.Week2.Tasks.translator(%{ mama: "mother", papa: "father"}, "mama is with papa") == "mother is with"
  end
end
