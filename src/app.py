
from flask import Flask, render_template, flash, request, redirect, send_file, jsonify
from flasgger import Swagger
import qrcode
from io import BytesIO

app = Flask(__name__, static_url_path='/static')
swagger = Swagger(app)

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/qr')
def qr():
    """ get qrcode for file
    ---
    tags:
        - qr service   
    parameters:
      - name: input_string
        in: query
        type: string    
    responses:
      200:
        description: qr code
    """   

    input_string = request.args.get('input_string')
    input_string = (input_string[:512] + '..') if len(input_string) > 512 else input_string

    img_io = BytesIO()
    img = qrcode.make(input_string)
    img.save(img_io, 'JPEG', quality=70)
    img_io.seek(0)
    return send_file(img_io, mimetype='image/jpeg')

@app.route('/health')
def health():
    return 'OK'

if __name__ == '__main__':
    app.run(host="0.0.0.0")
