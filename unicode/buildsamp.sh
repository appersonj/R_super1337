#!/usr/bin/env bash

## BEGIN BOILERPLATE  - signature of the sufficiently lazy
mypath=${BASH_SOURCE[0]}
myname=$(basename "$mypath")
mydir=$(dirname  "$mypath")
now=$(date "+%Y%m%d%H%M%S")
## ENDOF BOILERPLATE
dir=unicode_data

function usage {
  if [[ -n "$1" ]] ; then (>&2 echo -n "$1"); fi
(>&2 echo "\

Usage: $myname      - creates an html page of unicode samples from jpg files
assumes files in subdirectories of ${dir}

";)
  echo "   scriptionem meam, document thyself!"
  cat $0 | perl -pe "s/^/   \| /"

  exit 99;
}

if [[ -z "$1" ||  "-h" == "$1" ]] ; then
  usage
fi

sub="$dir/${1}"
if [[ ! -d "$sub" ]] ; then 
  echo $sub is not a subdirectory
  usage
fi

out="${1}.html"
echo "creating $out"
echo '
<!DOCTYPE html><html><head><title>
'$1'Samples
</title>
</head><body>
<h2>
Unicode - '$1' Samples
</h2>
' > "$out"
(cd "$sub"; ls -a *.jpg) | while read x; do echo '<img src="./unicode_data/'"$1"'/'$x'" style="height:30px;"> &nbsp;'$x'<br />'; done >> "$out"
echo '</body>
</html>
' >> "$out"




