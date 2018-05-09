#!/bin/bash
git fetch
git diff master...origin/master
git pull
stow zsh