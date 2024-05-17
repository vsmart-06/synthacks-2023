from flask import Flask, request
from PIL import Image
import numpy as np

app = Flask(__name__)


@app.route("/")
def index():
    return "<marquee direction='left'><h1>API is up and running</h1></marquee>"


@app.route("/constellations", methods=["POST"])
def constellations():
    body = request.form

    img_bytes = eval(body.get("image"))
    dimensions = list(eval(body.get("dimensions")))

    image_size = (int(dimensions[1]), int(dimensions[0]), 4)

    img_array = np.uint8(img_bytes)

    img_array = np.reshape(img_array, image_size)
    img_array = img_array[..., :3]

    img = Image.fromarray(img_array)
    img.save("image.png")

    return {"constellation": "Orion"}



app.run(debug=True)
