require 'rails_helper'

describe Item do
  it { should belong_to(:list) }
  it { should validate_presence_of(:title) }
end
