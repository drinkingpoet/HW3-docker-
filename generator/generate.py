#пусть это будет книжный магаз


import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["id", "title", "author", "pages", "country", "genre", "year"]

def generate_row():
    titles = ["Man with no qualities", "On the road", "Ham on the rye", "Naked Lunch", "The book of disquite", "Москва - Петушки", "And the hippos were boiled in their tanks", "Giovannis room"]
    authors = ["Robert Musil", "Jack Kerouac", "Frenando Pessoa", "William Burroughs", "Charles Bukowski", "Ryunosuke Akutagawa", "Mark Fisher", "James Baldwin"]
    countries = ["USA", "Portugal", "Spain", "Japan", "Russia", "Germany", "India"]
    genres = ["Fiction", "Romance", "Fantasy", "Science Fiction", "History", "Drama"]
    return {
        "id": random.randint(1000, 9999),
        "title": random.choice(titles),
        "author": random.choice(authors),
        "pages": random.randint(100, 1000),
        "country": random.choice(countries),
        "genre": random.randint(0, 100),
        "year": random.randint(1800, 2020),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)

