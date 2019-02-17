import sequtils, strutils, math, algorithm

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
  N = 5
  d: seq[int]

d = @[]

for i in 1..N:
  d.add(parseInt(readLine(stdin)))
echo a,", " , bc, ", ", s, ", ", d # -> 1, @[2, 3], 456, @[7, 8, 9, 10, 11]

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
# atcoderのNim0.13ではrandomが使えないっぽいのでc言語から持ってくるなど

a = a.sorted(system.cmp[int]) # 昇順ソート
