#unless Rails.env.production?
#  connection = ActiveRecord::Base.connection
#  connection.tables.each do |table|
#    connection.execute("TRUNCATE #{table} CASCADE" ) unless table == "schema_migrations"
#  end

#  sql = File.read('db/seeds.sql')
#  statements = sql#.split(/;$/)
#  #statements.pop

#  ActiveRecord::Base.transaction do
#    connection.execute(statements)
    #statements.each do |statement|
    #  connection.execute(statement)
    #end
#  end
#end
