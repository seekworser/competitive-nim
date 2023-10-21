import competitive/std/std
when not declared COMPETITIVE_MATH_BINSEARCH:
    const COMPETITIVE_MATH_BINSEARCH* = 1
    proc binsearch*(mn, mx: int, le: proc): int =
        var
            lo = mn
            hi = mx
        while hi - lo > 1:
            var mid = (hi + lo + 1) // 2
            if le(mid): lo = mid
            else: hi = mid
        return lo
