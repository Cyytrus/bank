defmodule Account do
  defstruct user: User, balance: 1000

  def sign_up(user), do: %__MODULE__{user: user}

  def transfer(accounts, from, to, value) do
    from = Enum.find(accounts, fn account -> account.user.email == from.user.email end)

    cond do
      balance_check(from.balance, value) ->
        {:error, "Insufficient balance"}

      true ->
        to = Enum.find(accounts, fn account -> account.user.email == to.user.email end)
        from = %Account{from | balance: from.balance - value}
        to = %Account{to | balance: to.balance + value}
      [from, to]
    end
  end

  def withdraw(account, value) do
    cond do
      balance_check(account.balance, value) ->
        {:error, "Insufficient balance"}

        true ->
          account = %Account{account | balance: account.balance - value}
          {:ok, account, "Successfuly withdrawn $ #{value}"}
    end
  end

  defp balance_check(balance, value), do: balance < value
end
