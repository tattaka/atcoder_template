import sequtils, strutils, math, algorithm, tables

# input =
# 1
# 2 3
# 456
# 7
# 8
# 9
# 10
# 11

var
  a = parseInt(readLine(stdin))
  bc = readLine(stdin).split().map(parseInt)
  s =  readLine(stdin)
  new_seq = newseqWith(26, 0)
  new_seq2 = newseqWith(26, newseqWith(26, 0)) # 26x26 sequence
  # ng_seq = newseq[newseq[int](1)](50) # コンパイル通らない
  # ac_seq = newseqWith(50, newseq[int](0)) # コンパイル通る
  table_int = initCountTable[int]()
  N = 5
  d: seq[int]

d = @[]

for i in 1..N:
  d.add(parseInt(readLine(stdin)))
echo a,", " , bc, ", ", s, ", ", d # -> 1, @[2, 3], 456, @[7, 8, 9, 10, 11]
for bc_i in bc:
  table_int.inc(bc_i)
echo table_int
# Tips
var
  multiSeq = @[@[0, 0, 0], @[1, 1, 1], @[2, 2, 2], @[3, 3, 3]]

echo multiSeq[0][0] # -> 0
echo multiSeq[0..1][0..1] # -> @[@[0, 0, 0], @[1, 1, 1]]
echo multiSeq[0][0..1] # -> @[0, 0]
echo multiSeq[0..1][0] # -> @[0, 0, 0]

echo map(multiSeq[0..1], proc(x: seq[int]): seq[int] = x[0..1]) # -> @[@[0, 0], @[1, 1]] multiple slice!!!

proc toString(str: seq[char]): string =
  result = newStringOfCap(len(str))
  for ch in str:
    add(result, ch)

proc gcd(a, b: uint64):uint64 =
  var
    a = a
    b = b
  while b != 0:
    var r = a mod b
    a = b
    b = r
  return a

proc lcm(m, n: uint64): uint64 =
  result = m div gcd(m, n) * n
  return result
# atcoderのNim0.13ではrandomが使えないっぽいのでc言語から持ってくるなど

bc = bc.sorted(system.cmp[int]) # 昇順ソート

# atcoderのNim0.13では未初期化変数に文字列を連結したりするとREになる
# toLowerAscii and toUpperAsciiが使えない
