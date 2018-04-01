class CreateInitMig < ActiveRecord::Migration[5.1]
  def change
    create_table :dancers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :ext_id
      t.integer :wscid

      t.timestamps
    end

    create_table :registry_points do |t|
      t.json 'json'
    end

    create_table :divisions do |t|
      t.integer :ext_id
      t.string :name
      t.string :abbreviation
    end

    create_table :competitions do |t|
      t.string :role
      t.integer :points
      t.integer :results
      t.belongs_to :event, index: true
      t.belongs_to :division, index: true
    end

    create_table :events do |t|
      t.integer :ext_id
      t.string :name
      t.string :location
      t.string :url
      t.string :date
    end

    create_table :dancer_competitions do |t|
      t.belongs_to :dancer, index: true
      t.belongs_to :competition, index: true
    end
  end
end
