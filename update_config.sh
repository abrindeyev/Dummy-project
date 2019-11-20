#!/usr/bin/env bash

branch="${GITHUB_REF#refs/heads/}"
prefix="${branch^^}" # uppercase

function kv() {
  local source="${prefix}_ENV"
  if [[ $source ]]; then
    echo "${!source}" | jq -r ".$1"
  else
    exit 1
  fi
}

jq '.app_id="'$(kv appId)'"' ./config.json
