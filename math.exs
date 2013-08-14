defmodule Math do
  @doc """
  Sum a list

  ## Examples
    iex> Math.sum([1, 2, 3])
    6

    iex> Math.sum([])
    0
  """
  def sum(list) when is_list(list) do
    do_sum list, 0
  end

  defp do_sum([head|tail], total) do
    total = total + head

    do_sum tail, total
  end

  defp do_sum([], total), do: total
end

ExUnit.start

defmodule MathTest do
  use ExUnit.Case, async: true
  doctest Math
end
