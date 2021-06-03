#!/usr/bin/env zsh

local env_file="launchd.0.frpc.env"
[[ -f "${0:a:h}/${env_file}" ]] && source "${0:a:h}/${env_file}"

[[ -z "$(launchctl getenv FRP_SERVER_ADDR)" ]] && launchctl setenv FRP_SERVER_ADDR ${FRP_SERVER_ADDR}
[[ -z "$(launchctl getenv FRP_SERVER_PORT)" ]] && launchctl setenv FRP_SERVER_PORT ${FRP_SERVER_PORT}
[[ -z "$(launchctl getenv FRP_USER)" ]] && launchctl setenv FRP_USER ${FRP_USER:-issenn}
[[ -z "$(launchctl getenv FRP_TOKEN)" ]] && launchctl setenv FRP_TOKEN ${FRP_TOKEN}
[[ -z "$(launchctl getenv FRP_CUSTOM_DOMAINS)" ]] && launchctl setenv FRP_CUSTOM_DOMAINS ${FRP_CUSTOM_DOMAINS}
[[ -z "$(launchctl getenv FRP_SSH_REMOTE_PORT)" ]] && launchctl setenv FRP_SSH_REMOTE_PORT ${FRP_SSH_REMOTE_PORT}

# launchctl getenv FRP_SERVER_ADDR
# launchctl getenv FRP_SERVER_PORT
# launchctl getenv FRP_USER
# launchctl getenv FRP_TOKEN
# launchctl getenv FRP_CUSTOM_DOMAINS
# launchctl getenv FRP_SSH_REMOTE_PORT
