#!/usr/bin/env bash


if [ -e ".env-slate" ]; then
    source .env-slate
fi

function fullpaath {
    echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
}

case "$1" in
    "run")
        if [ -z $2 ]
        then
            if [ -z $SLT_SRC ]
            then
                echo "Please enter source and build path"
                echo "slate.sh run <source_path> <build_path>"
                exit;
            fi
        else
            SLT_SRC=$2
        fi
        if [ -z $3 ]
        then
            if [ -z $SLT_BLD ]
            then
                echo "Please enter build path"
                echo "slate.sh run $SLT_SRC <build_path>"
                exit;
            fi
        else
            SLT_BLD=$3
        fi

        echo "Source path: $SLT_SRC"
        echo "Build path: $SLT_BLD"

        SLT_SRC=`fullpaath $SLT_SRC`
        SLT_BLD=`fullpaath $SLT_BLD`

        echo "Quit the server with CONTROL-C."

        docker run -v $SLT_SRC:/usr/src/app/source -v $SLT_BLD:/usr/src/app/build -p 4567:4567 mishamx/slate
    ;;

    "build")
        if [ -z $2 ]
        then
            if [ -z $SLT_SRC ]
            then
                echo "Please enter source and build path"
                echo "slate.sh run <source_path> <build_path>"
                exit;
            fi
        else
            SLT_SRC=$2
        fi
        if [ -z $3 ]
        then
            if [ -z $SLT_BLD ]
            then
                echo "Please enter build path"
                echo "slate.sh run $SLT_SRC <build_path>"
                exit;
            fi
        else
            SLT_BLD=$3
        fi

        echo "Source path: $SLT_SRC"
        echo "Build path: $SLT_BLD"

        SLT_SRC=`fullpaath $SLT_SRC`
        SLT_BLD=`fullpaath $SLT_BLD`

        docker run -v $SLT_SRC:/usr/src/app/source -v $SLT_BLD:/usr/src/app/build -p 4567:4567 mishamx/slate ./deploy.sh
    ;;

    "startup")
        if [ -z $2 ]
        then
            if [ -z $SLT_SRC ]
            then
                echo "Please enter source and build path"
                echo "slate.sh run <source_path> <build_path>"
                exit;
            fi
        else
            SLT_SRC=$2
        fi
        echo "Source path: $SLT_SRC"

        SLT_SRC=`fullpaath $SLT_SRC`
        SLT_BLD=`fullpaath $SLT_BLD`

        docker run -v $SLT_SRC:/usr/src/app/source -p 4567:4567 mishamx/slate ./startup.sh
    ;;

    "env")
        echo "# Source path
SLT_SRC=./source

# Build path
SLT_BLD=./build" > ./.env-slate
    ;;

    *)
        echo "Slate Tool Help:"
        echo "   run <source_path> <build_path>       # or use .env-slate file"
        echo "   build <source_path> <build_path>     # or use .env-slate file"
        echo "   startup <source_path>                # or use .env-slate file"
        echo "   env                                  # Create env file"
    ;;
esac