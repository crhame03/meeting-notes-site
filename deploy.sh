#!/bin/sh
# Publishes the Meeting Notes homepage + privacy policy to GitHub Pages.
# Run once, from this directory. Everything here is already committed.
set -e

gh repo create meeting-notes-site --public --source=. --push \
  --description "Homepage and privacy policy for the Meeting Notes iPhone app"

gh api -X POST /repos/crhame03/meeting-notes-site/pages \
  -f 'source[branch]=main' -f 'source[path]=/'

echo
echo "Done. Now add this ONE record in Namecheap (Advanced DNS for rhameai.com):"
echo
echo "    Type:  CNAME Record"
echo "    Host:  meetingnotes"
echo "    Value: crhame03.github.io."
echo "    TTL:   Automatic"
echo
echo "Do NOT change the nameservers and do NOT touch the MX records."
