class Number_guess
  def initialize(num = 0)
        @num = num
  end
    
  def input_decision
    ary = Range.new(1,100).to_a
    cnt = 1
    cor = ary.sample
    begin
      loop do
        p "please number 1~100"
        @num = gets.to_i
        if @num > 0
          if @num > cor
            p "choice#{@num}, Ans smaller"
            cnt += 1
          elsif @num < cor
            p "choice#{@num}, Ans larger"
            cnt += 1
          else
            p "#{cnt}th Challenge is correct!!"
            break
          end
        else
          p "Not 1~100 number, pls try again"
        end
      end
    rescue => e
      p "Error,#{e}"
    ensure
      p "Done."
    end
  end
end

ng = Number_guess.new
ng.input_decision
