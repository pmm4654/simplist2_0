require 'rails_helper'

describe RegisteredSite do
  it { should belong_to(:user) }
  it { should have_many(:lists) }
  it { should validate_presence_of(:site_url) }
  it { should validate_uniqueness_of(:site_url) }
end
