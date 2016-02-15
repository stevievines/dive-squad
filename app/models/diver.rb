class Diver < ActiveRecord::Base
  belongs_to :team
  has_many :coaches, through: :team
  has_many :lists, dependent: :destroy
  has_many :dives, through: :lists
  has_many :diver_practices
  has_many :practices, through: :diver_practices

  scope :active, -> { where(deactivated_at: nil) }
  scope :inactive, -> { where.not(deactivated_at: nil) }

  def deactivated?
    deactivated_at.present?
  end
end
