#!/bin/bash


TOKEN=$token
name=$1

function create_repo {
	echo  "Please enter the description for your repo ${name}"
	read description
	curl -L \
  	-X POST \
  	-H "Accept: application/vnd.github+json" \
  	-H "Authorization: Bearer ${TOKEN}" \
  	-H "X-GitHub-Api-Version: 2022-11-28" \
 	https://api.github.com/user/repos \
 	-d '{"name":"'${name}'","description":"'${description}'","homepage":"https://github.com","private":false,"is_template":true}'

	echo "Repo: ${name} is created for the user"
}

create_repo
