defmodule FrenchToastServer.Web.AlexaController do
  use FrenchToastServer.Web, :controller
  use PhoenixAlexa.Controller, :post

  def launch_request(conn, request) do
    response = %Response{}
        |> set_output_speech(%TextOutputSpeech{text: "Welcome to the Horoscope."})

    conn
      |> set_response(response)
  end

  def session_end_request(conn, request) do
    conn
  end

  def intent_request(conn, "GetHelloToastIntent", request) do
    text = "According to UniversalHub, the current French Toast Alert Level is severe."
        response = %Response{}
                    |> set_output_speech(%TextOutputSpeech{text: text})
                    |> set_should_end_session(true)

    conn |> set_response(response)
  end
end
