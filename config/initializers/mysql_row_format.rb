ActiveSupport.on_load :active_record do
  module ActiveRecord
    module ConnectionAdapters
      class AbstractMysqlAdapter
        def create_table(table_name, options = {})
          table_options = options.merge(options: 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC')
          super(table_name, table_options) do |td|
            yield td if block_given?
          end
        end
      end
    end
  end
end
