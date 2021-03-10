defmodule ListFilter do
  def call(list), do: filter(list, 0)

  defp filter([], acc) do
    acc
  end

  defp filter([head | tail], acc) do
    acc =
      acc +
        case Integer.parse(head) do
          {num, ""} -> rem(num, 2)
          :error -> 0
        end

    filter(tail, acc)
  end
end
