class CardsController < ApplicationController
  require "payjp"

  def new
    # cards = Card.where(user_id: current_user.id)
    # redirect_to action: "show" if card.exists?
  end

  def create
    # credentials.yml.encに記載したAPI秘密鍵を呼び出す。
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if params["payjp_token"].blank?
      redirect_to action: "new", alert: "クレジットカードを登録できませんでした。"
    else

      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadata: {user_id: current_user.id} 
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)

      if @card.save
        #もしcreateビューを作成しない場合はredirect_toなどで表示ビューを指定
      else
        redirect_to action: "create"
      end
    end
  end
end
