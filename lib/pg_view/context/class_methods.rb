require 'active_record'

class PgView
  module Context
    module ClassMethods
      def view_name
        @view_name
      end

      def view_name= name
        @view_name = name
      end

      def view
        @view ||= new_view_class(view_name)
      end

      def new_view_class(table_name)
        Class.new(ActiveRecord::Base) do |model|
          model.table_name = table_name
        end
      end

      delegate :arel_table, :connection, :where, :all, :find_by, to: :view
      delegate :execute, :exec_query, :quote_table_name, to: :connection

      def columns
        @columns ||= connection.columns(view_name)
      end

      def column_names
        @column_names ||= columns.map(&:name).sort 
      end
      
      def select_all
        @select_all ||= arel_table.project(Arel.star) 
      end

      def view_exists?
        connection.view_exists? view_name
      end
    end
  end
end


