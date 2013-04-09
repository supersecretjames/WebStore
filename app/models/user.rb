class User < ActiveRecord::Base
  attr_accessible :email, :password

  validates :email, :password, :presence => true
  validates :email, :uniqueness => true

  before_save :create_remember_token

  def checkout
    @product_ids = cookies[:cart].split
    @user = User.find(params[:id])
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
