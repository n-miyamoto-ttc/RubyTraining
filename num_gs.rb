class Number_guess
  
  def input_dec #入力&判断メソッド
    cnt = 0
    cor = rand(1..100)
    begin
      loop do
        p "please number 1~100"
        num = gets.to_i
        cnt += 1
        if (1..100).include?(num)
          p "choice#{num}, Ans smaller" if num > cor
          p "choice#{num}, Ans larger" if num < cor
          if num == cor
            p "Ans #{cor}, #{cnt}th Challenge is correct!!"
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
ng.input_dec
