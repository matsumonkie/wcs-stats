class RPParserService

  def self.parse registry_point
    dancer = Dancer.parse(registry_point.json['dancer'])
    wcs = Array(registry_point.json['placements']['West Coast Swing'])


    event_division_competitions = wcs.map { |json|
      division = Division.parse(json['division'])
      json['competitions'].map do |json_competition|
        event = Event.parse(json_competition['event'])
        competition = Competition.parse(json_competition)

        {
          event: event,
          division: division,
          competition: competition,
        }
      end
    }.flatten

    {
      dancer: dancer,
      event_division_competitions: event_division_competitions,
    }
  end

  def self.build dancer, event_division_competitions
    competitions = event_division_competitions.map do |event_division_competition|
      new_event = event_division_competition[:event]
      competition = event_division_competition[:competition]
      new_division = event_division_competition[:division]

      event = Event.where(ext_id: new_event.ext_id).first_or_create(new_event.attributes)
      division = Division.where(ext_id: new_division.ext_id).first_or_create(new_division.attributes)

      competition.event = event
      competition.division = division
      competition.save
      competition
    end

    dancer.competitions = competitions
    dancer.save

    dancer
  end
end
