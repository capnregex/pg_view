module PgView::InstanceMethods
  def initialize(name, _connection=nil)
    @name = name
  end

  def connection
    ActiveRecord::Base.connection
  end

  delegate :columns, :views, :view_exists?, :execute, :quote_table_name, to: :connection

  attr_accessor :name

  def exists?
    view_exists? name
  end

  def create!
    execute "CREATE VIEW #{quote_table_name(name)} AS #{sql_definition}"
  end

  def drop!
    execute "DROP VIEW IF EXISTS #{quote_table_name(name)} CASCADE"
  end

  def drop
    drop! if exists?
  end

  def create
    create! unless exists?
  end

  def sql_definition
    File.read(full_path).tap do |content|
      raise "Define view query in #{path}." if content.empty?
    end
  end

  def full_path
    Rails.root.join(path)
  end

  def path
    File.join("db", "views", filename)
  end

  def filename
    "#{@name}.sql"
  end

  def dump_filename
    "#{@name}.txt"
  end

  def dump_full_path
    Rails.root.join(dump_path)
  end

  def dump_path
    File.join("db", "views", dump_filename)
  end

  def column_names
    columns(name).map(&:name)
  end

  def dump
    File.open(dump_full_path, "w") do |out|
      column_names.each do |column|
        out.puts "  #{name}.#{column},"
      end
    end
  end
end

