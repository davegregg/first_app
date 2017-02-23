require 'ffaker'

class Filler

  @@new_lipsum = -> { FFaker::HTMLIpsum.body }
  @@new_name = -> { FFaker::Name.first_name }

  @@static_lipsum = @@new_lipsum.call
  @@welcome = 'We welcome you. Join us. Leave all aseity behind. ' +
              'Be one with the Oneness in which all is naught.'

  class << self

    def lipsum
      @@static_lipsum
    end

    def new_lipsum
      @@new_lipsum.call
    end

    def welcome(name='')
      return @@welcome unless name.empty?
      name + ', ' + @@welcome[0].downcase + @@welcome[1..-1]
    end

    def new_name
      @@new_name.call
    end

  end

end
