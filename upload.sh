#!/bin/bash
git stash
git pull origin master --tags
git stash pop

VersionString=`grep -E 's.version.*=' BPod.podspec`
VersionNumber=`tr -cd 0-9 <<<"$VersionString"`
#NewVersionNumber=$(($VersionNumber + 2))
NewVersionNumber=0.1.2
LineNumber=`grep -nE 's.version.*=' BaseBusiness.podspec | cut -d : -f1`
sed -i "" "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" BPod.podspec

echo "current version is ${VersionNumber}, new version is ${NewVersionNumber}"


git commit -am ${NewVersionNumber}
git tag ${NewVersionNumber}
git push origin master --tags
pod trunk push ../BPod.podspec --verbose --use-libraries --allow-warnings --use-modular-headers
