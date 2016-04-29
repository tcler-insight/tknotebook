text .text -width 80 -height 40
pack .text

bind .text <Control-g> {puts "Control-g"}
bind .text <Control-G> {puts "Control-G"}
bind .text <Shift-Control-g> {puts "Shift-Control-g"}
bind .text <Shift-Control-G> {puts "Shift-Control-G"}

proc bindletterkey {tag modifier letter binding} {
    set upper [string toupper $letter]
    set lower [string tolower $letter]

    bind $tag <$modifier-$upper> $binding
    bind $tag <$modifier-$lower> $binding
} 

bindletterkey .text Control F       {puts "Control-F"}
bindletterkey .text Shift-Control F {puts "Shift-Control-F"}


