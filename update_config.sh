#!/usr/bin/env bash

branch="${GITHUB_REF#refs/heads/}"
prefix="${brach^^}" # uppercase

function kv() {
  local source="$prefix_ENV"
  if [[ $source ]]; then
    echo "${!$source}" | jq -r ".$1"
  else
    exit 1
  fi
}

jq ".app_id=$(kv appId)" ./config.json
