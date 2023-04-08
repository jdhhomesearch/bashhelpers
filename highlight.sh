# 1	
# 30	grey
# 1;30	lightgrey
# 31	red
# 1;31	lightred
# 32	green
# 1;32	lightgreen
# 33	gold
# 1;33	yellow
# 34	blue
# 1;34	lightblue
# 35	purple
# 1;35	lightpurple
# 36	cyan
# 1;36	lightcyan
# 37	
# 1;37
# 
# 
# 

highlight-generic ()
{
	local COLORNUM=$1
	shift
	local FILE="-"
	if [[ $# -ge 2 ]] ; then
		FILE="$2"
		shift
	fi
	GREP_COLORS="mt=${COLORNUM}" egrep --color=always --line-buffered "${1}|" "${FILE}"
}


test-highlight-colors ()
{
  for COLOR in "1" "30" "01;30" "31" "01;31" "32" "01;32" "33" "1;33" "34" "1;34" "35" "1;35" "36" "1;36" "37" "1;37"; do 
    echo "test highlight colors ${COLOR}" | highlight-generic "${COLOR}" highlight;
  done
}

highlight-grey () { highlight-generic "30" "$@"; }
highlight-lightgrey () { highlight-generic "1;30" "$@"; }
highlight-red () { highlight-generic "31" "$@"; }
highlight-lightred () { highlight-generic "1;31" "$@"; }
highlight-green () { highlight-generic "32" "$@"; }
highlight-lightgreen () { highlight-generic "1;32" "$@"; }
highlight-gold () { highlight-generic "33" "$@"; }
highlight-yellow () { highlight-generic "1;33" "$@"; }
highlight-blue () { highlight-generic "34" "$@"; }
highlight-lightblue () { highlight-generic "1;34" "$@"; }
highlight-purple () { highlight-generic "35" "$@"; }
highlight-lightpurple () { highlight-generic "1;35" "$@"; }
highlight-cyan () { highlight-generic "36" "$@"; }
highlight-lightcyan () { highlight-generic "1;36" "$@"; }
highlight () { highlight-red "$@"; }
