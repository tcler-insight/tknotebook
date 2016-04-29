package require trycatch
namespace import trycatch::*


proc foo {} {
    try {
        puts "Generating error"
        error "Foobar!" {} USER
        return -code error -errorcode USER -errorinfo {} "Cancelled."
    } catch -msg msg {
        puts "Rethrowing the error"
        error $msg {} USER
    }
}

proc bar {} {
    error Cancelled {} USER
    return -code error -errorcode USER -errorinfo {} "Cancelled."
}

set rc [catch {bar} result]

puts "rc:     $rc"
puts "result: $result"
puts "code:   $::errorCode"
