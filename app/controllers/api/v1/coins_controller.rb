module Api::V1
  class CoinsController < Api::BaseController

    def all_coins
      coins = CoinService.new.all_coins(params[:account_id])
      render json: { success: true, coins: coins }, status: :ok
    rescue ApiExceptions::ACCOUNT_NOT_FOUND
      render json: { success: false, error: 'Account not found' }, status: :not_found
    end
  end
end
