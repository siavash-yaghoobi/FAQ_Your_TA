puts 'Cleaning database...'
Duck.destroy_all



puts 'Creating ducks...'
ducks_attributes = [
  {
    name:         'Donald Duck',
    category:     'cartoon character',
    description:  'Angry angry duck',
    user_id:       1,
  },
  {
    name:         'Daffy Duck',
    category:     'cartoon character',
    description:  'Social duck',
    user_id:       1
  },
  {
    name:         'Barbara Streissand',
    category:     'party duck',
    description:  'Berghain specialty',
    user_id:       1
  },
  {
    name:         'Bath duck',
    category:     'classics',
    description:  'Good ol rubber yellow duck',
    user_id:       1
  },
]
Duck.first_or_create(ducks_attributes)
puts 'Finished!'
