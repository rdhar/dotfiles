# Environment and path configuration for development tools and runtimes
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Dev toolchain paths + Podman's Docker-compatible socket
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$HOME/.local/bin:$PATH"
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"

# OpenCode
export PATH=/home/rdhar/.opencode/bin:$PATH

# Bun runtime
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# adb-fastboot platform-tools
if [ -d "$HOME/adb-fastboot/platform-tools" ]; then
	export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi
