def monte_carlo_pi(num_iterations)
  freq = 0
  gen = Random.new
  num_iterations.times do
    x = 1 - gen.rand(2.0)
    y = 1 - gen.rand(2.0)
    if x**2 + y**2 <= 1
      freq +=1
    end
  end
  4 * freq.to_f / num_iterations
end

puts monte_carlo_pi(1000000)

