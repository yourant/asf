#!/bin/bash
echo '$0: '$0
echo "pwd: "`pwd`
echo "============================="
#echo "scriptPath1: "$(cd `dirname $0`; pwd)
#echo "scriptPath2: "$(pwd)
#echo "scriptPath3: "$(dirname $(readlink -f $0))
echo $(cd $(dirname ${BASH_SOURCE:-$0});pwd)
echo $(dotnet tool install --global dotnet-ef)
echo $(dotnet ef migrations add InitialCreate --project $(dirname ${BASH_SOURCE:-$0});pwd)
echo $(dotnet ef database update --project $(dirname ${BASH_SOURCE:-$0});pwd)