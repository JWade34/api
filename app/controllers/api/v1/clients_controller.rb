class Api::V1::ClientsController < Api::V1::BaseController
  before_filter :authorize

  # after_filter only: [:index] { set_pagination_header(:clients) }

  def index
    clients = Client.page params[:page]
    render json: clients
  end

  def show
    client = Client.find(params[:id])
    render(json: Api::V1::ClientSerializer.new(client).to_json)
  end

end
