# Quick install method
# Color codes
RED="\033[0;31m"
GREEN="\033[0;32m"
GREY="\033[0;90m"
RESET="\033[0m"

command() {
    local info="$1"
    shift
    printf "${GREY}%s...${RESET}\n" "$info"
    if "$@" > /dev/null 2>&1; then
        printf "${GREEN}%s: SUCCESS${RESET}\n" "$info"
    else
        printf "${RED}%s: FAILED${RESET}\n" "$info" >&2
        exit 1
    fi
}

command "Update and Upgrade packages..." sudo apt update && sudo apt upgrade -y
command "Running apt-fast install..." /bin/bash -c "$(curl -sL https://git.io/vokNn)"
command "Adding alias for apt-fast..." echo "alias apt='apt-fast'" >> ~/.bashrc && echo "alias aptn='apt'" >> ~/.bashrc && source ~/.bashrc
