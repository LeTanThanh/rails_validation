class User < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ },
    presence: true
  validates :gender, inclusion: { in: %w(male female) }
  validates :terms_of_service, acceptance: true
  validates_associated :books
  validates :password, presence: true,
    confirmation: true
  validates :password_confirmation, presence: true, on: :create
  validates :subdomain, exclusion: { in: %w(www us ca jp) }
end
