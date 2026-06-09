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

build_reporter() {
  docker build -t csv-reporter ./reporter
}

run_reporter() {
  mkdir -p "$DATA_DIR"
  docker run --rm -v "$DATA_DIR:/data" csv-reporter
}

structure() {
    find . -not -path '*/.git/*' | sort
}

clear_data() {
    rm -f "$DATA_DIR"/*.csv "$DATA_DIR"/*.html
    echo "data/ cleared"
}

inside_generator() {
    docker run --rm -v "$DATA_DIR:/data" csv-generator ls -la /data
}

inside_reporter() {
    docker run --rm -v "$DATA_DIR:/data" csv-reporter ls -la /data
}

"$@"