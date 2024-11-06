from flask import Flask, send_from_directory

app = Flask(__name__, static_folder='../frontend/build')

@app.route('/')
def index():
    return send_from_directory(app.static_folder, 'index.html')

@app.route('/api/example')
def example_api():
    return {"message": "Hello, this is your example API response!"}

@app.route('/<path:path>')
def static_proxy(path):
    return send_from_directory(app.static_folder, path)

if __name__ == '__main__':
    app.run(debug=True)