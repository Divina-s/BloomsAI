# Blooms Backend
git
- create a virtual environment
`python -m venv venv`
- activate the virtual environment
Linux/macOS: `source venv/bin/activate`
Windows: `venv\Scripts\activate`

- install requirements found in the requirements.txt file
`pip install -r requirements.txt`

- make and run migrations
`python manage.py makemigrations`
`python manage.py migrate`

- runserver
`python manage.py runserver`

- checkout `http://127.0.0.1:8000/api/`