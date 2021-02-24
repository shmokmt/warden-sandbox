class User < ApplicationRecord
  after_create :generate_authentication_token!

  private

  # user生成後に一意となるauthentication_tokenを作成する
  def generate_authentication_token!
    self.authentication_token = Digest::SHA1.hexdigest("#{Time.now}-#{self.id}-#{self.updated_at}")
    self.save
  end
end
