require 'pg_view'

namespace :db do
  namespace :views do
    desc "Create Database Views"
    task create: :environment do
      PgView.create_list
    end
  end
end
