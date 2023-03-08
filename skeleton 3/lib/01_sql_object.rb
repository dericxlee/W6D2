require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    # @column ||= DBConnection::execute2(<<-SQL)
    #   SELECT
    #     *
    #   FROM
    #     #{table_name}
    # SQL

    DBConnection::execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL


    # return @column.first.map {|ele| ele.to_sym}
  end

  def self.finalize!
    @attributes = {}

    # columns.each do |column|
    #   define_method(column) do
    #     instance_variable_get "@#{column}"
    #   end

    #   define_method("#{column}=") do |val|
    #     instance_variable_set "@#{column}", val
    #   end
    # end
    
    @columns = DBConnection::execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    # @columns.each do |hash|
    #   attributes[hash[:id]]

  end

  def self.table_name=(table_name)
    # ...
  end

  def self.table_name
    # ...
    new_str = ""
    "#{self}".each_char do |char, idx|
      if char == char.downcase || "#{self}"[0]
        new_str += char.downcase
      else
        new_str += "_" + char.downcase
      end
    end
    return new_str + "s"
    # "#{self}".downcase + "s"
  end

  def self.all
    # ...

  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
