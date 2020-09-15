class ApplicationController < ActionController::Base
  #protect_from_forgery with: :null_session

  before_action :basic_auth
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date])
  end

  private

  #def items_params
    #params.require(:items).permit(:user_id, :category_id, :condition_id, :shipping_id, :prefecture_id, :delivery_day_id, :name, :price, :decribe:image).merge(user_id: current_user.id)
  #end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end
end
