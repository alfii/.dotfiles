# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

source $ZSH/oh-my-zsh.sh
if [ -f ~/.dotfiles/$USER.sh ]; then
    source ~/.dotfiles/$USER.sh
fi


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# unalias -m '*'
unalias -m 'gr'
unalias -m 'gl'
unalias -m 'glp'
unalias -m 'gra'
unalias -m 'gaa'
unalias -m 'gp'
unalias -m 'gcmsg'
unalias -m 'gcp'
unalias -m 'gfc'
unalias -m 'follow'
unalias -m 'gcam'
unalias -m 'gai'
#interesting
#git reset --hard ORIG_HEAD # reset, rebase and merge all save your original HEAD pointer into ORIG_HEAD

########################
# Shell specific
########################
alias reload='source ~/.zshrc'
alias zshrc='vim ~/.dotfiles/zsh/.zshrc'

########################
# Navigation shortcuts
########################
alias cdc='cd ~/code' #quickly go to the folder where you keeo your code
alias cdp='cd ~/code/docker-env/checkout/portal'

########################
# Internal functions
########################
function _checkForFail() {
    if [ ! $? -eq 0 ]; then
        exit 1
    fi
}

########################
# Git
########################

# Aliases #
alias gs='git status'
alias gf='git fetch'
alias ga='git add'
alias ga.='git add .'
alias gc='git checkout'
alias gc.='git checkout .'
alias gb='git --no-pager branch'
alias gcb='git checkout -b'
alias gm='git merge'
alias gd='git --no-pager diff' # show whole diff in terminal
alias gcamm='git add -A && git commit -m' # commits all files, staged, unstaged and untracked. just apply the commit message
alias gcamc='git add -A && git commit -m "cleaning"'
alias gcm='git commit -m'
alias gcf='git commit --fixup $(git log --pretty=oneline | fzf | cut -d " " -f 1)'
alias gps='git push'
alias gpl='git pull'
alias stash='git stash'
alias apply='git stash apply'
alias amend='git commit --amend'
alias amenda='git add . && git commit --amend --no-edit'
alias mstr='git checkout master'
alias dev='git checkout develop'
alias hard='git reset --hard'
alias gr='git rebase'
alias grm='git pull --rebase origin master'
alias grd='git pull --rebase origin develop'
alias grr='git pull --rebase origin `git rev-parse --abbrev-ref HEAD`'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias dry='git remote prune origin --dry-run && echo "would delete these local branches:" && git branch --merged | egrep -v "(^\*|master|development|develop|release*)"'
alias prune='git checkout develop && git pull && git remote prune origin && git branch --merged | egrep -v "(^\*|master|development|develop|release*)" | xargs git branch -d'
alias copy='git branch -f copy && echo "Created branch copy"'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias parent='git show-branch -a | grep "\*" | grep -v `git rev-parse --abbrev-ref HEAD` | head -n1 | sed "s/.*\[\(.*\)\].*/\1/" | sed "s/[\^~].*//"'
alias glg='git --no-pager log -i --grep '
alias gci='gc $(gb | fzf)'
alias branch='git rev-parse --abbrev-ref HEAD'

# Functions #
# commit all files in staging area and prepend commit message with issue number from branch
function gcam(){
    : "${1?Missing message}"
    message=$1
    branch=$(git rev-parse --abbrev-ref HEAD)
    substring=$(echo $branch | cut -d'-' -f1-2)
    git add -A && git commit -m "$substring $message"
}
# Print git log pretty oneline
function gl(){
    amount=${1:-30}
    git --no-pager -c color.ui=always log --pretty=format:'%C(yellow)%H|%C(magenta)%ad|%Cblue%an|%Cgreen%d %Creset%s' --date=format:'%Y-%m-%d %H:%M:%S' -$amount| column -ts'|'
}
# Print git log pretty oneline short commit
function gls(){
    amount=${1:-30}
    git --no-pager -c color.ui=always log --pretty=format:'%C(yellow)%h|%C(magenta)%ad|%Cblue%an|%Cgreen%d %Creset%s' --date=short -$amount| column -ts'|'
}
# Print git log pretty oneline affected files
function glf(){
    amount=${1:-10}
    git --no-pager -c color.ui=always log --pretty=format:'%C(yellow)%H | %C(magenta)%ad | %Cblue%an | %Cgreen%d %Creset%s' --date=format:'%Y-%m-%d %H:%M:%S' --stat -$amount
}
# Print git log pretty oneline short commit affected files
function glfs(){
    amount=${1:-10}
    git --no-pager -c color.ui=always log --pretty=format:'%C(yellow)%h | %C(magenta)%ad | %Cblue%an | %Cgreen%d %Creset%s' --date=format:'%Y-%m-%d %H:%M:%S' --stat -$amount
}
# Show latest or given commit
function show(){
    commit=${1:-}
    if [ -z "$commit" ]
    then
          git --no-pager show
    else
        if [ "${#commit}" -gt 8 ]
        then
        git --no-pager diff $commit^!
      else
        git --no-pager diff @~$commit^!
      fi
    fi
}
# Show interactive
function showi(){
    show $(git log --pretty=oneline | fzf | cut -d " " -f 1)
}
# Show files in latest or given commit
function showf(){
    commit=${1:-HEAD}
    git diff-tree --no-commit-id --name-only -r $commit
}
# Add files interactively
function gai(){
    git add $(git status --porcelain | fzf -m | awk '{ print $2 }')
}
# Commit files interactively
function gaic(){
    git add $(git status --porcelain | fzf -m | awk '{ print $2 }')
    git commit
}
# Show what commits a file was in, defaults to ten commits
function follow(){
    : "${1?Missing file}"
    amount=${2:-10}
    file=$1
    git --no-pager log -$amount --follow $file
}
# Show what commits a file was in, defaults to ten commits
function followi(){
    amount=${1:-10}
    file=$(git status --porcelain | fzf | awk '{ print $2 }')
    git --no-pager log -$amount --follow $file
}
# Show difference in commits between HEAD and given commit
function gdc(){
    commit=${1:-master}
    git -c color.ui=always log --pretty=format:'%C(yellow)%h|%C(magenta)%ad|%Cblue%an|%Cgreen%d %Creset%s' --date=format:'%Y-%m-%d %H:%M:%S' --abbrev-commit $commit..HEAD | column -ts'|'      
}
# Rebase on commit, handy for amending earlier commits or to squash commits
# Argument: Base to rebase on top of
function gri(){
    commit=${1:-}
    if [ -z "$commit" ]
    then
        git rebase -i $(git log --pretty=oneline | fzf | cut -d " " -f 1)
    else
        git rebase -i $commit
    fi
}
# Checkout first branch that has the given number in it by grepping
function gcg(){
    : "${1?Missing issue number}"
    issue=$1
    git checkout $(git branch | grep $issue | sed -n 1p)
}
# Checkout first remote branch that has the given number in it by grepping
function gfc(){
    : "${1?Missing issue number}"
    issue=$1
    git fetch
    git checkout $(git branch -r | grep $issue | sed -n 1p | cut -c 10-)
}
# Soft reset of commits
function soft(){
    number=${1:-1}
    git reset --soft head~$number && git reset
}
# Create pull request
function gpr(){
    branch=$(git rev-parse --abbrev-ref HEAD)
    remote=$(git config --get remote.origin.url | cut -c 5- | tr : / | sed 's/.\{4\}$//')
    if [[ $remote = *"bitbucket"* ]];
    then
        open "https://www.$remote/pull-requests/new?source=$branch&t=1"
    else
        open "https://www.$remote/compare/master...$branch"
    fi
}
# Delete a branch on origin (bitbucket) and push the local version
# Workaraound when force push is not allowd
function gps-f(){
    branch=$(git rev-parse --abbrev-ref HEAD)
    git push -d origin $branch
    git push
}
# Takes staged files and adds them to the desired commit
# Argument is some text in the commit message you want the changes to be added to
function grf(){
    commit=${1:-}
    if [ -z "$commit" ]
    then
        commit=$(git log --pretty=oneline | fzf | cut -d " " -f 1)
    fi
    
    git commit --fixup $commit
    echo "Attempting to rebase and fixup into commit $commit"
    git --no-pager log -n 1 --pretty=format:%s $commit
    GIT_SEQUENCE_EDITOR=true git rebase -i --autosquash $commit^
}

###########################
# Platfrom
###########################
alias vagup='vagrant up'
alias vags='vagrant gatling-rsync-auto'
alias pespa='psenv start platformcore app'
alias vsc='vagrant ssh -c'
alias vdpsa='vagrant ssh -c "docker ps -a"'
alias vdrm='vagrant ssh -c "docker rm $(docker ps -a -q)"'
alias vdrmi='vagrant ssh -c "docker rmi $(docker images -q -f dangling=true)"'

###########################
# Maven
###########################
alias mci='mvn clean install'
alias mcit='mvn clean install -DskipTests'
alias mcc='mvn clean compile'

############################
# Docker
############################
# Aliases #
alias di='docker images'
alias dpsa='docker ps -a'
alias drm='docker rm $(docker ps -a -q)'
alias drmi='docker rmi $(docker images -q -f dangling=true)'
alias drma='drmi && drm'

# Functions #
# Print env variables of the latest docker container
function denv(){
    id=$(docker ps --format '{{.ID}}')
    docker inspect --format '{{ index (index .Config.Env) }}' $id
}
# Go into the latest docker container
function dex(){
    id=$(docker ps --format '{{.ID}}')
    docker exec -it $id bash
}
# Docker build with name and image
function db(){
    : "${1?Missing name}"
    cd docker
    name=$1
    echo "docker build -t $name . "
    docker build -t $name . 
}
# Docker run with image
function dr(){
    : "${1?Missing image}"
    port=${2:-80}
    image=$1
    echo "docker run -it --env-file env-file -p 8080:$port $image"
    docker run -it --env-file env-file -p 8080:$port $image
}

############################
# Building for java projects
############################

# Aliases
alias bca='bin/createArtifacts'
alias abi='artifacts/buildImages'

# createArtifacts, buildImages and docker run
function run(){
    port=${1:-8080}
    echo '*********************'
    echo '** createArtifacts **'
    echo '*********************'
    bin/createArtifacts
    _checkForFail
    echo '*****************'
    echo '** buildImages **'
    echo '*****************'
    artifacts/buildImages
    _checkForFail
    imageName=$(grep -o '"imageName": "[^"]*' serviceDefinition.json | grep -o '[^"]*$')
    echo '*********************************************'
    echo "** run dockerimage $imageName on port $port **"
    echo '*********************************************'
    echo "docker run -it --env-file env-file -p $port:8080 $imageName"
    docker run -it --env-file env-file -p $port:8080 $imageName
}

##########################
# Print functions
##########################
function myfunctions(){
    echo '##################'
    echo '## Docker related'
    echo '##################'
    echo 'db(name) - docker build image when in repo root'
    echo 'run - create artifacs, build images and run in container on port 8080'
    echo 'dr(image, [port]) - docker run image, optianl port, default is 8080'
    echo 'denv - Print env variables of the latest docker container'
    echo 'dex - Go into the latest docker container'
    echo '################'
    echo '## Git related'
    echo '################'
    echo 'glp([number]) - git log pretty oneline format, defaults to latest 30'
    echo 'gcg(issue) - Checkout first branch that has the given issue number in it by grepping'
    echo 'show([hash]|[commit]) - Show contents of latest or given commit hash or commit number back from head, satrting from 0 and disregarding merge commits... Better to just use the hash'
    echo 'gri(commit) - Rebase on commit, handy for amending earlier commits or to squash commits'
    echo 'soft([number]) - Unstage files and remove latest, or given number of commits. Work is not lost, only unstaged'
}

############################
# Other
############################
alias kraken='open -na "GitKraken" --args -p $(pwd)'


# Functions
# Remove files selected from git status
function rmi(){
    toBeRemoved=$(git status --porcelain | fzf -m | awk '{ print $2 }')
    echo "Removing $toBeRemoved"
    rm $toBeRemoved
}

############################
# Plugins
############################
autoload -U promptinit; promptinit
prompt pure

# syntax higlighting https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=($HOME/.zsh-completions $fpath)
autoload -U compinit
compinit

