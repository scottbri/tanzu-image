#!/bin/bash

HOMEDIR="/home/ubuntu/tanzu-image/tanzu" # or ${HOME}
BINDIR="${HOMEDIR}/bin"
SSHDIR="${HOMEDIR}/.ssh"
TEMPDIR="${HOMEDIR}/temp-pcftools-installer"
GITUSER="Scott Brightwell"
GITEMAIL="scott@brightwell.org"

INSTALL_BINARIES=true

SETUP_GIT=true
SETUP_SSH=false
SETUP_HOSTS=false
SETUP_BASH=false


function setup-git {
	git config --global user.name "${GITUSER}"
	git config --global user.email "${GITEMAIL}"
}

function setup-ssh {
	cp creds/* ${SSHDIR}
	chmod 600 ${SSHDIR}/*
}

function setup-hosts {
	echo "192.168.130.129	supervisor" >> /etc/hosts
}

function do-checks {
	if [[ ! "${INSTALL_BINARIES}" || (${INSTALL_BINARIES} = false) ]] ; then
		echo "INSTALL_BINARIES not set to true.  Exiting"
		exit 1
	fi
	if [[ ! "${BINDIR}" || ! -d "${BINDIR}" ]]; then
		echo "BINDIR "$BINDIR" does not exist.  Exiting"
		exit 1
	fi

	TEMPDIR=`mktemp -d`
	# check if tmp dir was created
	if [[ ! "$TEMPDIR" || ! -d "$TEMPDIR" ]]; then
	  echo "Could not create temp dir"
	  exit 1
	fi
}

function move-into-bin {
	if [[ ! "${FILENAME}" || ! -f "${FILENAME}" ]]; then
		echo "FILENAME ${TEMPDIR}/${FILENAME} does not exist.  Exiting"
		exit 1
	fi

	mv ${FILENAME} ${BINDIR}/
	chmod +x ${BINDIR}/${FILENAME}
	rm ${BINDIR}/${BINARY} 2>/dev/null

	cd ${BINDIR};  ln -s ${FILENAME} ${BINARY}

	cd "$WORKDIR"; rm -r "$TEMPDIR" 2>/dev/null
}
