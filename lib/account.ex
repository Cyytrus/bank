defmodule Account do
  defstruct user: User, balance: nil

  def sign_up(user), do: %__MODULE__{user: user, balance: 1000}
end
