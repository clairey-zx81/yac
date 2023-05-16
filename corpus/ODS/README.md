# Scrapping OpenDataSoft

Récupération des JSON Schéma d'un site OpenDataSoft.

## Récupération complète directe

./OpenDataSoft_scrap.sh https://data.whatever.com

## Récupération par morceaux

- **datasets** `./scrap.py https://data.whatever.com > datasets.out`
- **scraping** `./scrap.sh https://data.whatever.com < datasets.out`
