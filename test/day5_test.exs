defmodule MazeTest do
  use ExUnit.Case

  test "This particular maze only" do
    assert Maze.where_to_move([0, 3, 0, 1, -3], 0, 0) == {:done, 5}
  end

end
