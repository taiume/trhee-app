class Notice < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice.sendmail_confirm.subject
  #
  default from: 'databank.test2017@gmail.com'

  def sendmail_confirm(shop_list)

    @pf = Performance.order(:updated_at).last
    @shop_list = shop_list
    mail to: "ttumetsu@saintmedia.co.jp",
        subject:"実績登録完了"

  end


    def sendmail_setting(ranking_net_keys,ranking_net_values,ranking_phone_keys,ranking_phone_values)

      @ranking_net_keys = ranking_net_keys
      @ranking_net_values = ranking_net_values
      @ranking_phone_keys = ranking_phone_keys
      @ranking_phone_values = ranking_phone_values
      mail to: "ttumetsu@saintmedia.co.jp",
           cc: "tc-umetsu_stm@ezweb.ne.jp",
        subject:"ランキング配信"

  end
end




    # @ranking_net_keys = Performance.where(day: @time).order(wimax: :desc).group(:shop_list_id).sum(:wimax).keys
    # @ranking_net_values = Performance.where(day: @time).order(wimax: :desc).group(:shop_list_id).sum(:wimax).values

    # @ranking_phone_keys = Performance.where(day: @time).order(uqm: :desc).group(:shop_list_id).sum(:uqm).keys
    # @ranking_phone_values = Performance.where(day: @time).order(uqm: :desc).group(:shop_list_id).sum(:uqm).values
