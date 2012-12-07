require 'dibber'
Seeder = Dibber::Seeder

Seeder.seeds_path = "#{Rails.root}/db/seeds"

Seeder.new(Ominous::Warning, 'ominous/warnings.yml').build

puts Seeder.report
