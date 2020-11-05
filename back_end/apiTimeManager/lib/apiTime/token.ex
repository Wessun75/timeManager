defmodule Todolist.Token do
  use Joken.Config

  def token_config do
    default_claims()
    |> add_claim("username", fn -> "John Doe" end, &(&1 == "John Doe"))
  end
end