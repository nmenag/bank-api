defmodule BankAPI.Accounts.Projectors.AccountOpened do
  use Commanded.Projections.Ecto,
    application: BankAPI.EventApp,
    repo: BankAPI.Repo,
    name: "Accounts.Projectors.AccountOpened"

  alias BankAPI.Accounts.Events.AccountOpened
  alias BankAPI.Schema.Account

  project(%AccountOpened{} = evt, _metadata, fn multi ->
    account = %Account{
      uuid: evt.account_uuid,
      current_balance: evt.initial_balance
    }

    Ecto.Multi.insert(multi, :account_opened, account)
  end)
end