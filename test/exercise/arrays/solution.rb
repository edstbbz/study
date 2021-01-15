module Exercise
  module Arrays
    class << self
      def max(array)
        max = array[0]
        array.each { |elem| max = elem if elem > max }
        max
      end

      def replace(array)
        max_elem = max(array)
        array.map { |elem| elem.positive? ? max_elem : elem }
      end

      def search(array, query)
        left = 0
        right = array.length - 1
        while left <= right
          mid = (right + left) / 2
          return mid if array[mid] == query

          if array[mid] > query
            right = mid - 1
          else
            left = mid + 1
          end
        end
        return -1 if left > right
      end
    end
  end
end
