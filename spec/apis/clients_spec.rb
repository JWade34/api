require 'rails_helper'
describe Api::V1::ClientsController, type: :request do

  context :index do
    before(:each) do
      @client = FactoryGirl.create(:client)
      get api_v1_clients_path, format: :json
    end

    it 'returns the correct status' do
      expect(response.status).to eql(200)
    end

    it 'returns the data in the body' do
      body = HashWithIndifferentAccess.new(MultiJson.load(response.body))

      expect(body[:clients].last[:id]).to eql(@client.id)
      expect(body[:clients].last[:address]).to eql(@client.address)
    end
  end

  context :show do
    before do
      @client = FactoryGirl.create(:client)
      get api_v1_client_path(@client.id), format: :json
    end

    it 'returns the correct status' do
      expect(response.status).to eql(200)
    end

    it 'returns the data in the body' do
      body = HashWithIndifferentAccess.new(MultiJson.load(response.body))
      expect(body[:client][:name]).to eql(@client.name)
      expect(body[:client][:address]).to eql(@client.address)
    end
  end
end
