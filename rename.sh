#!/bin/bash
brew install rename ack
oldName=AutoLayoutApp
NewProject=AutoLayoutApp
find . -name "$oldName*" -print0 | xargs -0 rename --subst-all "$oldName" "$NewProject"
find . -name "$oldName*" -print0 | xargs -0 rename --subst-all "$oldName" "$NewProject"
find . -name "$oldName*"
ack --literal --files-with-matches "$oldName" --print0 | xargs -0 sed -i '' "s/$oldName/$NewProject/g"
ack --literal "$oldName"
