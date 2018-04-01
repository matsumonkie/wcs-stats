class Division < ApplicationRecord
  has_many :competitions
  has_many :dancers, through: :competitions

  def self.parse json
    Division.new(
      ext_id: json['id'],
      name: json['name'],
      abbreviation: json['abbreviation'],
    )
  end
end
