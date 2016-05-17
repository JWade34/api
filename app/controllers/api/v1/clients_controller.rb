class Api::V1::ClientsController < Api::V1::BaseController

  def index
    clients = Client.page().per(50)
    render json: clients
  end

  def show
    if @user.nil?
      response = { error: 'User is not logged in' }
      status = :unauthorized
    else
      response = Client.find(params[:id])
      status = :ok
    end

    client = Client.find(params[:id])
    render(json: Api::V1::ClientSerializer.new(client).to_json)
  end

end
