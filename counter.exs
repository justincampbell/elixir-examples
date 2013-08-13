defmodule Counter do
  def spawn do
    spawn __MODULE__, :tick, [0]
  end

  def tick(counter) do
    receive do
      { sender, :query } -> sender <- counter
      :reload -> __MODULE__.tick(counter)
      :reset -> counter = 0
      n -> counter = counter + n
    end

    tick counter
  end
end

# iex counter.exs
#
# counter = Counter.spawn
# counter <- 1
# counter <- 2
# counter <- { self, :query }
# flush
# counter <- :reset
# counter <- { self, :query }
# flush
