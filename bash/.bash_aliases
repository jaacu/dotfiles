#alias defaults 
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#alias customs
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e  's/^//' -e 's/-/|/'"
alias open="xdg-open"
alias artisan="php artisan"
alias test-all="vendor/bin/phpunit --testsuite All"
alias auto-test="php auto-test.php"
alias docker-bash="docker-compose exec php-fpm /bin/bash"
alias docker-mysql="docker-compose exec mariadb /bin/bash"
alias ngrok="~/Downloads/ngrok"
alias please="sudo"
alias lsearch="ll | grep"
alias start-venv="source .venv/bin/activate"
alias docker-ngrok="docker run --rm -it --net=host wernight/ngrok ngrok http" # add localhost:port at the end