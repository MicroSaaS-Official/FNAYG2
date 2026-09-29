extends Node

var destination = "none"
var destinationtext = "none"

# This game uses intro.tscn to transfer between scenes
# as an transition
# to use, first set the Globals.destination (short name identifier)
# and set the destinationtext as the full name for the area
# do not use the destination "error" or it will not transport you
# you may use it if it's an error handler
