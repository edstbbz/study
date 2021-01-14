module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films_sort = array.select do |film|
          film['rating_kinopoisk'].to_f.positive? &&
            film['country'].to_s.split(',').length > 1
        end
        result = films_sort.map { |film| film['rating_kinopoisk'].to_f }.reduce(:+)
        result / films_sort.length
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
             .map { |film| film['name'] }.join('').count('и')
      end
    end
  end
end
