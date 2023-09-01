from flask import Flask, request
from PIL import Image
import numpy as np

app = Flask(__name__)


@app.route("/")
def index():
    return "<marquee direction = 'left'><h1>API is up and running</h1></marquee>"


@app.route("/constellation", methods=["POST"])
def constellation():
    body = request.form

    print(body)
    img = Image.fromarray(np.uint8(body.get("image")))


    img.save("image.png")


app.run(debug=True)