const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp(functions.config().firebase);

exports.sendNotification = functions.firestore.document('users/{uid}').onWrite(
  async (event)=>{
    let title = event.get('title');
    let content = event.get('content');

    var message = {
      notification : {
        title:title,
        body: content,
      },
      topic: 'users',
    };

    let response = await admin.messaging().send(message);
    console.log(response);
  }
);

