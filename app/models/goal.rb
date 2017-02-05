class Goal < ActiveRecord::Base
  belongs_to :dive

  delegate :display_description, :number, to: :dive

  # is this too strict?
  validates_uniqueness_of :dive

  scope :three_meter, -> { includes(:dive).where(dives: { height: 3 }) }
  scope :one_meter, -> { includes(:dive).where(dives: { height: 1 }) }
  scope :platform, -> { includes(:dive).where(dives: { height: [5, 7, 10] }) }
end
