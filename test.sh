#!/usr/bin/env bash
set -o errexit

start() { echo "::group::$1"; }
end() { echo "::endgroup::"; }
die() { set +v; echo "$*" 1>&2 ; sleep 1; exit 1; }

CONTINUE_FROM="$1"

if [[ -z $CONTINUE_FROM ]]; then
  start flake8
  flake8 src || die 'Try: autopep8 --in-place --aggressive -r .'
  end flake8

  start mypy
  mypy
  end mypy

  start pytest
  pytest --doctest-modules
  end pytest
fi

for TEST in tests/test-*; do
  if [[ -z $CONTINUE_FROM ]] || [[ $CONTINUE_FROM = $TEST ]]; then
    CONTINUE_FROM=''
    start $TEST
    eval $TEST || die "To continue from here: ./test.sh $TEST"
    end $TEST
  fi
done

if [ "$GITHUB_REF_NAME" != 'main' ]; then
  start changelog
    diff CHANGELOG.md <(curl -s https://raw.githubusercontent.com/hubmapconsortium/ingest-validation-tools/main/CHANGELOG.md) \
      && die 'Update CHANGELOG.md'
  end changelog
fi

env | grep GITHUB