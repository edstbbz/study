module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0
        array = self
        while i < array.length
          yield array[i]
          i += 1
        end
        array
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) do |acc, ele|
          acc << yield(ele)
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |acc, ele|
          ele.nil? ? acc : acc << ele
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each do |array|
          if acc.nil?
            acc = array
            next
          end
          acc = yield(acc, array)
        end
        acc
      end
    end
  end
end
