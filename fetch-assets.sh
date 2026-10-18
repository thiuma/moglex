#!/usr/bin/env bash
# Downloads every image and PDF the site uses from the current moglex.com (Squarespace)
# into assets/, so the new site doesn't depend on Squarespace.
# Run once from the repo folder:   bash fetch-assets.sh
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p assets/img assets/pdf

CDN="https://images.squarespace-cdn.com/content/v1/61a1745009495b7cde44889f"

get() { # get <url> <destination>
  echo "↓ $2"
  curl -fsSL --retry 2 -o "$2" "$1"
}

# Images
get "$CDN/99d53129-0c4e-4a2a-8643-f83a8218b168/Moreau_icon.png?format=500w"                     assets/img/logo-icon.png
get "$CDN/1639332951280-DOY0HNAJTBJYCUGZ8W7R/unsplash-image-VgRyLtxFoOw.jpg?format=2500w"       assets/img/hero.jpg
get "$CDN/26c32c02-7ba7-4af4-9cb3-4912805b45bd/Louis_headshot.png?format=1500w"                 assets/img/louis.png
get "$CDN/488e8ddf-5601-434b-aef5-be5e73008b88/unsplash-image-VMGqx9EtRdU.jpg?format=2500w"     assets/img/band.jpg
get "$CDN/1639273493297-LS6N4ERJLREATM5R1RWL/6315067188_d95a3c5d1b_o.jpg?format=1000w"         assets/img/story-anisotropy.jpg
get "$CDN/1638670259475-JRWK6UV3ZC1LT4WD5W0Q/1519799256692.jpg?format=1000w"                   assets/img/story-hospital.jpg
get "$CDN/1639274934789-F3416UD8F49Z76CG19S2/canstockphoto11648572.jpg?format=1000w"           assets/img/story-drawline.jpg
get "$CDN/1638670160416-UCLWJAHUXVWUY97CM6JZ/alevision-co-7ojyp-IXW7w-unsplash.jpg?format=1000w" assets/img/story-gherkin.jpg
get "$CDN/1639352507214-DJFJ6DZPLQHQ380NG3ZS/20180626_233934809_iOS.jpg?format=1000w"          assets/img/story-cupertino.jpg
get "$CDN/1650729143650-A4Y5TAE6C2OB0K16M5NU/Ext%C3%A9rieur+direct.jpg?format=1000w"           assets/img/story-pioneering.jpg

# White papers
SITE="https://www.moglex.com/s"
get "$SITE/2405_Louis-Moreau-_-Tempering-Preprocessing-Anisotropy-Measurement-for-Architectural-Glass.pdf" assets/pdf/anisotropy-measurement-architectural-glass.pdf
get "$SITE/GPD_Attaching-insulated-glass_Moreau-Glass-Performance-Days-Finland-presentation-June-2015.pdf"  assets/pdf/attaching-insulated-glass.pdf
get "$SITE/Louis-Moreau-Glass-Processing-Tempering-Pre-processing-HACI-Rev-A.pdf"                           assets/pdf/haze-anisotropy-clarity-interference.pdf
get "$SITE/Onassis_E_A4_low.pdf"                                                                             assets/pdf/onassis-cultural-center-case-study.pdf
get "$SITE/Onassis-Stair-Ludvik-Moreau.pdf"                                                                  assets/pdf/onassis-all-glass-stair.pdf

echo "Done. $(ls assets/img | wc -l | tr -d ' ') images and $(ls assets/pdf | wc -l | tr -d ' ') PDFs in assets/."
