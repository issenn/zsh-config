#!/usr/bin/env zsh

local env_file="launchd.frps.env"
[[ -f "${0:a:h}/${env_file}" ]] && source "${0:a:h}/${env_file}"

[[ -z "$(launchctl getenv FRP_VHOST_HTTP_PORT)" ]] && launchctl setenv FRP_VHOST_HTTP_PORT ${FRP_VHOST_HTTP_PORT}
[[ -z "$(launchctl getenv FRP_VHOST_HTTPS_PORT)" ]] && launchctl setenv FRP_VHOST_HTTPS_PORT ${FRP_VHOST_HTTPS_PORT}
[[ -z "$(launchctl getenv FRP_SUBDOMAIN_HOST)" ]] && launchctl setenv FRP_SUBDOMAIN_HOST ${FRP_SUBDOMAIN_HOST}

# launchctl getenv FRP_VHOST_HTTP_PORT
# launchctl getenv FRP_VHOST_HTTPS_PORT
# launchctl getenv FRP_SUBDOMAIN_HOST
