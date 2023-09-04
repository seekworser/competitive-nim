when not declared COMPETITIVE_STD_HPP:
    const COMPETITIVE_STD_HPP* = 1
    import math
    const MODINT998244353* = 998244353
    const MODINT1000000007* = 1000000007
    let INF* = 100100111
    let INFL* = int(3300300300300300491)
    type Float = float or float32 or float64
    proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
    proc input*(x: var int): void = scanf("%lld", addr x)
    proc input*(x: var char): void =
        var c: char
        while true:
            scanf("%c", addr c)
            if c != ' ' and c != '\n':
                x = c
                break
    proc input*(x: var Float): void = scanf("%f", addr x)
    proc input*(x: var string): void =
        var c: char
        while true:
            scanf("%c", addr c)
            if c != ' ' and c != '\n':
                x &= c
                break
        while true:
            scanf("%c", addr c)
            if c == ' ' or c == '\n':
                break
            x &= c
    proc input*[T](x: var seq[T]): void =
        for i in 0..<x.len:
            input(x[i])
    proc `%`*(x:int, y:int):int = ((x mod y)+y mod y)
    proc `//`*(x:int, y:int):int =    ((x - (x%y)) div y)
    proc `^`*(x:int, y:int):int = x xor y
    proc `&`*(x:int, y:int):int = x and y
    proc `|`*(x:int, y:int):int = x or y
    proc `>>`*(x:int, y:int):int = x shr y
    proc `<<`*(x:int, y:int):int = x shl y
    proc `%=`*(x:var int, y:int):void = x = x % y
    proc `//=`*(x:var int, y:int):void = x = x // y
    proc `^=`*(x:var int, y:int):void = x = x ^ y
    proc `&=`*(x:var int, y:int):void = x = x & y
    proc `|=`*(x:var int, y:int):void = x = x | y
    proc `>>=`*(x:var int, y:int):void = x = x >> y
    proc `<<=`*(x:var int, y:int):void = x = x << y
    proc `[]`*(x:int,n:int):bool = (x and (1 shl n)) != 0
    proc pow*(a, n: int, m = INFL): int =
        var rev: int = 1
        var a = a
        var n = n
        while n > 0:
            if n % 2 != 0:
                rev = (rev * a) mod m
            if n > 1:
                a = (a * a) mod m
            n >>= 1
        return rev
    proc sqrt*(x: int): int =
        assert(x >= 0)
        var rev = int(sqrt(float(x)))
        while rev * rev > x:
            rev += 1
        while (rev+1) * (rev+1) <= x:
            rev += 1
        return rev
    proc chmax*[T](x: var T, y: T): bool =
        if x < y:
            x = y
            return true
        return false
    proc chmin*[T](x: var T, y: T): bool =
        if x > y:
            x = y
            return true
        return false
    proc at*(x:char, a = '0'):int=int(x)-int(a)
    converter tofloat*(n:int):float = float(n)
    converter tobool*(n:int):bool = n != 0
    converter tobool*[T](a:seq[T]):bool = a.len != 0
    iterator range*(start:int,ends:int,step:int): int =
        var i = start
        if step < 0:
            while i>ends:
                yield i
                i += step
        elif step > 0:
            while i<ends:
                yield i
                i += step
    iterator range*(ends:int):int=(for i in 0..<ends:yield i)
    iterator range*(start:int,ends:int):int= (for i in start..<ends: yield i)

