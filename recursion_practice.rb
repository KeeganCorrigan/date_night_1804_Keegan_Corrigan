require 'pry'

def countdown(n)
  loop do
    binding.pry
    puts "#{n}"
    break if n <= 0
    n -= 1
  end

  "okay we're done"
end

countdown(4)
