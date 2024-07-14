from flask import Flask, jsonify, request, make_response
import json

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def X():
    return(jsonify({"hello":"world"}))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
