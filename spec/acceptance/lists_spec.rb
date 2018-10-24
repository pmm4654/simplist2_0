require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'acceptance_helper'

resource "lists" do
  
  # header "Accept", "application/json"
  # header "Content-Type", "application/json"
  # header "Authorization", token_generator(user.id)

  let(:list) { List.create(:title => "Old title", :paid => true) }
  let(:user) { create(:user) }

  get "/lists" do

    before do
      2.times do |i|
        List.create(:title => "list #{i}")
      end
    end

    example "Getting a list of lists" do
      header "Accept", "application/json"
      header "Content-Type", "application/json"
      header "Authorization", token_generator(user.id)
      do_request 

      expect(response_body).to eq(List.all.to_json)
      expect(status).to eq(200)
    end
  end

  head "/lists" do
    example_request "Getting the headers" do
      expect(response_headers["Cache-Control"]).to eq("max-age=0, private, must-revalidate")
      do_request
    end
  end

  post "/lists" do
    parameter :title, "title of list", :required => true, :scope => :list

    response_field :title, "title of list", :scope => :list, "Type" => "String"

    let(:title) { "list 1" }

    let(:raw_post) { params.to_json }

    example "Creating an list" do
      explanation "First, create an list, then make a later request to get it back"

      list = JSON.parse(response_body)
      expect(list.except("id", "created_at", "updated_at")).to eq({
        "title" => title,
      })
      expect(status).to eq(201)

      client.get(URI.parse(response_headers["location"]).path, {}, headers)
      expect(status).to eq(200)
    end
  end

  get "/lists/:id" do
    let(:id) { list.id }

    example "Getting a specific list" do
      expect(response_body).to eq(list.to_json)
      expect(status).to eq(200)
    end
  end

  put "/lists/:id" do
    parameter :title, "title of list", :scope => :list

    let(:id) { list.id }
    let(:title) { "Updated title" }

    let(:raw_post) { params.to_json }

    example "Updating an list" do
      expect(status).to eq(204)
    end
  end

  delete "/lists/:id" do
    let(:id) { list.id }

    example "Deleting an list" do
      expect(status).to eq(204)
    end
  end
end
