class InfoController < ApplicationController
  def index
    @services = Service.all
  end
end
