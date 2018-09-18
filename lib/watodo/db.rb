require 'fileutils'
require 'active_record'

module Watodo
  class DB
    # データベースへ接続処理を扱うモジュール
    class << self
      def prepare
        database_path = File.join(ENV['HOME'], '.watodo', 'watodo.sqlite3')
        connection_database database_path
        create_tabe_if_not_exists database_path
      end

      def connection_database(path)
        spec = {adapter: 'sqlite3', database: path}
        ActiveRecord::Base.establish_connection spec
      end

      def create_tabe_if_not_exists(path)
        create_database_path path
        connection = ActiveRecord::Base.connection

        return if connection.data_source_exists?(:tasks)

        connection.create_table :tasks do |t|
          t.column :name, :string, null: false
          t.column :content, :text, null: false
          t.column :status, :integer, default: 0, null: false
          t.timestamps
        end
        connection.add_index :tasks, :status
        connection.add_index :tasks, :created_at
      end

      def create_database_path(path)
        FileUtils.mkdir_p File.dirname(path)
      end
    end

    private_class_method :connection_database, :create_tabe_if_not_exists, :create_database_path
  end
end
