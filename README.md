# Docker Flask React Example

This project is a simple example of a web application using a Flask backend and a React frontend. The application is containerized using Docker.

## Project Structure

- `frontend/`: Contains the React application.
- `backend/`: Contains the Flask application.
- `Dockerfile`: Docker configuration to build and run the application.
- `.dockerignore`: Files and directories to ignore when building the Docker image.
- `.gitignore`: Files and directories to ignore in git.

## Dockerfile

The Dockerfile is divided into two stages:

1. **Build React app**:
    - Uses a Node.js image to build the React application.
    - Copies the built React files to the second stage.

2. **Setup backend and serve the app**:
    - Uses a Python image to set up the Flask backend.
    - Installs the required Python dependencies.
    - Copies the built React files from the first stage.
    - Exposes port 5000 and starts the Flask application.

## How to Build and Run

1. **Build the Docker image**:
    ```sh
    docker build -t docker-flask-react-example .
    ```

2. **Run the Docker container**:
    ```sh
    docker run -p 5001:5000 docker-flask-react-example
    ```

3. **Access the application**:
    Open your browser and navigate to `http://localhost:5000`.

## Development

For development, you can run the frontend and backend separately:

### Frontend

1. Navigate to the `frontend` directory:
    ```sh
    cd frontend
    ```

2. Install the dependencies:
    ```sh
    npm install
    ```

3. Start the development server:
    ```sh
    npm start
    ```

### Backend

1. Navigate to the `backend` directory:
    ```sh
    cd backend
    ```

2. Create a virtual environment and activate it:
    ```sh
    python -m venv .venv
    source .venv/bin/activate  # On Windows use `.venv\Scripts\activate`
    ```

3. Install the dependencies:
    ```sh
    pip install -r requirements.txt
    ```

4. Start the Flask application:
    ```sh
    python app.py
    ```

The frontend development server will run on `http://localhost:3000` and the backend server will run on `http://localhost:5000`.
