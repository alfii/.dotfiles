#Espen resource file

#*************************************************************************************************************
# PatientSky 
#*************************************************************************************************************
# Paths
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH
export PATH=/Library/apache-maven-3.5.0/bin:$HOME/bin:/usr/local/bin:$PATH
export cache=memorycache
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export hemAdapterEventUrl=http://localhost:58364

# Plugins
plugins=(git)

# Aliases

alias hem='cd ~/code/health-economy-module'
alias listener='cd ~/code/health-economy-module && sh startListener.sh'
alias hemt='cd ~/code/hem-test'
alias grdhem='git pull --rebase origin development'
alias psapp='ps/hem-app'
alias psada='ps/hem-adapter'
alias pslis='ps/hem-listener'

alias rmr='rm -rv resources && rm -v resources.tar.bz2'
alias mvr='mv -v ../../Downloads/resources.tar.bz2 .'

# alias msapp='msbuild HealthEconomyModule/HealthEconomyModule.csproj /p:Configuration=Staging /p:OutputPath=../target/app'
alias msapp='msbuild HealthEconomyModule/25_CoreWeb.csproj /p:Configuration=Release /p:OutputPath=../target/app'
# alias msada='MSBuild HemAdapter.Worker/HemAdapter.Worker.csproj /p:Configuration=Staging /p:OutputPath=../target/adapter'
alias msada='msbuild HemAdapter.Worker/41_Worker.csproj /p:Configuration=Release /p:OutputPath=../target/adapter'
alias mster='msbuild MelinTerminalAPI/MelinTerminalAPI.sln /p:Configuration=Release /p:OutputPath=../target/app'
alias mster2='msbuild MelinTerminalAPI/MelinTerminalAPI/MelinTerminalAPI/MelinTerminalAPI.csproj /p:Configuration=Release /p:OutputPath=../target/app'

alias nugetall='nuget restore && cd MelinTerminalAPI && nuget restore && cd ..'

alias appconf='subl HealthEconomyModule/Web.config'
alias worconf='subl HemAdapter.Worker/app.config'
alias adaconf='subl HemAdapter/HemAdapter/Web.config'

alias fly='cd code/health-economy-module/flyway-4.0.1'

# Functions

#################################
# Run app from resources.tar.bz2
#################################
function resources(){
	echo 'removing resources/ and resources.tar.bz2'
	rmr
	echo 'moving new resources.tar.bz2 from downloads'
	mvr
	tar xvjf resources.tar.bz2
	cp -v Web.Config resources/._target_app/Web.config
	echo 'Building images:'
	sh buildImages
	dr ps/hem-app
}

#################################
# Run app from resources.tar.bz2
#################################
function resourcesLocal(){
	echo 'removing resources/ and resources.tar.bz2'
	rmr
	echo 'moving new resources.tar.bz2 from downloads'
	mv -v ../health-economy-module/artifacts/resources.tar.bz2  .
	tar xvjf resources.tar.bz2
	echo 'Building images:'
	sh buildImages
	dr ps/hem-terminal-app
}

##################################################
# rebase some old branches to keep them up to date
##################################################
function rebaseold(){
	git checkout HEM-125-improve-getuserinfo-performance
	git rebase development
	git checkout HEM-489-flow-for-patient-loss
	git rebase development
	git checkout hem125-commented-out-methods-that-does-all-calls
	git rebase development
	git checkout shit-405-soap
	git rebase development
}

#*************************************************************************************************************
# LP 
#*************************************************************************************************************

# Aliases
unalias -m 'lp'

alias lp='cd ~/code/lp-app'
alias lpr='cd ~/code/lp-app && npm run dev'

#navigate to /site and
#    cmd> meteor mongo
# 
#db.users.findOne({'profile.name': "Espen Kirkesæther Brun"})
#_id="pdDj2hGHu5Nazmf4H"
#db.users.findOne({_id})
# 
#db.users.update({_id},{$unset: {tour: true}})