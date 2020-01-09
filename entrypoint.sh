#!/bin/sh

cat > GeoIP2.conf <<EOL
AccountID ${ACCOUNT_ID:="0"}
LicenseKey ${LICENSE_KEY:-"0000000000000000"}
EditionIDs ${EDITION_IDS:-"GeoLite2-ASN GeoLite2-City GeoLite2-Country"}
EOL

geoipupdate -f GeoIP2.conf -d /data/db -v
