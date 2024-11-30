from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return '''  <html>
                <head>
                <title>CI/CD</title>
                </head>
                <body>
                <h1> Hello DBS Network CA Thank you sir!!!. </h1>
                </body>
                </html>'''

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)