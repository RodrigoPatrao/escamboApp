class Site::HomepageController < ApplicationController
  layout 'site'
  def index
    @categories = Category.order(:description)
  end
end
