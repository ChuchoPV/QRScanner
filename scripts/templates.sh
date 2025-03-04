customTemplatesPath=$HOME/"Library/Developer/Xcode/Templates/Custom Templates/"
projectTemplatesPath="../templates/"

if [ -d "$customTemplatesPath" ]
then
   echo "Removing old templates"
   rm -Rf "$customTemplatesPath"
fi

echo "Creating directory"
mkdir -p "$customTemplatesPath"
cp -R $projectTemplatesPath "$customTemplatesPath"

echo "Templates installed"
