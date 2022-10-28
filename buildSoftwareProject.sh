# build the software by setting the environment variables required by the make file
# then run make to create and build the project
# Set environment variables 
export WORKSPACE="$(pwd)/software"
echo "WORKSPACE set to : $WORKSPACE"
files=($(pwd)/hardware/export/*.xsa) # We need the outer parenthesis here to grab the file
filepath=${files[0]} # get the first xsa file found
filename=$(basename -- "$filepath") # extract just the file name from the file path for xsa file
filenameNoExtension="${filename%.*}"
echo "First xsa file found in hardware export is ${filepath}"
echo "File name is ${filename}"
echo "File name with no extension ${filenameNoExtension}"
export plat_name=${filenameNoExtension}
export XSA=${filepath}
export domain_name_apu=standalone_ps7_cortexa9_0
export app_name_apu="$1"
export app_name_rpu="$1"
echo "app_name_apu set to ${app_name_apu}"

# Make sure user passes in an app name or else just exit and do not run make command
if [ -z "$1" ]
  then
    echo "Please pass in a application name. For example ./buildSoftwareProject my-app-name"
    exit 1
else
    ( cd ./software && make init )
fi



