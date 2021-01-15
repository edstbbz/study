module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        sorted_films = array.select do |film|
          film['country']&.include?(',') && film['rating_kinopoisk'].to_f&.positive?  
        end
        result = sorted_films.reduce(0) { |sum, film| sum + film['rating_kinopoisk'].to_f }
        result / sorted_films.length
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
             .reduce(0) { |sum, film| sum + film['name'].count('и') }
      end
    end
  end
end
