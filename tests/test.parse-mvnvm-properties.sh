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

testIdentifiesMavenVersionFromStandardMvnvmProperties() {
    local parsedVersion
    parsedVersion="$(../bin/parse-legacy-file test-files/3.8.8-mvnvm-simple/mvnvm.properties)"
    assertEquals "3.8.8" "$parsedVersion" 
}

testIdentifiesMavenVersionFromWhitespaceyMvnvmProperties() {
    local parsedVersion
    parsedVersion="$(../bin/parse-legacy-file test-files/3.6.2-mvnvm-whitespace/mvnvm.properties)"
    assertEquals "3.6.2" "$parsedVersion" 
}

testIdentifiesMavenVersionFromCommentedMvnvmProperties() {
    local parsedVersion
    parsedVersion="$(../bin/parse-legacy-file test-files/3.9.5-mvnvm-comments/mvnvm.properties)"
    assertEquals "3.9.5" "$parsedVersion" 
}

testReturnValue() {
    ../bin/parse-legacy-file test-files/3.8.8-mvnvm-simple/mvnvm.properties >/dev/null 2>&1
    assertTrue "$?"
}

testIgnoresSdkmanrcProperty() {
    local parsedVersion
    parsedVersion="$(../bin/parse-legacy-file test-files/invalid-mvnvm/mvnvm.properties)"
    if [ -n "$parsedVersion" ]; then
        failFound "parsing mvnvm.properties file with sdkmanrc property should give no content" "$parsedVersion"
    fi
}

testInvalidFileStillReturnsZero() {
    ../bin/parse-legacy-file test-files/invalid-mvnvm/mvnvm.properties >/dev/null 2>&1
    assertTrue "invalid mvnvm.properties file should still return 0" "$?"
}

. ./shunit2/shunit2
