
RSpec.shared_context "db view context", shared_context: :metadata do
  class << self
    attr_reader :view_name
    attr_reader :view
  end
  @view_name = view_name = metadata[:description_args].first
  @view ||= Class.new(ActiveRecord::Base) do |model|
    model.table_name = view_name
  end

  delegate :view_name, :view, to: :class
  delegate :arel_table, :connection, :where, :all, :find_by, to: :view
  delegate :execute, :exec_query, :quote_table_name, to: :connection

  let(:columns) { connection.columns(view_name) }
  let(:column_names) { columns.map(&:name).sort }
  let(:select_all) { arel_table.project(Arel.star) }

  def view_exists?
    connection.view_exists? view_name
  end
end

RSpec.configure do |rspec|
  rspec.include_context "db view context", type: :db_view
end
