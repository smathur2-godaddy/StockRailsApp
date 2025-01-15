module Api::V1
  class AccountsController < Api::BaseController


=begin
    before_action only: [:index] do
      ApiParamsValidator.validate_accounts_index_params?(params)
    end
=end

    def index
      account = AccountService.new.account(params)
      render json: { success: true, account: account }, status: :created
    rescue ApiExceptions::ACCOUNT_NOT_FOUND
      render json: { success: false, error: 'Account not found' }, status: :not_found
    end

    def create
      account = AccountService.new.create(params)
      render json: { success: true, account: account }, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { success: false, error: e.message }, status: :unprocessable_entity
    end

    def all_accounts
      accounts = AccountService.new.all_accounts(params[:user_id])
      render json: { success: true, accounts: accounts }, status: :ok
    rescue ApiExceptions::USER_NOT_FOUND
      render json: { success: false, error: 'User not found' }, status: :not_found
    end

  end
end


