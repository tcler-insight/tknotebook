package require Tk 8.4

interp create grafix

frame .f
canvas .f.canvas -height 400 -width 600 \
    -background black \
    -borderwidth 0 \
    -highlightthickness 0

pack .f.canvas -padx 20 -pady 20
pack .f

grafix alias line  .f.canvas create line
grafix alias text  .f.canvas create text
grafix alias rect  .f.canvas create rectangle
grafix alias clear .f.canvas delete all
grafix alias erase .f.canvas delete
grafix alias bbox  .f.canvas bbox
grafix alias raise .f.canvas raise

grafix eval {
    proc textbox {x y text} {
        set t [text $x $y -fill black -font {Monaco 16} -text $text -justify center]
        rect [bbox $t] -outline white -fill white -width 2
        raise $t
    }

    textbox 120 120 "Hey, Will!\nI'm in a box!"
    textbox 80 200 "And Here's\nAnother Box!"
    text 10 10 -anchor nw -width 6.5i -fill green -font {Helvetica 16} -text {Now is the time for all good men to come to the aid of their country.  A penny saved is a penny earned.  A bird in the hand is worth two at the grocers.  If wishes were horses, beggars might ride.}
    line 0 100 6i 100 -fill green
}



