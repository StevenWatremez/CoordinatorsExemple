#!/bin/sh
if which swiftgen >/dev/null; then
  SRCDIR="$PROJECT_DIR/$PROJECT_NAME"
  swiftgen storyboards -t swift3 "$SRCDIR" --output "$SRCDIR/Constants/Storyboards.swift"
else
  echo "warning: SwiftGen not installed, download it from https://github.com/AliSoftware/SwiftGen"
fi
