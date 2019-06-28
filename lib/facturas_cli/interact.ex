defmodule FacturasCli.Interact do

  @fichero  "facturas.csv"
  @dir  "/Users/ismqui/dev/elixir"

  @commands %{
    "quit" => "Finaliza programa facturas",
    "list" => "Lista facturas",
    "pagadas" => "Lista facturas pagadas",
    "nopagadas" => "Lista facturas NO pagadas",
    "year nnnn" => "Lista facturas del año nnnn"
  }



  def start() do
    IO.puts("Welcome to CLI of facturas")
    fichero_fact = System.get_env("FACTURAS_FILE") || @fichero
    dir_fact = System.get_env("FACTURAS_DIR") || @dir
    IO.puts("#{dir_fact} #{fichero_fact}")
    Facturas.FacturasFile.load("#{dir_fact}/#{fichero_fact}")
    |> receive_command()

    # case confirm("Continuar?[Y/n]") do
    #   true ->
    #     IO.ANSI.clear()
    #     start()
    #   false ->
    #     IO.puts "Finalizando..."
    # end

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

  defp receive_command(facturas \\ nil) do
    IO.gets("\n>")
    |> String.trim
    |> String.downcase
    |> String.split(" ")
    |> IO.inspect
    |> execute_command(facturas)
  end

  defp execute_command(["quit"], _facturas) do
    IO.puts("\nFinalizando facturación.")
  end

  defp execute_command(_unknown, facturas) do
    IO.puts("\nComando invalido.")
    print_help_message()

    receive_command(facturas)
  end

  defp print_help_message do
    IO.puts("\nEl programa acepta los siguientes comandos:\n")
    @commands
    |> Enum.with_index(1)
    |> Enum.map(fn({{c, d}, i}) ->
       command     = String.pad_trailing(c, 10, " ")
       descripcion = String.pad_trailing(d, 26, " ")
       IO.puts("\t[#{i}] #{command} -----> [#{descripcion}]") end)
  end

end
