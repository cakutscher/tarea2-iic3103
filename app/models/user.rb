class User < ApplicationRecord
  validates :usuario, presence: true, :allow_nil => false
  validates :nombre, presence: true, :allow_nil => false
  attr_readonly :id
end
