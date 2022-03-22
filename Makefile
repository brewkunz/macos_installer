TARGET_FILE = "bootstrap"
PRJ_MAIN = "${PWD}/main.sh"
PRJ_UTILS = "${PWD}/utils.sh"
PRJ_INSTALLERS = $(shell ls -d ${PWD}/installers/*.sh) # All files from ./installers
PRJ_PREFS = $(shell ls -d ${PWD}/system/*.sh) # All files from ./system
PRJ_APPS = $(shell ls -d ${PWD}/apps/*.sh) # All files from ./apps

export PRJ_INSTALLERS
export PRJ_PREFS
export PRJ_APPS

SHELL := /usr/bin/env bash
all: define_main define_utils define_installers define_prefs define_apps invoke_main

define_main:
	echo -e "#!/usr/bin/env bash\n" > ${TARGET_FILE}
	echo -e "function main() {\n" >> ${TARGET_FILE}
	cat "${PRJ_MAIN}" | sed -e 's/^/  /g' >> ${TARGET_FILE}
	echo -e "\n}\n" >> ${TARGET_FILE}

define_utils:
	cat "${PRJ_UTILS}" >> ${TARGET_FILE}

define_installers: 
	echo -e "function installers {\n" >> ${TARGET_FILE}
	for filename in $${PRJ_INSTALLERS[*]}; do cat $${filename} >> ${TARGET_FILE}; echo >> ${TARGET_FILE}; done
	echo -e "true;\n" >> ${TARGET_FILE}
	echo -e "\n}\n" >> ${TARGET_FILE}

define_prefs:
	echo -e "function prefs {\n" >> ${TARGET_FILE}
	for filename in $${PRJ_PREFS[*]}; do cat $${filename} | sed -e 's/^/  /g' >> ${TARGET_FILE}; echo >> ${TARGET_FILE}; done
	echo -e "true;\n" >> ${TARGET_FILE}
	echo -e "\n}\n" >> ${TARGET_FILE}

define_apps: 
	echo -e "function apps {\n" >> ${TARGET_FILE}
	for filename in $${PRJ_APPS[*]}; do cat $${filename} | sed -e 's/^/  /g' >> ${TARGET_FILE}; echo >> ${TARGET_FILE}; done
	echo -e "true;\n" >> ${TARGET_FILE}
	echo -e "\n}\n" >> ${TARGET_FILE}

invoke_main:
	echo "main \$$@" >> ${TARGET_FILE}
