#!/bin/bash

# Check if correct number of arguments is provided
if [ "$#" -ne 3 ]; then
	  echo "Usage: $0 <mech-quirk> <mech-affinity> <mech-variant>"
	    exit 1
fi

if [ ! -f "$data_file" ]; then
	  echo "Data file not found: $data_file"
	    exit 1
fi

# Assign positional params to vars
QUIRK=$1
AFFINITY=$2
MECH=$3

# Create the output file from template
echo "creating $MECH.wiki..."
echo ""
cp mech.tmpl $MECH.wiki

# Generate mech info
echo "overwriting template..."
echo ""

sed -i "s/YY/$QUIRK/g" $MECH.wiki
sed -i "s/ZZ/$AFFINITY/g" $MECH.wiki
sed -i "s/MEC-00/$MECH/g" $MECH.wiki

# Cat out the file for copy & paste
echo "printing entry..."
cat $MECH.wiki

echo ""
echo ""
echo ""