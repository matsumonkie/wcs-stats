class Event < ApplicationRecord

  has_many :competitions

  def self.parse json
    Event.new(
      ext_id: json['id'],
      name: json['name'],
      location: json['location'],
      url: json['url'],
      date: json['date'],
    )
  end
end
