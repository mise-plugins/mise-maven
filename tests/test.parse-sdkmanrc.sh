#!/usr/bin/env bash
# Copyright 2024 (c) Andrew Dunn
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

testIdentifiesMavenVersionFromStandardSdkmanRC() {
    local parsedVersion
    parsedVersion="$(../bin/parse-legacy-file test-files/3.7.1-sdkmanrc-simple/.sdkmanrc)"
    assertEquals "$parsedVersion" "3.7.1"
}

testReturnValue() {
    ../bin/parse-legacy-file test-files/3.7.1-sdkmanrc-simple/.sdkmanrc >/dev/null 2>&1
    assertEquals 0 "$?"
}

testIgnoresMvnvmPropertiesProperty() {
    local parsedVersion
    parsedVersion="$(../bin/parse-legacy-file test-files/invalid-sdkmanrc/.sdkmanrc)"
    if [ -n "$parsedVersion" ]; then
        failFound "parsing .sdkmanrc file with mvnvm property should give no content" "$parsedVersion"
    fi
}

testInvalidFileStillReturnsZero() {
    ../bin/parse-legacy-file test-files/invalid-sdkmanrc/.sdkmanrc >/dev/null 2>&1
    assertEquals "invalid .sdkmanrc file should still return 0" 0 "$?"
}

. ./shunit2/shunit2
