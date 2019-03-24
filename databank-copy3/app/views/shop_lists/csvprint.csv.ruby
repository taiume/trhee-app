require 'csv'


CSV.generate do |csv|

  csv_column_names = Performance.column_names
  list = ['id','shop_list_id','created_at','updated_at']
  csv_column_names.delete_if do |str|
  list.include?(str)
  end

  csv << csv_column_names

  @pf.each do |pf|
    csv_column_values = pf.attributes.values
    csv_column_values.delete_at(0)
    csv_column_values.delete_at(1)
    csv_column_values.delete_at(3)
    csv_column_values.delete_at(3)

    csv << csv_column_values
  end
end
