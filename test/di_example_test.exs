defmodule DiExampleTest do
  use ExUnit.Case
  doctest DiExample

  defmodule FakeTarget do
    def foo(_arg1) do
      42
    end
  end

  test "calls foo" do
    assert DiExample.call_foo(1, %{target: FakeTarget}) == 42
  end

  test "calls foo without fake" do
    assert DiExample.call_foo(1) == 2
  end

  # test "calls foo direct" do
  #   assert DiExample.call_foo_direct(1) == 2
  # end
end
