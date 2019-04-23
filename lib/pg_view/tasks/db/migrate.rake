namespace :db do
  task :migrate do
    Rake::Task['db:views:drop'].invoke
    Rake::Task['db:views:create'].invoke
  end
end
