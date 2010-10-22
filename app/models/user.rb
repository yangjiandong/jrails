class User < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  attr_accessor :password_corfirmation
  validates_confirmation_of :password

  validate :password_non_blank

end
