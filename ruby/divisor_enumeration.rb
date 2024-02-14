# 問題：
# 整数Nが与えられます。Nの約数を列挙してください。

# 制約：
# 1 <= N <= 10 ** 13
# Nは整数

# 回答
# Nの約数を列挙

# O(n)
def enumerate_divisors_on(n)
  starting = Time.now
  enumerates = []
  # ex 10: 1, 2, 5, 10
  n.times do |i|
    if (n % (i + 1) == 0)
      enumerates << i + 1
    end
  end
  ending = Time.now

  return enumerates, starting - ending
end

#
def enumerate_divisors_half(n)
  starting = Time.now
  enumerates = []
  (n / 2).times do |i|
    if (n % (i + 1) == 0)
      enumerates << i + 1
    end
  end
  enumerates << n
  ending = Time.now

  return enumerates, starting - ending
end

def enumerate_divisors_kai(n)
  starting = Time.now
  rt = Math.sqrt(n)
  arr = []

  (1..rt).each do |i|
    if n % i == 0
      arr << i
      arr << n / i
    end
  end

  ending = Time.now
  # 結局O(n)が足されてしまうのか？ちょっと遅い汗
  return arr.uniq, starting - ending
end

n = gets.to_i
# O(n)
p enumerate_divisors_on(n)
# half
p enumerate_divisors_half(n)
# kai
p enumerate_divisors_kai(n)
