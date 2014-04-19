# Many thanks to http://stackoverflow.com/a/16746262 for the pointer on how to
# switch from an integer ID column to UUID column
class EnableUuidExtension < ActiveRecord::Migration
  def up
    enable_extension 'uuid-ossp'
    remove_column :users, :id
    add_column :users, :id, :uuid, default: 'uuid_generate_v4()'
  end

  def down
    enable_extension 'uuid-ossp'
    remove_column :users, :id
    add_column :users, :id, :primary_key
  end
end
