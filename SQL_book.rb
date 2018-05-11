require 'sqlite3'

class BookandPrice
  
  def initialize(dbfile)
    @dbfile = dbfile
  end
  
  def create # create table [book]
    return if File.exist?(@dbfile)
    SQLite3::Database.open(@dbfile) do |db|
      db.execute(<<-SQL)
        CREATE TABLE IF NOT EXISTS book
        (name TEXT, price INTEGER)
      SQL
    end
  end
  
  def insert(in_name, in_price) # insert k&v to book : name & price 
    SQLite3::Database.open(@dbfile) do |db|
      data = {name: in_name, price: in_price}
      db.execute(<<-SQL, data)
        INSERT INTO book VALUES
        (:name, :price)
      SQL
    end
  end
  
  def find_all # 全表示
    ret = []
    SQLite3::Database.open(@dbfile) do |db|
      db.execute(<<-SQL){|row| ret << row.join(" ")}
      SELECT * 
        FROM book
      SQL
    end
    puts ret.map{|line| line + "\n"}.join
    puts
  end
  
  def find_exp(f_price) # 入力した値段以上のデータを表示
    ret = []
    SQLite3::Database.open(@dbfile) do |db|
      db.execute(<<-SQL, f_price){|row| ret << row.join(" ")}
        SELECT *
        FROM book
        WHERE price >= ?
      SQL
    end
    puts ret.map{|line| line + "\n"}.join
    puts
  end

  def find_word(word) # 入力した文字を含む名前のデータを表示
    ret = []
    SQLite3::Database.open(@dbfile) do |db|
      like = "%#{word}%"
      db.execute(<<-SQL, like){|row| ret << row.join(" ")}
        SELECT *
        FROM book
        WHERE name LIKE ?
      SQL
    end
    puts ret.map{|line| line + "\n"}.join
    puts
  end
  
  def name_asc # 名前昇順
    ret = []
    SQLite3::Database.open(@dbfile) do |db|
      db.execute(<<-SQL){|row| ret << row.join(" ")}
        SELECT *
        FROM book
        ORDER BY name ASC
      SQL
    end
    puts ret.map{|line| line + "\n"}.join
    puts
  end
  
  def price_desc # 値段降順
    ret = []
    SQLite3::Database.open(@dbfile) do |db|
      db.execute(<<-SQL){|row| ret << row.join(" ")}
        SELECT *
        FROM book
        ORDER BY price DESC
      SQL
    end
    puts ret.map{|line| line + "\n"}.join
    puts
  end

  def update(str, int) # 指定の本の値段を指定値に更新
    SQLite3::Database.open(@dbfile) do |db|
      db.execute(<<-SQL, int, str)
        UPDATE book
        SET price = ?
        WHERE name = ?
      SQL
    end
    find_all
  end
  
  def delete_by_name(title) # 指定した文字列を含む名前のデータを全消去
    SQLite3::Database.open(@dbfile) do |db|
      like = "%#{title}%"
      db.execute(<<-SQL, like)
        DELETE FROM book
        WHERE name LIKE ?
      SQL
    end
    find_all
  end
end

bp = BookandPrice.new("book.db")
# bp.create
# bp.insert("楽しいRuby", 2600)
# bp.insert("優しいRuby", 13000)
# bp.insert("楽しいC", 50000)
# bp.insert("優しいC", 1000)
bp.find_all
bp.find_exp(10000)
bp.find_word("楽しい")
bp.name_asc
bp.price_desc
bp.update("楽しいRuby", 2500)
# bp.delete_by_name("楽しい")
