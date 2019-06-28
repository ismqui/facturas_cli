defmodule FacturasCli.Interact do

  @fichero  "facturas.csv"
  @dir  "/Users/ismqui/dev/elixir"

  def start() do
    IO.puts("Welcome to CLI of facturas")
    fichero_fact = System.get_env("FACTURAS_FILE") || @fichero
    dir_fact = System.get_env("FACTURAS_DIR") || @dir
    IO.puts("#{dir_fact} #{fichero_fact}")
    Facturas.FacturasFile.load("#{dir_fact}/#{fichero_fact}")
    |> IO.inspect()

    case confirm("Continuar?[Y/n]") do
      true ->
        IO.ANSI.clear()
        start()
      false ->
        IO.puts "Finalizando..."
    end

  end

  def confirm(question) do
    IO.ANSI.clear_line()
    answer = question |> IO.gets() |> String.trim() |> String.downcase()

    case answer do
      "y" -> true
      "n" -> false
      _ -> confirm(question)
    end
  end


end
