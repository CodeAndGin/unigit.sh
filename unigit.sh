#!/bin/sh

DIR=`pwd`

checkForUnityProject()
{
    if [ -d "$DIR/Assets/" ] && [ -d "$DIR/ProjectSettings/" ]; then
        return 0
    else
        return 1
    fi
}

DEPTH=0
DEPTH_MAX=20
checkForUnityProjectInParents()
{
    if [ -d "$1/Assets" ] && [ -d "$1/ProjectSettings" ]; then
        FINAL_DIR=$1
        return 0
    fi

    DEPTH=$((DEPTH+1))
    if ((DEPTH >= DEPTH_MAX)); then
        return 1
    fi
    
    checkForUnityProjectInParents "$1/.."    
}

main()
{
    if checkForUnityProjectInParents $DIR; then
        if [ -d "$FINAL_DIR/.git" ]; then
            echo "Git already initialised in this directory!"
        else
            cd $FINAL_DIR
            echo "Unity Project found. Initialising Git repo..."
            git init
            echo "Downloading .gitignore..."
            wget -O .gitignore https://gist.githubusercontent.com/linojon/8f92dd5c2e80d31fc23ed72d9d59342f/raw/d70f54e6b575278b983f9e3456feeb78c32434ed/parkerhill-unity.gitignore
            echo "Downloading .gitattributes..."
            wget -O .gitattributes https://gist.githubusercontent.com/linojon/1b7736ba75d5342085f9238c04195bf1/raw/30f93aecd15ff1eca1a316a9fdf2d978fd2c28bd/parkerhill-unity.gitattributes
            echo "Staging all files..."
            git add --all
            echo "Making initial commit..."
            git commit -m "Initial Commit"
            echo "Done!"
        fi
    else
        echo "This is not a Unity Project Directory. Navigate to any folder in a Unity Project and run unigit again"
    fi
}

#checkForUnityProjectInParents $DIR
main
