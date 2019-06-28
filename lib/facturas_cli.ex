defmodule FacturasCli do

  defdelegate start(), to: FacturasCli.Interact
  
end
