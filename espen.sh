#!/bin/bash
git fetch
git --no-pager diff master...origin/master
git pull
stow zsh