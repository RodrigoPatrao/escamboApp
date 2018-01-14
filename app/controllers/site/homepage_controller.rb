class Site::HomepageController < ApplicationController
  layout 'site'
  def index
    @categories = Category.order(:description)
    @ads = Ad.all.limit(10)
  end
end
