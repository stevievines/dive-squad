class Skill < ActiveRecord::Base
  belongs_to :fundamental
  has_many :drills, dependent: :destroy

  validates :fundamental, :name, presence: true

  accepts_nested_attributes_for :drills,
     reject_if: proc { |attributes| attributes['name'].blank? }
end
