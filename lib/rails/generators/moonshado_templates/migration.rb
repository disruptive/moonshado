class MoonshadoCreateMessages < ActiveRecord::Migration
  def self.up
    create_table(:messages) do |t|
      t.string   :to
      t.string   :from
      t.string   :body
      t.string   :reporting_key
      t.string   :ttl
      t.boolean  :shorten, :default => false
      t.datetime :sent_at
      t.integer  :sub_id
      t.integer  :response_code
      t.integer  :status_code
      t.string   :carrier
      t.integer  :shortcode
      t.integer  :parent_id
      t.string   :country
      t.string   :status
      t.datetime :read_at
      t.timestamps
    end

    add_index :messages, :to
    add_index :messages, :from
    add_index :messages, :reporting_key
  end

  def self.down
    drop_table :messages
  end
end

