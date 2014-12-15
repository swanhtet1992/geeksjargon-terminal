# Get a random quote from Geeks' Jargon http://geeksjargon.com
# Inspired by Rand-Quote plugin of oh-my-zsh

QUOTE_COLOR="\e[0;34m"
AUTHOR_COLOR="\e[0;35m"

function geeksjargon() {
    GJ=$(curl -s  --connect-timeout 2 "http://geeksjargon.com/quote/refresh")
    QUOTE=$(echo $GJ | grep -m 1 "quote" | sed -e 's/.*\"quote\"//g' -e 's/<.*//g' -e 's/^[^a-zA-Z]*//' -e "s/&#039;/'/g" -e "s/&rsquo;/'/g" -e "s/&quot;/\`/g" -e "s/&hellip;/.../g")
    AUTHOR=$(echo $GJ | grep -m 1 "author_name" | sed -e 's/.*\"author_name\"//g' -e 's/<.*//g' -e 's/^[^a-zA-Z]*//')
    INFO=$(echo $GJ | grep -m 1 "author_info" | sed -e 's/.*\"author_info\"//g' -e 's/<.*//g' -e 's/^[^a-zA-Z]*//' -e 's/}.*//' -e 's/&amp;/&/g') 
    if [ "$GJ" -a "$QUOTE" ]; then
	    echo "${QUOTE_COLOR}\"${QUOTE_COLOR}${QUOTE}\" - ${AUTHOR_COLOR}${AUTHOR} ( ${AUTHOR_COLOR}${INFO})"
    else
      geeksjargon
    fi
}
#geeksjargon
