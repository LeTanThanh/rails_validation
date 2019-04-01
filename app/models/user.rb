class User < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true
  validates :terms_of_service, acceptance: true
  validates_associated :books
end
