# Helper for using CLI with staging environment
balena_staging () {
	BALENARC_BALENA_URL=balena-staging.com \
	BALENARC_DATA_DIRECTORY=~/.balena/staging \
		balena $@
}
