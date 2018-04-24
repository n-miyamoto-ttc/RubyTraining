class Number_guess

  def initialize(add = [])
   # @num = num
    @ary = ary
   # @add = add
  end

  def mkary
    tary = Range.new(1,9).to_a
　　shfl = tary.shuffle
　　4.times do |n|
　　  @add << shfl[n]
　　end
　　p @add
　end
end


ng = Number_guess.new
ng.mkary
