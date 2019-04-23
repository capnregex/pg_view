module PgView::ClassMethods
  def list_file
    'db/views/index.txt'
  end

  def read_list
    list = []
    File.read(list_file).each_line do |line|
      line = line.sub(/\#.*$/, '').strip
      list << line if line.present?
    end
    list
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

  def dump(name)
    puts "DUMP VIEW #{name}"
    new(name).dump
  end

  def connection
    ActiveRecord::Base.connection
  end

  delegate :views, :view_exists?, :execute, :quote_table_name, to: :connection

  def drop_all
    views.each do |view|
      drop(view)
    end
  end

  def dump_all
    views.each do |view|
      dump(view)
    end
  end
end
