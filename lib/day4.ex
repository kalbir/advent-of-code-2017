defmodule Passphrase do
  def break_on_space(string) do
    string |>
      String.split
  end

  def process_file(file) do
     file
       |> File.read!
       |> String.split(~r{\n}, parts: :infinity)
  end

  def compare_the_lists(list1, list2) do
    case list1 == list2 do
      true  -> {:ok, :valid}
      false -> {:error, :invalid}
    end
  end

  # This is all based around the idea that you have a list of strings e.g.
  # ["abc", "def", "abc", "ghi"]. When you apply `Enum.uniq` to that list it will get rid of any duplicates
  # in the list. So if you compare the original, with the result of applying
  # `Enum.uniq`, if they are the same there are no duplicates, if they are different
  # then there are duplicates (invalid passphrase).
  def validate(string) do
      list_of_strings = break_on_space(string)
      validation = compare_the_lists(list_of_strings, Enum.uniq(list_of_strings))
  end

  def answer(file) do
    file
      |> process_file
      |> Enum.reject(fn(x) -> x == "" end)
      |> Enum.map(fn(x) -> validate(x) end)
      |> Enum.count(fn(y) -> y == {:ok, :valid} end)
  end

  def sort_the_characters(string) do
    string
      |> break_on_space
      |> Enum.map(fn(x) -> String.graphemes(x) end)
      |> Enum.map(fn(x) -> Enum.sort(x) end)
  end

  def contains_anagram?(list) do
    case compare_the_lists(list, Enum.uniq(list)) do
      {:ok, :valid} -> true
      {:error, :invalid} -> false
    end
  end

  def answer_part2(file) do
    file
      |> process_file
      |> Enum.reject(fn(x) -> x == "" end)
      |> Enum.map(fn(x)    -> sort_the_characters(x) end)
      |> Enum.map(fn(x)    -> contains_anagram?(x) end)
      |> Enum.count(fn(y)  -> y == true end)
  end

end
