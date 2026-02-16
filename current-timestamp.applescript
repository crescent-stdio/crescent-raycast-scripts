#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Timestamp
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🕐
# @raycast.packageName Timestamp
# @raycast.description Copies current timestamp [YYMMDD-HHMM] to clipboard.

set ts to do shell script "date '+[%y%m%d-%H%M]'"
set msg to do shell script "date '+Current: %Y.%m.%d %H:%M'"
set the clipboard to ts
tell application "System Events"
	keystroke ts & " "
end tell
return msg
