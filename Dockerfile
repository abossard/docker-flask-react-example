# Stage 1: Build React app
FROM node:22 AS frontend

WORKDIR /app/frontend

COPY frontend/package.json ./
RUN npm install

COPY frontend ./
RUN npm run build

# Stage 2: Setup backend and serve the app
FROM python:3.13.0

WORKDIR /app/backend

COPY backend/requirements.txt ./
RUN pip install -r requirements.txt

COPY backend ./
COPY --from=frontend /app/frontend/build /app/frontend/build

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]