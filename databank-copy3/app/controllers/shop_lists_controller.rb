class ShopListsController < ApplicationController
    # before_action :check_btn, only:[:csvprint]

    def index
      @shop_lists = ShopList.all
    end

    def show
      @shop_list = ShopList.find(params[:id])

      # binding.pry
      @performances = Performance.where(day: Time.now.all_month,shop_list_id: params[:id]).select(:wimax).sum(:wimax)
      # @performances = Performance.where(day: Time.now.all_month).select(:wimax).sum(:wimax)
      @performances2 = Performance.where(day: Time.now.all_month,shop_list_id: params[:id]).select(:uqm).sum(:uqm)
      # @performances2 = Performance.where(day: Time.now.all_month).select(:uqm).sum(:uqm)
      @ym_wifi = Performance.where(day: Time.now.all_month,shop_list_id: params[:id]).select(:ym_wifi).sum(:ym_wifi)
      @sb_net = Performance.where(day: Time.now.all_month,shop_list_id: params[:id]).select(:sb_net).sum(:sb_net)
      @sb_wifi = Performance.where(day: Time.now.all_month,shop_list_id: params[:id]).select(:sb_wifi).sum(:sb_wifi)
      @au_net = Performance.where(day: Time.now.all_month,shop_list_id: params[:id]).select(:au_net).sum(:au_net)
      @au_wifi = Performance.where(day: Time.now.all_month,shop_list_id: params[:id]).select(:au_wifi).sum(:au_wifi)
      @do_net = Performance.where(day: Time.now.all_month,shop_list_id: params[:id]).select(:do_net).sum(:do_net)

      @sb_phone = Performance.where(day: Time.now.all_month,shop_list_id: params[:id]).select(:sb_phone).sum(:sb_phone)
      @au_phone = Performance.where(day: Time.now.all_month,shop_list_id: params[:id]).select(:au_phone).sum(:au_phone)
      @do_phone = Performance.where(day: Time.now.all_month,shop_list_id: params[:id]).select(:do_phone).sum(:do_phone)
      @ym_phone = Performance.where(day: Time.now.all_month,shop_list_id: params[:id]).select(:do_phone).sum(:do_phone)

      #実績合計の数字のみ帰ってくる。
      # @performances = Performance.where(day: Time.now.all_month).select(:wimax)
      # @performances = Performance.where(day: Time.now.all_month).pluck(:wimax,:uqm)
      @net_share =[["wimax",@performances],["YMデータ",@ym_wifi],["SB光",@sb_net],["SB-Air",@sb_wifi],["au光",@au_net],["auデータ",@au_wifi],["docomo光",@do_net]]
      @sp_share =[["uqmobile",@performances2],["SBスマホ",@sb_phone],["auスマホ",@au_phone],["docomoスマホ",@do_phone],["ymスマホ",@ym_phone]]
    end


  def new
    @pf_csv = Performance.all
  end

  def view
    @id=params[:id]
    @shop_list = ShopList.find(params[:id])
    @time = Time.now.all_month
    @pf = Performance.where(shop_list_id: @id,day: @time)
  end

  def finish
  end

  def setting

    @time = Time.now.all_month

    @ranking_net_keys = Performance.where(day: @time).order(wimax: :desc).group(:shop_list_id).sum(:wimax).keys
    @ranking_net_values = Performance.where(day: @time).order(wimax: :desc).group(:shop_list_id).sum(:wimax).values

    @ranking_phone_keys = Performance.where(day: @time).order(uqm: :desc).group(:shop_list_id).sum(:uqm).keys
    @ranking_phone_values = Performance.where(day: @time).order(uqm: :desc).group(:shop_list_id).sum(:uqm).values

    @mail = Notice.sendmail_setting(@ranking_net_keys,@ranking_net_values,@ranking_phone_keys,@ranking_phone_values).deliver_now

  end

  def csvprint
    @id=params[:id]
    @time = Time.now.all_month
    @pf = Performance.where(shop_list_id: @id,day: @time)

  @shop_name = ShopList.find(@id).name
  respond_to do |format|
  format.csv do
  send_data render_to_string, filename: "#{@shop_name}#{Time.now.strftime("%Y%m%d")}.csv", type: :csv
  end
  end


end

def csvprint1
  @id=params[:id]

  @time1= 1.months.ago(Time.now).all_month
  @pf = Performance.where(shop_list_id: @id,day: @time1)
  @time= 1.months.ago(Time.now)
  @shop_name = ShopList.find(@id).name
  respond_to do |format|
  format.csv do
  send_data render_to_string, filename: "#{@shop_name}#{@time.strftime("%Y%m")}.csv", type: :csv
  end
  end
end

def csvprint2
    @id=params[:id]

    @time2= 2.months.ago(Time.now).all_month
    @pf = Performance.where(shop_list_id: @id,day: @time2)

    @time= 2.months.ago(Time.now)
    @shop_name = ShopList.find(@id).name
    respond_to do |format|
    format.csv do
    send_data render_to_string, filename: "#{@shop_name}#{@time.strftime("%Y%m")}.csv", type: :csv
end
end
end

end


