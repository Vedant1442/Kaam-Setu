import * as admin from 'firebase-admin';

// Initialize Firebase Admin using credentials from environment variable
if (admin.apps?.length === 0 || !admin.apps) {
  try {
    const serviceAccountJson = process.env.FIREBASE_SERVICE_ACCOUNT;
    if (serviceAccountJson) {
      const serviceAccount = JSON.parse(serviceAccountJson);
      admin.initializeApp({
        credential: admin.credential.cert(serviceAccount)
      });
      console.log('Firebase Admin initialized with service account.');
    } else {
      admin.initializeApp(); // Use default application credentials
      console.log('Firebase Admin initialized with default credentials.');
    }
  } catch (error) {
    console.error('Failed to initialize Firebase Admin', error);
  }
}

import { getMessaging } from 'firebase-admin/messaging';

export const messaging = getMessaging();
