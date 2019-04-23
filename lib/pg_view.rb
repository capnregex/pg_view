require "pg_view/railtie"
require "pg_view/class_methods"
require "pg_view/instance_methods"

class PgView
  extend PgView::ClassMethods
  include PgView::InstanceMethods
  # Your code goes here...
end
