from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/')
def main():
    return "Girlcode Store API"

@app.route('/categories')
def categories_route():
    tmp_categories = [
        {
            "name": "Furniture",
            "path": "/Category/furniture"
        },
        {
            "name":"Hand Bag", 
            "path": "/Category/hand-bag"
        },
        {
            "name":"Books", 
            "path": "/Category/books"
        },
        {
            "name":"Tech", 
            "path": "/Category/tech"
        },
        {
            "name":"Sneakers", 
            "path": "/Category/sneakers"
        },
        {
            "name":"Travel", 
            "path": "/Category/travel"
        }
    ]

    categories_Dict = {
        "categories": tmp_categories
    }

    return categories_Dict

