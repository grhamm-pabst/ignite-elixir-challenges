defmodule FreelaReports do
  @months %{
    "1" => "janeiro",
    "2" => "fevereiro",
    "3" => "março",
    "4" => "abril",
    "5" => "maio",
    "6" => "junho",
    "7" => "julho",
    "8" => "agosto",
    "9" => "setembro",
    "10" => "outubro",
    "11" => "novembro",
    "12" => "dezembro"
  }

  def build(file_name) do
    file_name
    |> File.stream!()
    |> Stream.map(&parse_line/1)
    |> Stream.map(&generate_initial_report/1)
    |> Enum.reduce(report_acc(), fn report, acc -> update_report(report, acc) end)
  end

  def update_report(report, acc) do
    Map.merge(report, acc, fn key, value1, value2 ->
      inner_update(key, value1, value2)
    end)
  end

  def inner_update(key, value1, value2) when key == :all_hours do
    Map.merge(value1, value2, fn _key, value1, value2 ->
      value1 + value2
    end)
  end

  def inner_update(key, value1, value2) when key == :hours_per_month or key == :hours_per_year do
    Map.merge(value1, value2, fn _key, value1, value2 ->
      Map.merge(value1, value2, fn _key, value1, value2 ->
        value1 + value2
      end)
    end)
  end

  def report_acc() do
    %{
      all_hours: %{},
      hours_per_month: %{},
      hours_per_year: %{}
    }
  end

  def generate_initial_report([name, hours, _day, month, year]) do
    hours = String.to_integer(hours)

    %{
      all_hours: %{
        name => hours
      },
      hours_per_month: %{
        name => %{
          @months[month] => hours
        }
      },
      hours_per_year: %{
        name => %{
          year => hours
        }
      }
    }
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
  end
end
