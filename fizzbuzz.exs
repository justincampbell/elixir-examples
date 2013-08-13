defmodule FizzBuzz do
  def run do
    Enum.each 1..100, fn (n) ->
      n |> parse |> IO.puts
    end
  end

  defp parse(n) do
    case { rem(n,3), rem(n,5) } do
      { 0, 0 } -> "FizzBuzz"
      { 0, _ } -> "Fizz"
      { _, 0 } -> "Buzz"
      { _, _ } -> n
    end
  end
end

FizzBuzz.run
