defmodule Rumbl.Repo do
  @moduledoc """
  In memory repository.
  """

  def all(Rumbl.User) do
    [
      %Rumbl.User{id: 1, name: 'Dante', username: 'dante', password: 'alighieri'},
      %Rumbl.User{id: 2, name: 'Italo', username: 'italo', password: 'calvino'},
      %Rumbl.User{id: 3, name: 'Luigi', username: 'luigi', password: 'pirandello'}
    ]
  end
  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map ->
      map.id == id
    end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
