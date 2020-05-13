from flask import Flask
import logging as logger

logger.basicConfig(level="DEBUG")

app = Flask(__name__)


@app.route('/')
def index():
    logger.debug("Starting server")
    return '<h1>Hellow world</h1>'


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
