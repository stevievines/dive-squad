class Practice < ActiveRecord::Base
  belongs_to :team
  has_many :diver_practices, dependent: :destroy
  has_many :divers, through: :diver_practices
end
