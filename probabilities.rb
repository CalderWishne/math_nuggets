require 'byebug'

def dist(outcomes_array, probs_array)
  gen = Random.new
  rand_num = gen.rand(1.0) * 100
  bins(probs_array).each_with_index do |bin, idx|
    if rand_num <= bin
      return outcomes_array[idx]
    end
  end
end

def bins(probs_array)
  probs_float = probs_array.map(&:to_f)
  bins = [0]
  probs_float.each do |prob|
    bins <<  bins[-1] + prob
  end
  bins.shift
  bins
end



def test(num)
  frequencies = Hash.new { |hash, key| hash[key] = 0 }
  num.times do
    frequencies[dist(["a", "b", "c", "d","e"], [10,20,25,35,10])] += 100.0 / num
  end
  frequencies
end

p test(100000)
