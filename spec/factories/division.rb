FactoryBot.define do

  factory :division do
  end

  factory :invitational, parent: :division do
    ext_id 9
    name "Invitational"
    abbreviation "INV"
  end

  factory :champion, parent: :division do
    ext_id 7
    name "Champions"
    abbreviation "CHMP"
  end

  factory :all_star, parent: :division do
    ext_id 8
    name "All-Stars"
    abbreviation "ALS"
  end

  factory :advanced, parent: :division do
    ext_id 6
    name "Advanced"
    abbreviation "ADV"
  end

  factory :professional, parent: :division do
    ext_id 10
    name "Professional"
    abbreviation "PRO"
  end
end
