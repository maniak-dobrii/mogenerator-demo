#!/bin/sh
#  mogend.sh
#
#  Created by Jean-Denis Muys on 24/02/11.
#  Modified by Ryan Rounkles on 15/5/11 to use correct model version and to account for spaces in file paths
#  Edited by MD for GPNCard

#TODO: Change this to the name of custom ManagedObject base class (if applicable)
#  If no custom MO class is required, remove the "--base-class $baseClass" parameter from mogenerator call
#baseClass=DOManagedObject

HUMAN_DIR="${PROJECT_DIR}/MogeneratorDemo/CoreData/Entities"
MACHINE_DIR="${PROJECT_DIR}/MogeneratorDemo/CoreData/EntitiesMachine"
INCLUDE_H="${PROJECT_DIR}/MogeneratorDemo/CoreData/ModelIncludes.h"

curVer=`/usr/libexec/PlistBuddy "${INPUT_FILE_PATH}/.xccurrentversion" -c 'print _XCCurrentVersionName'`

echo mogenerator --model \"${INPUT_FILE_PATH}/$curVer\" --machine-dir "$MACHINE_DIR/" --human-dir "$HUMAN_DIR/" --includeh "$INCLUDE_H" --template-var arc=true
mogenerator --model "${INPUT_FILE_PATH}/$curVer" --machine-dir "$MACHINE_DIR/" --human-dir "$HUMAN_DIR/" --includeh "$INCLUDE_H" --template-var arc=true

echo ${DEVELOPER_BIN_DIR}/momc -XD_MOMC_TARGET_VERSION=10.6 \"${INPUT_FILE_PATH}\" \"${TARGET_BUILD_DIR}/${EXECUTABLE_FOLDER_PATH}/${INPUT_FILE_BASE}.momd\"
${DEVELOPER_BIN_DIR}/momc -XD_MOMC_TARGET_VERSION=10.6 "${INPUT_FILE_PATH}" "${TARGET_BUILD_DIR}/${EXECUTABLE_FOLDER_PATH}/${INPUT_FILE_BASE}.momd"