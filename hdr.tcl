set g1 {= This is a header =}
set g2 {= This is a header =
And this is normal text.}
set b1 {=This is not header=}
set b2 {= Neither is this ==}
set b3 {= Neither is this = And here's some more text}


proc matchHeader {para} {
    if {[regexp {^= (\S[^\n]*\S*) =(\n.*)?$} $para dummy text para]} {
        puts "Header: <$text><$para>"
    } else {
        puts "Not Header: <$para>"
    }
}

matchHeader $g1
matchHeader $g2
matchHeader $b1
matchHeader $b2
matchHeader $b3


