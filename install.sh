# Quick install method
command() {
    local description="$1"
    shift
    echo "==> $description..."
    if "$@"; then
        echo "✅ $description: SUCCESS"
    else
        echo "❌ $description: FAILED" >&2
        exit 1
    fi
}

command "Update and Upgrade packages..." sudo apt update && sudo apt upgrade -y
command "Running apt-fast install..." /bin/bash -c "$(curl -sL https://git.io/vokNn)"
command "Adding alias for apt-fast..." echo "alias apt='apt-fast'" >> ~/.bashrc && echo "alias aptn='apt'" >> ~/.bashrc && source ~/.bashrc
