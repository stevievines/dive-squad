class List < ActiveRecord::Base
  belongs_to :diver
  has_many :list_dives, dependent: :destroy
  has_many :dives, through: :list_dives

  accepts_nested_attributes_for :list_dives,
    allow_destroy: true,
    reject_if: :all_blank
end
