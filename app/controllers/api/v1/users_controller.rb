module Api::V1
  class UsersController < Api::BaseController

=begin
    before_action only: [:index] do
      ApiParamsValidator.validate_users_index_params?(params)
    end
=end

    def index
      user = UserService.new.user_accounts(params)
      render json: { success: true, user: user }, status: :created
    rescue ApiExceptions::ACCOUNT_NOT_FOUND
      render json: { success: false, error: 'Account not found' }, status: :not_found
    end

    def create
      user = UserService.new.create_account(params)
      render json: { success: true, user: user }, status: :created
    rescue ActiveRecord::RecordInvalid => exception
      raise ApiExceptions::ParamsInvalid.new(exception.message)
    end

    def all_users
      users = UserService.new.all_users
      render json: { success: true, users: users }, status: :ok
    end

  end
end
