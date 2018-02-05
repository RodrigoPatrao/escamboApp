class Site::Profile::AdsController < Site::ProfileController
  def index
    @ads = current_member.ads
  end
end
