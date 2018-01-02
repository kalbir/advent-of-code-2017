defmodule Bottom do

  # This is getting pretty familar. This time we split on the space. The thing we get back is a list
  # of lists which takes one of two forms:
  # 1. ["fwft" "(72)" "->" "ktlj," "cntj," "xhth"]
  # 2. ["sfets" "(45)"]
  def process_file(file) do
     file
       |> File.read!
       |> String.split(~r{\n}, parts: :infinity)
       |> Enum.reject(fn(x) -> x == "" end)
       |> Enum.map(fn(x) -> String.split(x, " ") end)
  end

  # Takes the list of lists from `process_file` and does
  # a bit of pattern matching to give back the lists that have sublists
  def match_sublist(list) do
    # The lists with > 2 elements are the ones we want
    case Enum.count(list) > 2 do
      # If it has > 2 elements give it back to me
      true ->
        list
      # If it is less than 3 elements return nil
      false ->
        nil
    end
  end

  # Turns the sublists into one long list that just has the items that were in the sublists
  def get_just_sublist_items(list) do
    list
      |> Enum.map(fn(x) -> Bottom.match_sublist(x) end)
      |> Enum.filter(fn(x) -> x != nil end)
      |> Enum.map(fn(x) -> Enum.drop(x, 3) end)
      |> List.flatten
  end

  # Now a function that builds a list of all of the base items
  # i.e. all the ones in the first column of the input
  def get_all_base_items(list) do
    list
      |> Enum.map(fn(x) -> Enum.fetch!(x, 0) end)
  end

  def find(file) do

  end

end
