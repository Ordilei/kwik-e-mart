class User < ActiveRecord::Base
  EMAIL_FORMAT = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  attr_accessible :name, :email, :password, :password_confirmation

  validates_presence_of :name, :email, :password
  validates_format_of :email, :with => EMAIL_FORMAT
  validates_confirmation_of :password
  validates_uniqueness_of :email
end
