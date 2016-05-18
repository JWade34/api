class ClientsController < ApplicationController
  before_filter :authorize

  layout "main"

  def index
    @clients = Client.all.page(params[:page]).per(50)
  end

  def import
    if Client.import(params[:file])
      redirect_to root_path, :flash => { :alert => "Data uploaded" }
    end
  end

end
