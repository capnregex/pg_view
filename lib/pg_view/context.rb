
require "pg_view/context/class_methods"

class PgView
  module Context
    delegate :all, :arel_table, :column_names, :columns,
      :connection, :exec_query, :execute, :find_by,
      :quote_table_name, :select_all, :view, :view_exists?,
      :view_name, :where, to: :class

  end
end

