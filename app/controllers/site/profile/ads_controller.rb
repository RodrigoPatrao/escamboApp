class Site::Profile::AdsController < Site::ProfileController
  before_action :set_ad, only: [:edit, :update, :destroy]
  before_action :get_ad, only: [:new, :create]
  def index
    @ads = current_member.ads.order(created_at: :desc)
  end
  def new
    #code
  end
  def create
    @ad.update_attributes(params_ad)
    @ad.member = current_member
    if @ad.save
      redirect_to site_profile_ads_path
      flash[:success] = "Anúncio criado com sucesso!"
    else
      render :new
    end
  end
  def edit

  end
  def update
    if @ad.update(params_ad)
      redirect_to site_profile_ads_path
      flash[:success] = "Anúncio atualizado com sucesso!"
    else
      render :edit
    end
  end
  def destroy
    if @ad.destroy
      redirect_to site_profile_ads_path
      flash[:success] = "Anúncio excluído com sucesso!"
    else
      render :index
      flash[:danger] = "Erro ao excluir o anúncio: #{@ad.errors.messages.flatten.join(' ')}"
    end
  end
  private
  def get_ad
    @ad = Ad.new
  end
  def set_ad
    @ad = Ad.find(params[:id])
  end
  def params_ad
    params.require(:ad).permit(:title, :description, :category_id, :price, :picture)
  end
end
