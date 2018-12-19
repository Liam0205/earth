#!/usr/bin/env bash
# ========================================================================
# Copyright 2018-present Liam Huang (Yuuki).
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ========================================================================

begin=$(expr $(cat ./begin) + 86400)  # init: 722232000 $ 1992.11.20
end=$(date '+%s')

list=$(seq $begin 86400 $end)
after=''

for i in $list; do
    date -u --date=@$i "+%Y-%m-%d: Earth has not exploded." >> ./README.md
    echo >> ./README.md

    echo $i > ./begin

    git add ./README.md
    git add ./begin
    git commit --date=$i --message="$(date -u --date=@$i '+%Y-%m-%d')."

    after='git push origin HEAD'
done

eval $after

