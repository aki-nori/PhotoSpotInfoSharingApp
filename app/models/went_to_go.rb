class WentToGo < ApplicationRecord
  belongs_to :place
  belongs_to :user
end