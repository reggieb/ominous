require 'dibber'
Seeder = Dibber::Seeder

Seeder.seeds_path = "#{Rails.root}/db/seeds"

Seeder.new(Ominous::Warning, 'ominous/warnings.yml').build
Seeder.new(Ominous::Closer, 'ominous/closers.yml').build

Ominous::Warning.first.closers = Ominous::Closer.all

puts Seeder.report
