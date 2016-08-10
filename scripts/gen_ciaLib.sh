
	# Saving IFS
	OIFS=$IFS

	# Save working directory
	schemawd=$(pwd)/../schemas/json-schema
	xsdwd=$(pwd)/../schemas/xsd

	# Reading current CIALib and writing it to a new file
	cd ../schemas/json-schema

	# Save working directory
	schemawd=$(pwd)

	#New temporary cialib schema
	newCialib="$schemawd/newLibFile.json"

	#Remove if temporary newCialib already exists
	rm -f $newCialib

	# Generate newLibFile.json from scratch
	# First and second line
	entry="{\n\t\"\$schema\": \"http://json-schema.org/draft-04/schema#\","
	echo -e $entry >>"$newCialib"
	# Third and Fourth line
	entry="\t\"title\": \"cialib\",\n\t\"id\": \"cialib\","
	echo -e $entry >>"$newCialib"
	# Fifth and Sixth line
	entry="\t\"description\": \"CIALib auto generation.\",\n\t\"type\": \"object\",\n\t\"properties\": {"
	echo -e $entry >>"$newCialib"

	cd ../../scripts

	# Read schemas being used in endpoints
	cd ../endpoints

	# Find number of schemas used used in endpoints
	numOfSchemas=$(grep "\$ref" *.json | cut -d\" -f4 | cut -d\/ -f3 | sort | uniq | wc -l)

	#Loop through all schemas found in endpoints to add in new cialib
	for Schema in $(grep "\$ref" *.json | cut -d\" -f4 | cut -d\/ -f3 | sort | uniq)
	do
		# List of schemas to write in newCialib
        	if [ ! -e $Schema ] && [ $numOfSchemas != 1 ]; then
			entry="\t\t\"$Schema\": {\"\$ref\": \"$Schema.json#\"},"
			numOfSchemas=$(( numOfSchemas - 1 ))
		else
			# Last schema to write in newCialib
			entry="\t\t\"$Schema\": {\"\$ref\": \"$Schema.json#\"}"
        	fi

		#Write all the schemas found in new cialib
		echo -e $entry >>"$newCialib"
	done

	#Last braces to complete json file.
	echo -e "\t}," >>"$newCialib"

	cd ../scripts


	# Reading Swagger file and adding definitions section in file to generate xsd
	swaggerFile="$(pwd)/../swagger-file.json"

	found=0

	while IFS= read -r line
	do
        	# Write lines from swagger file to xsd preparation file
        	if [ $found != 0 ]; then
                	echo "$line" >>"$newCialib"
        	fi

        	# Once we find line with properties in cialib file we stop reading
        	if [[ $line == *"definitions\":"* ]] && [ $found != 1 ]; then
                	echo "$line" >>"$newCialib"
                	found=1
        	fi

	done <"$swaggerFile"

	# Adding ending '}' to close the schema
	echo "}" >>"$newCialib"



	# Temporary file name which receieves the response of converter service call.
	tempLib="$xsdwd/tempLib.xsd"

	# Converter webservice call to convert JSON to XSD. This will save response in $tempLib
	curl -i -H "Content-type: application/json; charset=utf-8" -H "dataType: xml" --data-binary "@$newCialib" -X POST http://cl-convert.herokuapp.com/convert --output "$tempLib"

	# Remove temporary $newCialib
	rm -f $newCialib

	# CIALib file
	ciaFilename="$xsdwd/CIALib.xsd"

	#Remove if temporary newCialib already exists
	rm -f $ciaFilename

	found=0
	# Version of the XSD
	v2="v2"

	# Read converted xsd and remove the unwanted lines from that xsd
	while IFS= read -r line
	do
        	# Write lines from temporary response file to CIALib.xsd file
        	if [ $found != 0 ]; then
                	echo -e "$line" >>"$ciaFilename"
        	fi

        	# Once we find line with xml in temporary generated file we start writing
        	if [[ $line == *"xml version="* ]] && [ $found != 1 ]; then
                	# Remove xml version section
			firstLine=$(echo -e "$line" | cut -d\< -f3)
                	entry="<$firstLine"
			
			# Replace v1 to v2.0
			entry=$(echo -e "$entry" | sed -e "s/v1/$v2/g")
                	echo -e $entry >>"$ciaFilename"
                	found=1
        	fi

	done <"$tempLib"

	# Write a message if xml is not found or converter executed with error
	if [ $found != 1 ]; then
        	echo -e "Conversion ends with some problem. Please check tempLib.xsd for details." >>"$ciaFilename"
	else
        	# Remove temporary file.
        	rm -f $tempLib
	fi


	# Restoring old IFS
	IFS=$OIFS

	# Adding newly generated cialib into repository
	git config --global user.email "vpramod.kumar@gmail.com"
	git config --global user.name "Pramod Kumar"
	git add -f $ciaFilename
	git commit -m "Pushed CIALib.xsd file."
	git push origin master

