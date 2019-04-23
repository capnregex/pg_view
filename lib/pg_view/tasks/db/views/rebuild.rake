require 'pg_view'

namespace :db do
  namespace :views do
    desc "Rebuild Database Views"
    task rebuild: :environment do
      PgView.drop_list
      PgView.create_list
    end
  end
end
