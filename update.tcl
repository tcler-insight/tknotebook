#!/bin/sh
# -*-tcl-*-
# the next line restarts using wish\
exec tclsh "$0" "$@"

#-----------------------------------------------------------------------
# TITLE:
#	update.tcl
#
# AUTHOR:
#	Will Duquette
#
# DESCRIPTION:
#       Copies the license terms and release notes to help.nbk
#
#-----------------------------------------------------------------------



set appdir [file dirname [info script]]
lappend auto_path /Tcl/lib
lappend auto_path /local/lib
lappend auto_path [file join $appdir lib]
package require notebookdb

proc getfile {name} {
    set f [open $name r]
    set text [read $f]
    close $f
    return $text
}

# FIRST, open help.nbk

notebookdb::notebookdb helpdb -dbfile help.nbk

# NEXT, retrieve the contents of README.txt and license.txt and
# put them into the help database.

helpdb set "Release Notes" [getfile README.txt]
helpdb set "License" [getfile license.txt]

# NEXT, save everything; we're done.
helpdb save




