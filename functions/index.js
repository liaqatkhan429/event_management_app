const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.newEventNotification = functions.firestore
  .document("EventCollection/{eventId}")
  .onCreate(async (snap, context) => {
    const event = snap.data();

    await admin.messaging().send({
      topic: "events",
      notification: {
        title: "New Event 🎉",
        body: event.title || "New event added",
      },
    });
  });