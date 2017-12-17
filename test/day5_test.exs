defmodule MazeTest do
  use ExUnit.Case

  test "This particular maze only" do
    assert Maze.outside([0, 3, 0, 1, -3]) == 5
  end

end
