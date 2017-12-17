defmodule Maze do

  def process_file(file) do
     file
       |> File.read!
       |> String.split(~r{\n}, parts: :infinity)
       |> Enum.reject(fn(x) -> x == "" end)
       |> Enum.map(fn(x) -> String.to_integer(x) end)
  end

  # move_around is meant to take the long list of numbers and a position - which is a single number
  # that we are beginning at.
  # It should do two things:
  # 1. take the current position number, n, and move n positions to the next number, returning that number
  # 2. add one to the number at the position it started with a return a new list with n+1 in the position of n
  # this leads me to believe it should be 2 functions!


  # This implements most of the above - it takes the current position number, goes to that position to find out what
  # number is there and then returns the difference beteen that number and the current position as the `new_position`
  def where_to_move(list_of_numbers, position, acc) do
     # takes the number at `position`, returns :none if there isn't a number there (so you are done!)
     nth_item    = Enum.at(list_of_numbers, position, :none)

     case nth_item do
       :none ->
         {:done, acc}
       _     ->
         new_list = change_the_list(list_of_numbers, position)
         new_position = position + nth_item
         new_position_string = Integer.to_string(new_position)
         IO.puts(new_position_string)
         where_to_move(new_list, new_position, acc + 1)
     end
  end

  # This implements 2. from above.
  def change_the_list(list_of_numbers, position) do
    nth_item = Enum.at(list_of_numbers, position) + 1
    new_list = List.replace_at(list_of_numbers, position, nth_item)
  end

  # Part 2
  def where_to_move_2(list_of_numbers, position, acc) do
     # takes the number at `position`, returns :none if there isn't a number there (so you are done!)
     nth_item    = Enum.at(list_of_numbers, position, :none)

     case nth_item do
       :none ->
         {:done, acc}
       _     ->
         new_list = change_the_list_2(list_of_numbers, position)
         new_position = position + nth_item
         where_to_move_2(new_list, new_position, acc + 1)
     end
  end

  def change_the_list_2(list_of_numbers, position) do
    nth_item = Enum.at(list_of_numbers, position)

    new_nth_item =
      case nth_item do
        i when i > 2 ->
          Enum.at(list_of_numbers, position) - 1
        i when i < 3 ->
          Enum.at(list_of_numbers, position) + 1
      end

    new_list = List.replace_at(list_of_numbers, position, new_nth_item)
  end

end
