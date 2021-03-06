#!/bin/bash

WORKSPACE=LibraryTemplate.xcworkspace
BUILD_DIRECTORY="build"
CONFIGURATION=Release

if [[ -z $XCODE_SCHEME ]]; then
    echo "Error: \$XCODE_SCHEME is not set!"
    exit 1
fi

if [[ -z $XCODE_ACTION ]]; then
    echo "Error: \$XCODE_ACTION is not set!"
    exit 1
fi

if [[ -z $XCODE_SDK ]]; then
    echo "Error: \$XCODE_SDK is not set!"
    exit 1
fi

if [[ -z $XCODE_DESTINATION ]]; then
    echo "Error: \$XCODE_DESTINATION is not set!"
    exit 1
fi

set -o pipefail
xcodebuild $XCODE_ACTION \
    -workspace $WORKSPACE \
    -scheme "$XCODE_SCHEME" \
    -sdk "$XCODE_SDK" \
    -destination "$XCODE_DESTINATION" \
    -derivedDataPath "${BUILD_DIRECTORY}" \
    -configuration $CONFIGURATION \
    ENABLE_TESTABILITY=YES \
    GCC_GENERATE_DEBUGGING_SYMBOLS=NO \
    RUN_CLANG_STATIC_ANALYZER=NO \
    ${XCODE_ARGS} | xcpretty
result=$?

if [ "$result" -ne 0 ]; then
    exit $result
fi