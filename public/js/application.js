$(document).ready(function() {
//   var auth2;
//   var googleUser;

//   var appStart = function(){
//     gapi.load("auth2", initSigninV2);
//   }

//   var initSigninV2 = function(){
//     auth2 = gapi.auth2.init({
//       client_id: "59086680245-s8tsr25plqlpg69sb4em7nogq812l018.apps.googleusercontent.com",
//       scope: "profile"
//     });

//     auth2.isSignedIn.listen(signinChanged);
//     auth2.currentUser.listen(userChanged);

//     if (auth2.isSignedIn.get() == true){
//       auth2.signIn();
//     }

//     refreshValues();
//   };

// var signinChanged = function(val){
//   console.log("Sign in state changed to ", val);
//   document.getElementById()
// }


  gapi.load('auth2', function(){
    gapi.auth2.init();
    console.log(gapi.auth2.GoogleAuth);
  });

  function onSignIn(googleUser) {
    const googleUser = gapi.auth2.getAuthInstance().currentUser.get();
    const profile = googleUser.getBasicProfile();

    var profile = googleUser.getBasicProfile();
    console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
    console.log('Name: ' + profile.getName());
    console.log('Image URL: ' + profile.getImageUrl());
    console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
  }

  $(".g-signin2").on("click", function(event){
    // var person = signIn();
    // onSignIn(person);
    signIn();
  });

  // $("#sign-out").on("click", function(event){
  //   event.preventDefault();
  //   var auth2 = gapi.auth2.getAuthInstance();
  //   auth2.signOut().then(function () {
  //     console.log('User signed out.');
  //   });
  // });
});
