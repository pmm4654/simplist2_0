require 'rails_helper'

describe List do
  it { should belong_to(:user) }
  it { should belong_to(:registered_site) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title).scoped_to(:user_id) }
end
