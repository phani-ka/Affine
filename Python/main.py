from flask import Flask, jsonify, request 

app = Flask(__name__)


@app.route('/', methods=['GET'])
def helloworld():
    if(request.method == 'GET'):
        data = {"data": "Hello phani this is helm"}
        return jsonify(data)



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5656)