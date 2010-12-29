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
      t.integer  :response_code
      t.integer  :status_code
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
