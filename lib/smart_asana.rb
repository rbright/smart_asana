require 'active_support/core_ext/string/inflections'

require "smart_asana/version"

module SmartAsana

  INDICATOR_CHARACTERS = %w{! #}

  class << self

    def parse(args)
      words = args.split(' ')
      indicators = indicators(words)
      name = name(words, indicators)
      attributes(indicators).tap do |hash|
        hash[:name] = name
      end
    end

    private

      def assignee_status(attr)
        case attr
        when '1'
          'today'
        when '2'
          'upcoming'
        when '3'
          'later'
        else
          'inbox'
        end
      end

      def attributes(indicators)
        attrs = {}.tap do |array|
          indicators.each do |ind|
            attr = ind[1..ind.length]
            case ind[0]
            when '!'
              array[:assignee_status] = assignee_status(attr)
            when '#'
              array[:workspace] = attr.titleize
            end
          end
        end
      end

      def indicators(words)
        indicators = words.select { |word|
          INDICATOR_CHARACTERS.include?(word[0])
        }
      end

      def name(words, indicators)
        [].tap { |array|
          words.each do |word|
            unless indicators.include?(word)
              array << word
            else
              break
            end
          end
        }.join(' ')
      end

  end

end
