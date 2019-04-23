require 'pg_view'

namespace :db do
  namespace :views do
    desc "Dump the view field list"
    task dump: :environment do
      PgView.dump_all
    end
  end
end
