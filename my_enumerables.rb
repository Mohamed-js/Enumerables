module Enumerable
  def my_all
    raise 'NO BLOCK GIVEN!' unless block_given?

    arr = to_a
    arr.my_each_with_index do |_item, index|
      return false unless yield arr[index]
    end
    true
  end

  def my_any
    raise 'NO BLOCK GIVEN!' unless block_given?

    arr = to_a
    index = 0
    any = false

    arr.my_each do |_item|
      any = true if yield arr[index]

      index += 1
    end

    any
  end

  def my_count(arg = nil)
    arr = to_a

    return arr.length if arg.nil?

    index = 0
    count = 0

    arr.my_each do |_item|
      count += 1 if arg == arr[index]
      index += 1
    end

    count
  end

  def my_each
    arr = to_a
    i = 0
    while i < arr.length
      yield arr[i]
      i += 1
    end

    arr
  end

  def my_each_with_index
    arr = to_a
    i = 0
    while i < arr.length
      yield arr[i], i
      i += 1
    end

    arr
  end

  def my_inject
    raise 'ERROR' unless block_given?

    arr = to_a
    i = 1
    result = arr[0]
    result = '' if result.class == String

    while i < arr.length
      result = yield result, arr[i]
      i += 1
    end

    result
  end

  def my_map(pro = nil)
    raise 'NO BLOCK GIVEN!' unless block_given?

    arr = to_a
    if pro
      arr.my_each_with_index do |_item, index|
        arr[index] = proc.cal arr[index]
      end
    else
      arr.my_each_with_index do |_item, index|
        arr[index] = yield arr[index]
      end
    end
  end

  def my_none
    raise 'NO BLOCK GIVEN!' unless block_given?

    arr = to_a
    arr.my_each_with_index do |_item, index|
      return false if yield arr[index]
    end
    true
  end

  def my_select
    raise 'NO BLOCK GIVEN!' unless block_given?
    arr = to_a
    index = 0
    arr2 = []
    arr.my_each_with_index do |_item, index|
      if yield arr[index]
        arr2.push(arr[index])
      end
    end
    arr2
  end
end

def multiply_els(arr = [])
  return arr.my_inject {|total, item| total * item}
end
