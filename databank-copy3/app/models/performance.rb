class Performance < ActiveRecord::Base
belongs_to :shop_list

validates :day, presence: true
validates :wimax, presence: true,numericality: { only_integer: true,greater_than_or_equal_to: 0}
validates :uqm, presence: true,numericality: { only_integer: true,greater_than_or_equal_to: 0}

validates :ym_wifi, presence: true,numericality: { only_integer: true,greater_than_or_equal_to: 0}
validates :sb_net, presence: true,numericality: { only_integer: true,greater_than_or_equal_to: 0}
validates :sb_wifi, presence: true,numericality: { only_integer: true,greater_than_or_equal_to: 0}
validates :au_net, presence: true,numericality: { only_integer: true,greater_than_or_equal_to: 0}
validates :au_wifi, presence: true,numericality: { only_integer: true,greater_than_or_equal_to: 0}
validates :do_net, presence: true,numericality: { only_integer: true,greater_than_or_equal_to: 0}
validates :sb_phone, presence: true,numericality: { only_integer: true,greater_than_or_equal_to: 0}
validates :au_phone, presence: true,numericality: { only_integer: true,greater_than_or_equal_to: 0}
validates :do_phone, presence: true,numericality: { only_integer: true,greater_than_or_equal_to: 0}
validates :ym_phone, presence: true,numericality: { only_integer: true,greater_than_or_equal_to: 0}

end
