#! /usr/bin/env bash
set -ex

scriptPath=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

function main() {
  gccVersion=${1:-7.2.0}

  docker build -t "djfdyuruiry/djgpp:gcc-${gccVersion}" \
    --build-arg "GCC_VERSION=${gccVersion}" \
    "${scriptPath}"
}

main "$@"
