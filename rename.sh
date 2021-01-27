git checkout master

function push {
    git push origin $1
}

function rename {
    local old=$1
    local new=$2
    echo "${old} -> ${new}"
    git branch -m ${old} ${new}
    git push origin --delete ${old}
    git push origin ${new}
} 

rename workshop-three-platform-client workshop-three-0-platform-client
rename workshop-three-platform-client-TODO workshop-three-0-platform-client-TODO
rename workshop-three-android-specific workshop-three-1-android-specific
rename workshop-three-android-specific-TODO workshop-three-1-android-specific-TODO

