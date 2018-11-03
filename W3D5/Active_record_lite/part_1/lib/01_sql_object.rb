require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    return @columns if @columns
    row = DBConnection.execute("SELECT * FROM #{table_name} LIMIT 1")
    # debugger
    @columns = []
    row[0].each do |k,v|
      @columns << k.to_sym
    end
    @columns
  end

  def self.finalize!
    self.columns.each do |name|
      define_method(name) do
        self.attributes[name]
      end

      define_method("#{name}=") do |value|
        self.attributes[name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.tableize
  end

  def self.all
    data = DBConnection.instance.execute("SELECT * FROM #{self.table_name}")
    data.map { |d| SQLObject.new(d) }
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    DBConnection.instance.execute("SELECT * FROM #{self} WHERE id = #{id}")
  end

  def initialize(params = {})
    params.each do |name, value|

      define_method(name){ instance_variable_get("@#{name}") }
      define_method("#{name}="){ instance_variable_set("@#{name}",value) }

    end
    attributes
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |attr| self.send(attr) }
  end

  def insert

  end

  def update
    set_line = self.class.columns
      .map { |attr| "#{attr} = ?" }.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    id.nil? ? insert : update
  end
end
