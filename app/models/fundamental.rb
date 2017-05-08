class Fundamental < ActiveRecord::Base
  has_many :skills, dependent: :destroy

  validates :name, presence: true
end
