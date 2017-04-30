defmodule FrenchToastServer.FetchLevel do
  use GenServer

  alias FrenchToastServer.{Data}

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work()
    {:ok, state}
  end

  def handle_info(:work, state) do
    record_status()
    schedule_work()
    {:noreply, state}
  end

  defp schedule_work() do
    four_hours_in_milliseconds  = 4 * 60 * 60 * 1000
    Process.send_after(self(), :work, four_hours_in_milliseconds)
  end

  defp record_status do
    level =
      UniversalHub.get_level_name
      |> Data.get_level_by_name()

    Data.create_status(%{data_level_id: level.id})
  end
end
