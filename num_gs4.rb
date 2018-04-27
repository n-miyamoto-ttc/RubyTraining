class Number_guess
  
  def initialize(ary = list = [], hit = cnt = 0)
    @ary = ary
    @hit = hit
    @cnt = cnt
    @list = list
    mkary
  end
  
  def mkary #正解配列生成
    ary_tmp = Range.new(0,9).to_a
    @ary = ary_tmp.shuffle.take(4)
  end
  
  def input #入力
    num = 0
    p "pls input 4 digit number"
    gets.to_s.match(/^\d{4}$/) do |md| # 入力&正規表現
      num = md[0] #numに代入
    end
    @list = num.chars.map(&:to_i) #入力配列化
  end
  
  def hit_blw #hit&blow判断
    blw = @hit = 0
    @list.each.with_index do |v,k| #listのkey,valueをそれぞれ取り出す
      if v == @ary[k] #hit判定
        @hit += 1
        next
      end
      blw += 1 if @ary.include?(v) #blow判定
    end
    p "Hit = #{@hit}, Blow = #{blw}"
    @cnt += 1
  end

  def dec
    begin
    loop do
      input
      hit_blw if @list.uniq.length == 4
      if @hit == 4
        p "#{@cnt}th challenge correct!!"
        break
      end
    end
    rescue => e
      p "Error, #{e}"
    ensure
      p "Done."
    end
  end
end

ng = Number_guess.new
ng.dec