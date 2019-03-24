class PerformancesController < ApplicationController

  before_action :check_day, only:[:create]


    def new
      @shop_list = ShopList.find(params[:shop_list_id])
      # @performance = Performance.find_by(day:'2017-01-01',shop_list_id:'1')
      @performance = Performance.new
     end

    def create
#@pf
      @pf = Performance.create(create_params)
      @shop_list = ShopList.find(params[:shop_list_id])

      if @pf.save

      @mail = Notice.sendmail_confirm(@shop_list).deliver_now
      redirect_to controller: :shop_lists, action: :finish
    else
     # redirect_to controller: :shop_lists, action: :index
     render :_form
    end

    end

    def check_day
      if @pf = Performance.find_by(check)
        # binding.pry
         @pf.update_attributes(create_params2)
         if @pf.save
         @shop_list = ShopList.find(params[:shop_list_id])
         @mail = Notice.sendmail_confirm(@shop_list).deliver_now
         redirect_to controller: :shop_lists, action: :finish
       else
        render :_form
        # redirect_to controller: :shop_lists, action: :index
       end
    end
    end

    private
    def check
      params.require(:performance).permit(:day).merge(shop_list_id: params[:shop_list_id])
    end

  private
  def create_params
    params.require(:performance).permit(:day, :wimax, :uqm, :ym_wifi, :sb_net, :sb_wifi, :au_net, :au_wifi, :do_net, :sb_phone, :au_phone, :do_phone, :ym_phone).merge(shop_list_id: params[:shop_list_id])
  end

  private
  def create_params2
    params.require(:performance).permit(:wimax, :uqm, :ym_wifi, :sb_net, :sb_wifi, :au_net, :au_wifi, :do_net, :sb_phone, :au_phone, :do_phone, :ym_phone)
  end


end
