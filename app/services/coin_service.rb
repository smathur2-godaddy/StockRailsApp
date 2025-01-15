class CoinService

  def initialize
  end

  def all_coins(account_id)
    account = Account.find_by(id: account_id)
    raise ApiExceptions::ACCOUNT_NOT_FOUND unless account.present?

    account.coins
  end
end
