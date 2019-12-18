function printgrid()
    dashed = " -"^4*" "
    plusdash = "+"*dashed*"+"*dashed*"+"
    verticals = ("|"*" "^9)^2*"|"
    s = (plusdash * "\n" * (verticals * "\n")^4)^2*plusdash * "\n"
    println(s)
end