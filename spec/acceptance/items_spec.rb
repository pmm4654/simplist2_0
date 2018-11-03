require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Items" do
  let(:user) { create(:user) }
  let(:list) { create(:list) }
  let!(:items) { create_list(:item, 10, list: list) }  
  let(:item) { items.first }

  before do
    header "Accept", "application/json"
    header "Content-Type", "application/json"
    # header "Authorization", token_generator(user.id)
  end

  get "api/v1/lists/:list_id/items" do
    parameter :list_id, "ID of the list that holds the items"
    let(:list_id) { list.id }

    example "Listing items" do
      do_request
      expect(status).to eq(200)
    end
  end

  get "api/v1/lists/:list_id/items/:id" do
    parameter :list_id, "ID of the list that holds the items"
    parameter :id, "ID of the item in the list"

    let(:list_id) { list.id }
    let(:id) { item.id }

    example "Getting a specific item" do
      do_request
      expect(response_body).to eq(item.to_json)
      expect(status).to eq(200)
    end
  end

  get "api/v1/lists/:list_id/items/:id" do
    parameter :list_id, "ID of the list that holds the items"
    parameter :id, "ID of the item in the list"
    
    let(:list_id) { list.id }
    let(:id) { 127839 }

    example "Getting a specific item that doesn't exist" do
      do_request
      expect(status).to eq(404)
      expect(response_body).to match(/Couldn't find Item/)      
    end
  end 

  post "lists/:list_id/items" do
    parameter :list_id, "ID of the list that holds the items" # TODO: scope to item
    parameter :title, "Title of item", :required => true

    response_field :title, "Title of item", "Type" => "String"

    let!(:title) { "item 1" }
    let!(:list_id) { list.id }


    let(:raw_post) { params.to_json }

    example "Creating an item" do
      do_request(item: {title: title, list_id: list_id})
      expect(json_parsed_response['title']).to eq('item 1')
      expect(status).to eq(201)
    end
  end

  put "lists/:list_id/items/:id" do
    parameter :title, "Title of item"

    let(:id) { item.id }
    let(:title) { "Updated Title" }

    let(:raw_post) { params.to_json }

    example "Updating an item" do
      do_request

      expect(status).to eq(204)
      expect(item.reload.title).to eq("Updated Title")
    end
  end 


end

  # describe 'POST lists/:list_id/items' do
  #    let(:valid_attributes) do
  #     # send json payload
  #     { title: 'White Sneakers', user_id: user.id.to_s }.to_json
  #   end

  #   context 'when request is valid' do
  #     before { post 'lists/:list_id/items', params: valid_attributes, headers: headers }

  #     it 'creates a item' do
  #       expect(json['title']).to eq('White Sneakers')
  #     end

  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end

  #   context 'when the request is invalid' do
  #     let(:invalid_attributes) { { title: nil }.to_json }
  #     before { post '/items', params: invalid_attributes, headers: headers }

  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end

  #     it 'returns a validation failure message' do
  #       expect(json['message'])
  #         .to match(/Validation failed: Title can't be blank/)
  #     end
  #   end
  # end

  # describe 'PUT /items/:id' do
  #   let(:valid_attributes) { { title: 'White T' }.to_json }

  #   context 'when the record exists' do
  #     before { put "/items/#{item_id}", params: valid_attributes, headers: headers }

  #     it 'updates the record' do
  #       expect(response.body).to be_empty
  #     end

  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end
  #   end

  #   let(:valid_attributes_with_category) { { title: 'White T', category_id: category.id }.to_json }
  #   context 'when the record exists' do
  #     before { put "/items/#{item_id}", params: valid_attributes_with_category, headers: headers }

  #     it 'updates the record' do
  #       expect(Item.find(item_id).category).to be_present
  #       expect(response.body).to be_empty
  #     end

  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end
  #   end    
  # end

  # describe 'DELETE /items/:id' do
  #   before { delete "/items/#{item_id}", params: {}, headers: headers }

  #   it 'returns status code 204' do
  #     expect(response).to have_http_status(204)
  #   end
  # end