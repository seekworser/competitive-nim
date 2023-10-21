import competitive/std/std
import algorithm, sequtils
import atcoder/segtree

when not declared COMPETITIVE_MATH_INVERSION_NUMBER:
    const COMPETITIVE_MATH_INVERSION_NUMBER* = 1
    proc op(x, y: int): int = return x+y
    proc e(): int = return 0
    proc inversion_number*(a: seq[int]): int =
        let c = a.sorted.deduplicate(isSorted = true)
        var seg = initSegTree[int](c.len, op, e)
        var ans = 0
        for i in range(a.len):
            var pos = c.lowerBound(a[i])
            if pos + 1 < c.len:
                ans += seg.prod(pos+1..<c.len)
            seg.set(pos, seg.get(pos)+1)
        return ans