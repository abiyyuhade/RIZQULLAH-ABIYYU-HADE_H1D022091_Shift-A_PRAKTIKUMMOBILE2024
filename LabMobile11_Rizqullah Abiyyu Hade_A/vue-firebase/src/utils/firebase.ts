// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth, GoogleAuthProvider } from 'firebase/auth';
import { getFirestore } from 'firebase/firestore';

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDJD5BF76P7G6i9gD8DN8cCAJfYj91VzXU",
  authDomain: "vue-firebase-3e9c3.firebaseapp.com",
  projectId: "vue-firebase-3e9c3",
  storageBucket: "vue-firebase-3e9c3.firebasestorage.app",
  messagingSenderId: "659027003512",
  appId: "1:659027003512:web:ad47342659bbe9d630858d",
  measurementId: "G-2XGJMQ19GR"
};

const firebase = initializeApp(firebaseConfig);
const db = getFirestore(firebase);
const auth = getAuth(firebase);
const googleProvider = new GoogleAuthProvider();

export { auth, googleProvider, db };