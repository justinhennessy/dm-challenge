#!/bin/bash
git tag -a v$1 -m '$2'
git push -f heroku v$1^{}:$3
