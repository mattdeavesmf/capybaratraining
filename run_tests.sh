#!/bin/bash
 
#Required Variables possible in future to supply database dettails to reload fixture data
#aREQUIRED=(--dbuser --dbpass --dbname --browser --suite)
aREQUIRED=(--browser --suite)

# Functions
ARRAY=($@)
 
arr_push() {
	PLACEHOLDER=${ARRAY[@]}
	ARRAY=("${ARRAY[@]}" "$1")
}
 
arr_unshift() {
	PLACEHOLDER=${ARRAY[@]}
	unset ARRAY[0]
	ARRAY=("${ARRAY[@]}")
}
 
REQUIREDELEMENTS=${#aREQUIRED[@]}
 
for (( i=0;i<$REQUIREDELEMENTS;i++)); do
	# COUNT is the amount of arguments given after the command
	if [ ${i} -eq 0 ]; then
		COUNT=$#
	fi
 
	for (( j=1;j<=${COUNT};j++)); do
		# Check if current parameter = "--help"
		if [ "${ARRAY[0]}" = "--help" ] ; then
			echo "Required parameters: ${aREQUIRED[*]}"
			exit
		fi
		
		# Check if current requirement matches current parameter
		if [ ${ARRAY[0]} = ${aREQUIRED[${i}]} ] ; then
			# This will be useed later to fetch required parameters which have not been fillend in.
			REQUIREMENTMET[${i}]="TRUE"
			# Put parameters in variables
			PARAMETER=`echo ${ARRAY[0]} | cut -c3-`
			IDENTIFIER=`echo ${ARRAY[0]} | cut -c1-2`
			if [ "${IDENTIFIER}" = "--" ]; then
				# Make a variable with the (stripped) name of the parameter and assign value of parameter to the new variable
				eval ${PARAMETER}=\${ARRAY[1]}
			fi
		fi
		
		# Shuffle array (tried shift, but this didn't work with multiple loops)
		arr_push ${ARRAY[0]}
		arr_unshift
		
	done
	
	# Ask for missing operator
	if [ -e ${REQUIREMENTMET[${i}]} ]; then
		# Ask for input
		echo -n "Input your ${aREQUIRED[${i}]}: "
		# Put input in array
		read REQUIREMENTPROMPT[${i}]
		# Check if prompt was left empty
		if [ -e ${REQUIREMENTPROMPT[${i}]} ]; then
			# Apparently nobody feels like giving some input, can use $0 to rerun script without parameters
			echo "RETRY: no ${aREQUIRED[${i}]} entered"
			exit
		else
			# Put parameters in variables
			PARAMETER=`echo ${aREQUIRED[${i}]} | cut -c3-`
			IDENTIFIER=`echo ${aREQUIRED[${i}]} | cut -c1-2`
			if [ "${IDENTIFIER}" = "--" ]; then
				# Make a variable with the (stripped) name of the parameter and assign value of parameter to the new variable
				eval ${PARAMETER}=\${REQUIREMENTPROMPT[${i}]}
			fi
		fi
	fi
done 

rake $browser[$suite]