class Backoffice::DashboardController < ApplicationController
  before_action :authenticate_admin!

  layout 'backoffice'
  def index
    #code
  end
end
