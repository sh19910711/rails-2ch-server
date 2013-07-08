namespace :db do
  namespace :fixtures do
    desc 'generate fixtures from database'
    task :dump => :environment do
      sql = 'SELECT * FROM %s'
      skip_tables = ['schema_migrations']
      ActiveRecord::Base.establish_connection(:development)
      (ActiveRecord::Base.connection.tables - skip_tables).each do |table_name|
        i = "000"
        File.open(Rails.root.to_s + "/test/fixtures/#{table_name}.yml", 'w') do |file|
          data = ActiveRecord::Base.connection.select_all(sql % table_name)
          file.write data.inject({}) {|hash, record|
            hash["#{table_name}_#{i.succ!}"] = record
            hash
          }.to_yaml
        end
      end
    end
  end
end
