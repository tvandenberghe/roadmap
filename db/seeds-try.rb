def execute_sql_file(path, connection = ActiveRecord::Base.connection)
  require 'active_support/core_ext/object/blank.rb'
  IO.read(path).split(';').reject(&:blank?).each do |statement|
    connection.execute(statement)
  end
end

execute_sql_file(File.expand_path(__FILE__, '/seeds.sql'))
