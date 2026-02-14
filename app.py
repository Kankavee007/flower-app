from flask import Flask, render_template, request, jsonify
from flask_cors import CORS
import os

app = Flask(__name__)
CORS(app)

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/predict", methods=["POST"])
def predict():
    file = request.files["image"]
    filepath = "temp.jpg"
    file.save(filepath)

    # result = predict_flower(filepath)
    result = "Rose"
    os.remove(filepath)

    return jsonify({"flower": result})

if __name__ == "__main__":
    app.run(debug=True)