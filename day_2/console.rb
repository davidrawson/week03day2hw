require ('pry-byebug')

require_relative('./models/bounty.rb')


bounty_hunter1 = Bounty.new({
  'name' => 'Boba Fett',
  'species'  => 'human',
  'weapon'  => 'blaster',
  'bounty_value' => '900'
})

bounty_hunter1.save()
