#!/bin/bash
# Alf resource file
plugins=(
  git composer vi-mode
)

function updateDocker(){
    if [ -f "docker/Dockerfile" ]
    then
        _updateDockerfile
    fi
    if [[ -f "docker/app" || -f "docker/systemeventhandler" ]]
    then
        _updateDockerfiles
    fi
}

function _updateDockerfile(){
    # Change FROM baseimage to new and updated one
    sed -i '' "s/FROM.*/FROM odn1-nexus-docker.privatedns.zone\/ps\/java-single-instance:master/" docker/Dockerfile
    # Remove MAINTAINER statement
    sed -i '' "/MAINTAINER.*/d" docker/Dockerfile
    # Change /data to /home/app in the Dockerfile
    sed -i '' "s/\/data/\/home\/app/g" docker/Dockerfile
    # Change service.jar to a more meaningful name; In this case it is the name of the project
    sed -i '' "s/service.jar/$(basename $PWD).jar/g" docker/Dockerfile
    sed -i '' "s/service.jar/$(basename $PWD).jar/g" bin/createArtifacts

    # Get memory limit fields from serviceDefinition.json and store them in new file memorylimit
    jq '.services[].resources.limits.memory' serviceDefinition.json > memorylimit
    if [ $(cat memorylimit) != "null" ]
    then
        # Double numbers in memorylimit
        NUMBER=$(sed 's/[^0-9]*//g' memorylimit)
        sed -i '' "s/$NUMBER/$(($NUMBER * 2))/" memorylimit
        # Write a new serviceDefinition.json with the new memory limits
        MEMORYLIMIT=$(cat memorylimit)
        jq ".services[].resources.limits.memory = $MEMORYLIMIT" serviceDefinition.json > newserviceDefinition.json
        # Remove files no longed needed and replace serviceDefinition with the new serviceDefinition
        rm serviceDefinition.json
        mv newserviceDefinition.json serviceDefinition.json
    fi
    rm memorylimit

}
function _updateDockerfiles(){
    # Change FROM baseimage to new and updated one
    sed -i '' "s/FROM.*/FROM odn1-nexus-docker.privatedns.zone\/ps\/java-single-instance:master/" docker/systemeventhandler
    sed -i '' "s/FROM.*/FROM odn1-nexus-docker.privatedns.zone\/ps\/java-single-instance:master/" docker/app
    # Remove MAINTAINER statement
    sed -i '' "/MAINTAINER.*/d" docker/systemeventhandler
    sed -i '' "/MAINTAINER.*/d" docker/app
    # Change /data to /home/app in the Dockerfile
    sed -i '' "s/\/data/\/home\/app/g" docker/systemeventhandler
    sed -i '' "s/\/data/\/home\/app/g" docker/app
    # Change service.jar to a more meaningful name; In this case it is the name of the project
    sed -i '' "s/service.jar/$(basename $PWD).jar/g" docker/systemeventhandler
    sed -i '' "s/service.jar/$(basename $PWD).jar/g" docker/app
    sed -i '' "s/service.jar/$(basename $PWD).jar/g" bin/createArtifacts

    # Get memory limit fields from serviceDefinition.json and store them in new file memorylimit
    jq '.services[].resources.limits.memory' serviceDefinition.json > memorylimit
    # Double numbers in memorylimit
    NUMBERS=($(sed 's/[^0-9]*//g' memorylimit))
    for number in "${NUMBERS[@]}"
    do
        sed -i '' "s/$number/$(($number * 2))/" memorylimit
    done
    # Write a new serviceDefinition.json with the new memory limits
    MEMORYLIMITS=($(cat memorylimit))
    for limit in "${MEMORYLIMITS[@]}"
    do
        jq ".services[].resources.limits.memory |= $limit" serviceDefinition.json > newserviceDefinition.json
    done

    # Remove files no longed needed and replace serviceDefinition with the new serviceDefinition
    rm serviceDefinition.json
    rm memorylimit
    mv newserviceDefinition.json serviceDefinition.json
}

function updateComment(){
    gitrepos=("DEVTOOL-33-update-dockerfile" "DEVTOOL-33-update-image")
    directories=($(ls -d */))
    for dir in "${directories[@]}"
    do
        isingitrepo=false
        cd $dir
        for gitrepo in "${gitrepos[@]}"
        do
            git checkout $gitrepo
            if [[ "$(git rev-parse --abbrev-ref HEAD)" = "$gitrepo" ]] then
                isingitrepo=true
                echo $gitrepo
            fi
        done
        if $isingitrepo
        then
            innerdirectories=($(ls -d */))
            for innerdir in "${innerdirectories[@]}"
            do
                if [[ "$innerdir" = "docker/" ]]
                then
                    cd docker
                    sed -i '' "s/messagehandler//g" Dockerfile
                    sed -i '' "s/messagehandler//g" app
                    sed -i '' "s/messagehandler//g" systemeventhandler
                    cd ..
                    git commit -a -m "Update comment"
                    git push
                    echo "pushed"
                fi
            done
        fi
                
        cd ..
    done

}

