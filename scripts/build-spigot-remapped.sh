#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILDTOOLS_DIR="${BUILDTOOLS_DIR:-$ROOT_DIR/.buildtools}"
BUILDTOOLS_JAR="$BUILDTOOLS_DIR/BuildTools.jar"
VERSIONS=(
  "1.21.4"
  "1.21.5"
  "1.21.8"
  "1.21.10"
)

mkdir -p "$BUILDTOOLS_DIR"

if [[ ! -f "$BUILDTOOLS_JAR" ]]; then
  echo "Downloading BuildTools.jar ..."
  curl -fL -o "$BUILDTOOLS_JAR" \
    "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
fi

for version in "${VERSIONS[@]}"; do
  echo "Running BuildTools for Spigot ${version}"
  java -jar "$BUILDTOOLS_JAR" --rev "$version" --compile SPIGOT

done

echo "Running Maven build with remapped profile"
cd "$ROOT_DIR"
mvn -U clean install -Pspigot-remapped

echo "Running Maven build with optional integrations"
mvn -U clean install -Pspigot-remapped,optional-integrations
