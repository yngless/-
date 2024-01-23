from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
import json

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://lessed:12345666@localhost:5432/shinomontazh'
db = SQLAlchemy(app)

class Service(db.Model):
    __tablename__ = 'services'
    service_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text)

@app.route('/services', methods=['GET'])
def get_services():
    services = Service.query.all()
    service_list = [{'name': service.name, 'description': service.description} for service in services]

    # Используем json.dumps для управления параметром ensure_ascii
    response_data = json.dumps({'services': service_list}, ensure_ascii=False)

    # Вручную устанавливаем тип контента и кодировку
    response = app.response_class(
        response=response_data,
        status=200,
        mimetype='application/json',
        content_type='application/json; charset=utf-8'
    )

    return response

if __name__ == '__main__':
    app.run(debug=True)
