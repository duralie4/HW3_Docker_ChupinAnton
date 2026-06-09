#!/usr/bin/env bash

set -e

DATA_DIR="$(pwd)/data"

build_generator() {
  docker build -t csv-generator ./generator
}

run_generator() {
  mkdir -p "$DATA_DIR"
  docker run --rm -v "$DATA_DIR:/data" csv-generator
}

create_local_data() {
  mkdir -p local_data
  python generator/generate.py local_data
}

"$@"