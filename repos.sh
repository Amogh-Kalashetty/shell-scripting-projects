#!/bin/bash

#############################################################
# Author: Amogh Kalashetty
# Version: 1.0
# Usecase: Lists all the repos of a particular user
# date: 07-12-2023
#############################################################


api_url="https://api.github.com"

USERNAME=$username
TOKEN=$token

REPO_OWNER=$1

#function github_api_get {
#	local endpoint=$1
#	local url="${api_url}/${endpoint}"
#
#	curl -s -u "${USERNAME}:${TOKEN}" "url"
#	#local response=$(curl -s -u "${USERNAME}:${TOKEN}" "$url")
       #echo "$response"

#}

function list_repos {
	#local endpoint="repos"
	echo "List of repos of the user ${REPO_OWNER} are :"
	repos=$(curl -s -u "${USERNAME}:${TOKEN}" "${api_url}/users/${REPO_OWNER}/repos" | jq -r '.[].name')
        if [[ -z "$repos" ]]; then
        	echo "No users with read access found for ${REPO_OWNER}."
   	else
        	echo "List of reposities of the user ${REPO_OWNER}:"
        	echo "$repos"
    	fi  
}


#github_api_get
list_repos


