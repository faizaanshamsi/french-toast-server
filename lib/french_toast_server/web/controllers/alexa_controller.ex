defmodule FrenchToastServer.Web.AlexaController do
  use FrenchToastServer.Web, :controller
  use PhoenixAlexa.Controller, :post

  alias FrenchToastServer.Data

  def launch_request(conn, _request) do
    response = %Response{}
        |> set_output_speech(%TextOutputSpeech{text: "Welcome to Hello Toast."})

    conn
      |> set_response(response)
  end

  def session_end_request(conn, _request) do
    conn
  end

  def intent_request(conn, "GetHelloToastIntent", _request) do
    current_status_level = Data.get_current_status.data_level.name
    text = "According to UniversalHub, the current French Toast Alert Level is #{current_status_level}."
        response = %Response{}
                    |> set_output_speech(%TextOutputSpeech{text: text})
                    |> set_should_end_session(true)

    conn |> set_response(response)
  end
end
