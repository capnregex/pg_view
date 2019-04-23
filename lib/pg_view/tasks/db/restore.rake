namespace :db do
  task :restore do
    Rake::Task['db:views:drop'].invoke
    Rake::Task['db:views:create'].invoke
  end
end
