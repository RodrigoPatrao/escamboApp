class Site::Profile::AdsController < Site::ProfileController
  before_action :get_ad, only: [:edit]
  def index
    @ads = current_member.ads
  end
  def edit

  end
  def update
    #code
  end
  def destroy
    #code
  end
  private
  def get_ad
    @ad = Ad.find(params[:id])
  end
end
