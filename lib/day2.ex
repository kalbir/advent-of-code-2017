defmodule Checksum do

  def number_to_list(num) do
    Integer.digits(num)
  end

  def difference(list) do
    min = Enum.min(list)
    max = Enum.max(list)
    difference = max - min 
  end

  def process_file(file) do 
     file
       |> File.read!
       |> String.split(~r{\n}, parts: :infinity)
       |> Enum.map(fn(x) -> String.split(x, ~r{\t}, parts: :infinity) end)
  end 

  def compute(list_of_lists) do
    list_of_lists
       |> Enum.map(fn(x) -> x 
         |> Enum.reject(fn(x) -> x == "" end)
         |> Enum.map(fn(s) -> String.to_integer(s) end) end)
       |> Enum.reject(fn(x) -> x == [] end)
       |> Enum.map(fn(x) -> Checksum.difference(x) end)
       |> Enum.sum

  end
  
end
