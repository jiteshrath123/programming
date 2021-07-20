class Str
  def initialize(str)
    @str = str.split('')
    @count = 0
  end

  def permute(l, r)
    if l == r
      @count += 1
      puts @str.join()
      puts @count
    else
      for i in l...r
        swap(l, i)
        permute(l+1, r)
        swap(l, i)
      end
    end
  end

  def swap(i, j)
    temp = @str[i]
    @str[i] = @str[j]
    @str[j] = temp
  end
end
string = gets
str = Str.new(string)
str.permute(0, string.length-1)