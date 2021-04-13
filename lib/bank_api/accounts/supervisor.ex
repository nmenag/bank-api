defmodule BankAPI.Accounts.Supervisor do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      Supervisor.child_spec({BankAPI.Accounts.Projectors.AccountOpened, []}, id: :account_opened),
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end