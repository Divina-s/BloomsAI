# BloomsAI 

## Project Objective
The objective of this project is to develop a mobile application that helps farmers diagnose crop diseases quickly and accurately. Users will be able to upload pictures of their crops, and the app will analyze the images to detect any diseases present. Additionally, the app will provide recommendations for treatment of the detected diseases. The app also features a chatbot to assist users with any crop-related queries they may have.

## Technologies Used
- **Mobile Development:** [Flutter](https://flutter.dev/) , [Dart](https://dart.dev/) - Language , - [Firebase](https://firebase.google.com/) - Database and Authenticaion.
- **Deep Learning:** [TensorFlow](https://www.tensorflow.org/), [Keras](https://keras.io/)
- **Image Processing:** [Pillow](https://pillow.readthedocs.io/en/stable/)
- **Backend:** [Django](https://www.djangoproject.com/start/)
- **Chatbot:** [Gemini] 
- **Database:** [DjangoSQLite]

## How to Set Up the Project
1. **Clone the Repository:**
git clone [https://github.com/Divina-s/BloomsAI]

2. **Mobile Frontend Setup:**
- Navigate to the `mobile_frontend/bloomsai` directory.
- Follow Flutter's [installation guide](https://flutter.dev/docs/get-started/install) to set up Flutter.
- Ensure Flutter dependencies are installed:
  ```
  flutter pub get
  ```
- Run the Project:
  - To run the Flutter project, use the flutter run command:
    `
     flutter run

3. **Backend Setup:**
- Navigate to the `backend` directory.
- Open the `requirement.txt` file and start setting up your environment
- **Downloading the Model:**
  - Download the model file from [Google Drive](https://drive.google.com/file/d/1Fp_Yi7Qqp1mN_p1n4Fx6aqPjHJPRt3rs/view?usp=drive_link).
  - Place the downloaded model file in the appropriate directory (`backend/models`)

4. **Database Setup:**
- The database used is an inbuild database *Django SQLite database* .
- It is made available automatically when the server is being ran
- it can be found in the admin section


## How to Run the Code
1. **Mobile Frontend:**
- Connect a mobile device or emulator.
- Navigate to the `mobile_frontend/bloomsai` directory.
- Run the Flutter app:
  ```
  flutter run
  ```

2. **Backend:**
- Navigate to the `backend` directory.
- Start the Flask server:
  ```
  python app.py
  ```

3. **Accessing the App:**
- Access the mobile app on the device or emulator.
- Follow the on-screen instructions to upload images for disease prediction and interact with the chatbot.

## How to Contribute
Contributions to the project are welcome! Here's how you can contribute:
- Fork the repository on GitHub.
- Make your changes in a new branch.
- Submit a pull request detailing your changes and the problem they solve.

## Links of the Contributors
- [Divina Mbel](https://github.com/Divina-s)
- [Mahagueheme G. Roxanne](https://github.com/mahagueheme-Lesly)
- [Contributor 3](link-to-github-profile)
- [Contributor 3](link-to-github-profile)
- [Contributor 3](link-to-github-profile)

