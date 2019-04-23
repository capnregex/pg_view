module PG::View::ClassMethods
  def list_file
    'db/views/index.txt'
  end

  def read_list
    File.read(list_file).lines.map(&:strip)
  end

  def view_list
    @view_list ||= read_list
  end

  def create_list
    view_list.each do |view|
      create(view)
    end
  end

  def drop_list
    view_list.reverse_each do |view|
      drop(view)
    end
    drop_all
  end

  def create(name)
    puts "CREATE VIEW #{name}"
    new(name).create
  end

  def drop(name)
    puts "DROP VIEW #{name}"
    new(name).drop
  end

  def views
    ActiveRecord::Base.connection.views
  end

  def drop_all
    views.each do |view|
      drop(view)
    end
  end
end
