#!/bin/bash

id=$1
rootDir=/c/Work/01.Defect/$id
patchDir=$rootDir/patch
newDir=$rootDir/new
oldDir=$rootDir/old
mkdir -p $rootDir
mkdir -p $patchDir
mkdir -p $newDir
mkdir -p $oldDir

versions=`git log --oneline --grep $1 | awk '{print $1}'` 

allchangedfiles=""
for version in $versions
do
    changedfiles=`git diff --name-only $version $version^`
    allchangedfiles="${allchangedfiles}""${changedfiles} "
done

for file in $allchangedfiles
do
    mkdir -p `dirname $newDir/$file`
    cp $file $newDir/$file
    #mkdir -p `dirname $oldDir/$file`
    #cp $file $oldDir/$file
done
cp -R $newDir/* $oldDir

index=1
for version in $versions
do
    git format-patch --stdout -1 $version > $patchDir/${id}-${index}-${version}.patch
    ((index++))
done

ls $patchDir/*.patch | xargs git apply --directory=$oldDir -R 

cd $rootDir
tar -czf $id.tar.gz new old
