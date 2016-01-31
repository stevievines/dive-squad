class Practice < ActiveRecord::Base
  belongs_to :team
  has_many :diver_practices, dependent: :destroy
end
