module HelloHelper
  def first
    av = mid_weight()
    i = 1
    count = 0
    result = []
    for el in @baggages
      if (el.totalWeight / el.numberThings - av).abs <= 0.3
        pass = Passenger.new(el.id, el.numberThings, el.totalWeight)
        result.push(pass)
        count +=1
      end
      i+=1
    end
    if count == 0
      return -1
    end
    return result
  end

  def second
    count_passenger_more_two = 0
    count_passenger_more_average = 0
    av = mid_count
    for el in @baggages
      if el.numberThings > 2
        count_passenger_more_two+=1
        if el.numberThings > av
          count_passenger_more_average+=1
        end
      end
    end
    return count_passenger_more_two, count_passenger_more_average
  end

  def third
    count = 0

    for i in 0..@baggages.size-1
      for j in (i+1)..@baggages.size-1
        if @baggages[i].numberThings == @baggages[j].numberThings && (@baggages[i].totalWeight-@baggages[j].totalWeight).abs <=0.5
          count +=1
        end
      end
    end

    if count == 0
      print "There are no two passengers with the same amount of luggage and the difference is less than 0.5 kg\n"
      return false
    else
      return true
    end
  end


  def fourth
    puts "FOURTH TASK"
    max_counts = @baggages[0].numberThings
    index_max_counts = 0
    for i in 0..@baggages.size-1
      if @baggages[i].numberThings > max_counts
        max_counts = @baggages[i].numberThings
        index_max_counts = i
      end
    end

    max_weight = @baggages[0].totalWeight
    index_max_weight = 0
    for i in 0..@baggages.size-1
      if @baggages[i].totalWeight > max_weight
        max_weight = @baggages[i].totalWeight
        index_max_weight = i
      end
    end

    if index_max_counts == index_max_weight
      return true
    else
      return false
    end

  end
  def fifth
    count = 0
    for i in 0..@baggages.size-1
      if @baggages[i].numberThings == 1 && @baggages[i].numberThings <= 30
        count +=1
      end
    end
    if count == 0
      return false
    else
      return true
    end

  end
  def mid_weight
    average = 0.0
    @baggages.each { |bag| average += bag.totalWeight }
    average /= @baggages.size
    return average
  end

  def mid_count
    count = 0.0
    @baggages.each { |bag| count += bag.numberThings }
    count /= @baggages.size
    return count
  end

end
class Passenger
  def initialize(id, count_things, weight)
    @id = id
    @count_things = count_things
    @weight = weight
  end
  def get_count_things
    return @count_things
  end
  def get_weight
    return @weight
  end
  def getId
    return @id
  end
end
