#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title X to Twitter URL
# @raycast.mode silent

# Optional parameters:
# @raycast.icon Logo_of_Twitter.png
# @raycast.packageName X to Twitter
# @raycast.description Converts X URL to Twitter from your recent clipboard.

tell application "System Events"
	set input to the clipboard as text
end tell

set output to do shell script "printf '%s' " & quoted form of input & " | sed -E " & Â
	"-e 's|https://x\\.com/([^/]+)/status/([0-9]+)[^ ]*|https://twitter.com/\\1/status/\\2|g' " & Â
	"-e 's|https://x\\.com/|https://twitter.com/|g'"

if input is not equal to output then
	tell application "System Events"
		set the clipboard to (output as text)
	end tell
	return "Converted"
else
	return "No change"
end if