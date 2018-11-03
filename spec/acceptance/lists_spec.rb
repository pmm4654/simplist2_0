require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'acceptance_helper'

resource "lists" do
  
  header "Accept", "application/json"
  header "Content-Type", "application/json"
  # header "Authorization", token_generator(user.id)

  let(:user) { create(:user) }
  let(:list) { List.create(:title => "Old title", user: user) }

  before do
    header "Accept", "application/json"
    header "Content-Type", "application/json"
    # header "Authorization", token_generator(user.id)
  end

  get "api/v1/lists" do

    before do
      2.times do |i|
        List.create(:title => "list #{i}")
      end
    end

    example "Getting a list of lists" do
      header "Accept", "application/json"
      header "Content-Type", "application/json"
      # header "Authorization", token_generator(user.id)
      do_request

      expect(response_body).to eq(JSON.parse(List.all.to_json).each{|a| a.delete('user_id')}.to_json)
      expect(status).to eq(200)
    end
  end

  get "api/v1/lists/:id" do
    parameter :id, "ID of the list"

    let(:id) { list.id }

    example "Getting a specific list" do
      # header "Accept", "application/json"
      # header "Content-Type", "application/json"

      do_request
      expect(response_body).to eq(JSON.parse(list.to_json).except('user_id').to_json)
      expect(status).to eq(200)
    end
  end

end
