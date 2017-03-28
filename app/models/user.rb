class User < ApplicationRecord
  validates :usuario, presence: true
  validates :nombre, presence: true
  attr_readonly :id
end
