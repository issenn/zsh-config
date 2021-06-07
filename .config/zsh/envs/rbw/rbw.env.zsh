#!/usr/bin/env zsh


local env_file=".config.secret.env"
[[ -f "${0:a:h}/${env_file}" ]] && source "${0:a:h}/${env_file}"

# local RBW_LOCK_TIMEOUT=3600
local RBW_PINENTRY="pinentry-mac"

[[ -z "${RBW_EMAIL}" ]] && export RBW_EMAIL="${RBW_EMAIL}"
[[ -z "${RBW_BASE_URL}" ]] && export RBW_BASE_URL="${RBW_BASE_URL}"
[[ -z "${RBW_IDENTITY_URL}" ]] && export RBW_IDENTITY_URL="${RBW_IDENTITY_URL}"
[[ -z "${RBW_LOCK_TIMEOUT}" ]] && export RBW_LOCK_TIMEOUT="${RBW_LOCK_TIMEOUT}"
[[ -z "${RBW_PINENTRY}" ]] && export RBW_PINENTRY="${RBW_PINENTRY}"

unset env_file
