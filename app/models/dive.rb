class Dive < ActiveRecord::Base
  has_many :list_dives
  has_many :lists, through: :list_dives

  def display_description
    "#{number} #{height}M -- #{description}"
  end
end
