class Competition < ApplicationRecord

  belongs_to :event
  belongs_to :division

  def self.parse json
    Competition.new(
      role: json['role'],
      points: json['points'],
      results: json['results'],
    )
  end
end
