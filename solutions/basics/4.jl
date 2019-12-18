function checkfermat(a::Int, b::Int, c::Int, n::Int)
    if a^n + b^n == c^n
        println("Holy smokes, Fermat was wrong!")
    else
        println("No, that does not work")
    end
end

function checkfermat()
    println("give me a!")
    a = parse(Int, readline())
    println("give me b!")
    b = parse(Int, readline())
    println("give me c!")
    c = parse(Int, readline())
    println("give me n!")
    n = parse(Int, readline())
    checkfermat(a,b,c,n)
end