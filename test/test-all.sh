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

any_fail=0

for test_script in test.*; do
    if [ -x "$test_script" ]; then
        ./"$test_script"
        exit_status=$?
        if [ $exit_status -ne 0 ]; then
            any_fail=1
        fi
    fi
done

# Return 0 if all tests pass, 1 if any test fails
exit $any_fail
