class ListDive < ActiveRecord::Base
  belongs_to :dive
  belongs_to :list
end
