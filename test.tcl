#!/bin/sh
# -*-tcl-*-
# the next line restarts using wish\
exec wish "$0" "$@"

set appdir [file dirname [info script]]
lappend auto_path [file join $appdir lib]
lappend auto_path /Users/will/Library/Tcl /Library/Tcl
package require app-notebook

