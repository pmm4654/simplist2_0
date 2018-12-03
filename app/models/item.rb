class Item < ApplicationRecord
  belongs_to :list
  validates_presence_of :title

  acts_as_list scope: :list, add_new_at: :top

  scope :ordered, -> { order('position asc') }
end

