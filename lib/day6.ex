defmodule Blocks do

  def something([], list) do
      something(list)
  end

  def something ([head | []], list) do
    something(list)
  end

  def something([ head | tail ]) do
    head + 1, something(tail)
  end

end
