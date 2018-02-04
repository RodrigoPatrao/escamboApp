class Site::HomepageController < SiteController
  def index
    @categories = Category.order_by_description
    @ads = Ad.all.limit(9)
  end
end
