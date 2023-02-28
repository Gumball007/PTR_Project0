# defmodule Project0.Week5.Task2 do

#     HTTPoison.start()
  
#     def get_quotes() do
#       response = HTTPoison.get!("https://quotes.toscrape.com")

#       html = response.body
#       doc = Floki.parse_document!(html)
#       quotes = doc
#       |> Floki.find(".quote")
#       |> Enum.map(fn quote ->
#         author = quote 
#         |> Floki.find(".author") 
#         |> hd() 
#         |> Floki.text()

#         text = quote 
#         |> Floki.find(".text") 
#         |> hd() 
#         |> Floki.text()

#         tags = quote 
#         |> Floki.find(".tags .tag") 
#         |> Enum.map(Floki.text())
  
#         %{author: author, text: text, tags: tags}
#       end)
#       quotes

#     end

#     def run() do
#         quotes = get_quotes()
#         IO.inspect quotes
#     end
# end
  