defmodule Project0.Week5.Task1 do
    HTTPoison.start()
    response = HTTPoison.get!("https://quotes.toscrape.com")
    IO.inspect response
end
