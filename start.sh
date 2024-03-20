#!/bin/bash
ARGS=""
RUN_ARGS=""
[ "${RADKIT_SERVICE_CLI_DEBUG}" == 1 ] && ARGS="${ARGS} --debug"
[ "${RADKIT_SERVICE_CLI_TRACE}" == 1 ] && ARGS="${ARGS} --trace"
[ "${RADKIT_SERVICE_CLI_TRACEBACKS}" == 1 ] && ARGS="${ARGS} --tracebacks"
[ -n "${RADKIT_SERVICE_CLI_DOMAIN}" ] && ARGS="${ARGS} --domain ${RADKIT_SERVICE_CLI_DOMAIN}"
[ -n "${RADKIT_SERVICE_CLI_SETTINGS_FILE}" ] && ARGS="${ARGS} --settings-file ${RADKIT_SERVICE_CLI_SETTINGS_FILE}"
[ "${RADKIT_SERVICE_CLI_NO_HEADLESS}" != 1 ] && RUN_ARGS="${RUN_ARGS} --headless"
[ "${RADKIT_SERVICE_CLI_RUN_FORCE}" == 1 ] && RUN_ARGS="${RUN_ARGS} --force"
exec radkit-service ${ARGS} run ${RUN_ARGS}