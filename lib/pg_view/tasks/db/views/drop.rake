require 'pg_view'

namespace :db do
  namespace :views do
    desc "Drop Database Views"
    task drop: :environment do
      PgView.drop_list
    end
  end
end
