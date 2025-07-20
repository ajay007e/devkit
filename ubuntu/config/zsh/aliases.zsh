
alias v='nvim'
alias n='nvim'
alias c='clear'
alias e='exit'

alias cd='z'

alias zsh='source ~/.zshrc'



lcg() {
  if [ ! -f "./leetcode.sh" ]; then
    echo "🚫 Nope. You're standing in the wrong room yelling at the wrong script."
    return 1
  fi

  if [ -z "$1" ]; then
    echo "🔗 You had one job... pass the URL. Let's try again."
    echo "⚠️  Usage: lcg <leetcode_url>"
    return 1
  fi

  local url="$1"
  ./leetcode.sh --generate "$url"
}

lcu() {
  if [ ! -f "./leetcode.sh" ]; then
    echo "🛸 Whatever you're trying to do... the launchpad is missing."
    return 1
  fi

  # Check for argument
  if [ -z "$1" ]; then
    echo "📂 You need to tell me *what* to update. A folder name would be nice."
    echo "⚠️  Usage: lcu <folder_name>"
    return 1
  fi

  # Check if folder exists
  if [ ! -d "$1" ]; then
    echo "🚪 You knocked, but there’s no door named '$1'."
    return 1
  fi

  local folder="$1"
  ./leetcode.sh --update "$folder"
}


