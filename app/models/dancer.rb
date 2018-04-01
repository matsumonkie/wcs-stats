class Dancer < ApplicationRecord

  has_many :dancer_competitions, dependent: :destroy
  has_many :competitions, through: :dancer_competitions

  def self.parse json
    Dancer.new(
      ext_id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      wscid: json['wsci'],
    )
  end
end
