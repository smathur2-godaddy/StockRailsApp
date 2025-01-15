class AccountService

  def initialize()
  end

  def account(params)
    account = Account.find_by(id: params[:account_id])
    raise ApiExceptions::ACCOUNT_NOT_FOUND unless account.present?
    account
  end

  def create(params)
    Account.create!(currency: params[:currency], user_id: params[:user_id])
  end

  def all_accounts(user_id)
    user = User.find_by(id: user_id)
    raise ApiExceptions::USER_NOT_FOUND unless user.present?

    user.accounts
  end

end

