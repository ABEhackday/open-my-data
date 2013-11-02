require 'digest/md5'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def avatar(size)
    hash = Digest::MD5.hexdigest(self.email.downcase)
    "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
  end
end
