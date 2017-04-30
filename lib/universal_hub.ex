defmodule UniversalHub do
  use HTTPotion.Base
  import SweetXml

  @url "http://www.universalhub.com/toast.xml"

  def get_level_name do
    response = HTTPotion.get(@url)
    response.body
    |> xpath(~x"//frenchtoast/status/text()")
    |> to_string
  end
end
