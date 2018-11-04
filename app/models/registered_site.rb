class RegisteredSite < ApplicationRecord
  belongs_to :user

  has_many :lists
  
  validates_presence_of :site_url
  validates_uniqueness_of :site_url
end

