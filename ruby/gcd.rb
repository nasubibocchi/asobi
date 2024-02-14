def gcd(x, y)
  return x if y == 0
  return gcd(y, x % y)
end
