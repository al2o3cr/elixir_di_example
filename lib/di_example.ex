defmodule DiExample do
  @moduledoc """
  Documentation for DiExample.
  """

  @deps %{ target: DiTarget }

  @doc """
  Call the `foo` function on the DI target
  """
  def call_foo(arg1, deps \\ @deps) do
    deps.target.foo(arg1)
  end

  # @doc """
  # Call the `foo` function directly on DiTarget
  # """
  # def call_foo_direct(arg1) do
  #   DiTarget.foo(arg1)
  # end
end
