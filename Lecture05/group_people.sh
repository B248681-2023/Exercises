#!/bin/bash

IFS=$'\t'

if [[ ! -f $1 ]]; then
    echo "Please provide a valid file."
    exit 1
fi;


current_country="";
people_in_country="";
sort -t$'\t' -k7,7 -k3,3 < $1 | while read -r field_1 field_2 field_3 field_4 field_5 field_6 field_7;
do
	if [[ ! -z  ${field_1} ]]; then
		if [[ -z $current_country ]]; then
			current_country=${field_7}
		fi
		if [[ ${field_7} == ${current_country} ]]; then
			people_in_country=$'${people_in_country} $'\n' ${field_1}, ${field_2}, ${field_3}, ${field_4}, ${field_5}, ${field_6}, ${field_7}' 
		else
			echo "${people_in_country}" > "${current_country}.txt"
		       current_country=${field_7};
	       people_in_country="${field_1}, ${field_2}, ${field_3}, ${field_4}, ${field_5}, ${field_6}, ${field_7}"
		fi
echo "${current_country}"
	fi
done 

echo "${people_in_country}" > "${current_country}.txt";
unset IFS
