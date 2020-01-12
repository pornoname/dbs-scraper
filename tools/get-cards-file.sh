#!/bin/bash
CARDS_FILE=${CARDS_OUTPUT:-./web-page/src/cards.json}
CARDS_CHANGELOG=${CARDS_CHANGELOG_OUTPUT:-./changelog.cards.txt}
if [ ! -f "$CARDS_FILE" ]; then
    docker run --name dbs-scraper dbs-scraper npm run generate-changelog
    docker cp dbs-scraper:/home/node/app/cards.json ${CARDS_FILE}
    docker cp dbs-scraper:/home/node/app/changelog.cards.txt ${CARDS_CHANGELOG}
    docker rm dbs-scraper
fi
