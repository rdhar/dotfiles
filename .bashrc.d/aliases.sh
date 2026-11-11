# Full system refresh: packages, orphans, cache, flatpaks, firmware
alias up='sudo dnf upgrade --refresh -y && sudo dnf autoremove -y && sudo dnf clean all && flatpak update -y; sudo fwupdmgr refresh --force; sudo fwupdmgr update'

# Open with VS Code Insiders
alias code="code-insiders"

# Jump to ~/c
alias cdc='cd ~/c'
