import math, strformat, macros, strutils
when not declared COMPETITIVE_STD_STD_HPP:
    const COMPETITIVE_STD_STD_HPP* = 1
    const MODINT998244353* = 998244353
    const MODINT1000000007* = 1000000007
    const INF* = 100100111
    const INFL* = int(3300300300300300491)
    type double* = float64
    let readNext = iterator(getsChar: bool = false): string {.closure.} =
        while true:
            var si: string
            try: si = stdin.readLine
            except EOFError: yield ""
            for s in si.split:
                if getsChar:
                    for i in 0..<s.len():
                        yield s[i..i]
                else:
                    yield s
    proc input*(t: typedesc[string]): string = readNext()
    proc input*(t: typedesc[char]): char = readNext(true)[0]
    proc input*(t: typedesc[int]): int = readNext().parseInt
    proc input*(t: typedesc[float]): float = readNext().parseFloat
    macro input*(t: typedesc, n: varargs[int]): untyped =
        var repStr = ""
        for arg in n:
            repStr &= &"({arg.repr}).newSeqWith "
        parseExpr(&"{repStr}input({t})")
    macro input*(ts: varargs[auto]): untyped =
        var tupStr = ""
        for t in ts:
            tupStr &= &"input({t.repr}),"
        parseExpr(&"({tupStr})")
    macro input*(n: int, ts: varargs[auto]): untyped =
        for typ in ts:
            if typ.typeKind != ntyAnything:
                error("Expected typedesc, got " & typ.repr, typ)
        parseExpr(&"({n.repr}).newSeqWith input({ts.repr})")
    proc `fmtprint`*[T](x: seq[T]): string = return x.join(" ")
    proc `fmtprint`*(x: int or string or char): string = return $x
    proc `fmtprint`*(x: float or float32 or float64): string = return &"{x:.16f}"
    proc print*(prop: tuple[f: File, sepc: string, endc: string, flush: bool], args: varargs[string, `fmtprint`]) =
        for i in 0..<len(args):
            prop.f.write(&"{args[i]}")
            if i != len(args) - 1: prop.f.write(prop.sepc) else: prop.f.write(prop.endc)
        if prop.flush: prop.f.flushFile()
    proc print*(args: varargs[string, `fmtprint`]) = print((f: stdout, sepc: " ", endc: "\n", flush: false), args)
    proc inner_debug*(x: auto) = print((f: stderr, sepc: "", endc: "", flush: true), x)
    macro debug*(n: varargs[typed]): untyped =
        result = newNimNode(nnkStmtList, n)
        for i in 0..n.len-1:
            if n[i].kind == nnkStrLit:
                result.add(newCall("inner_debug", n[i]))
                result.add(newCall("inner_debug", newStrLitNode(": ")))
                result.add(newCall("inner_debug", n[i]))
            else:
                result.add(newCall("inner_debug", toStrLit(n[i])))
                result.add(newCall("inner_debug", newStrLitNode(": ")))
                result.add(newCall("inner_debug", n[i]))
            if i != n.len-1:
                result.add(newCall("inner_debug", newStrLitNode(", ")))
            else:
                result.add(newCall("inner_debug", newStrLitNode("\n")))
    proc `%`*(x:int, y:int):int = (((x mod y) + y) mod y)
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
    iterator range*(ends:int):int=(for i in 0..<ends: yield i)
    iterator range*(start:int,ends:int):int= (for i in start..<ends: yield i)
    proc yes*(b: bool = true): void = print(if b: "Yes" else: "No")
    proc no*(b: bool = true): void = yes(not b)
    proc yes_upper*(b: bool = true): void = print(if b: "YES" else: "NO")
    proc no_upper*(b: bool = true): void = yes_upper(not b)
    const DXY* = [(0, -1), (0, 1), (-1, 0), (1, 0)]
    const DDXY* = [(1, -1), (1, 0), (1, 1), (0, -1), (0, 1), (-1, -1), (-1, 0), (-1, 1)]
    macro exit*(statement: untyped): untyped =
        quote do:
            `statement`
            quit()
