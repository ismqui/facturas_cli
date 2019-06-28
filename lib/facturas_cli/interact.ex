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
  end
end
