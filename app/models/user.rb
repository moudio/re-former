# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 10 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 100 }
  validates :password, presence: true, length: { minimum: 6 }
end
