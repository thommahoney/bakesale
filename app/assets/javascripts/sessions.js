$(function() {
  Digits.init({ consumerKey: 'BHreRvWpQaZQlNuzM9of6SauZ' });

  $('#loginButton').click(function(event) {
    event.preventDefault();

    Digits.logIn()
      .done(function(response) {
        // Send headers to your server and validate user by calling Digits’ API
        var oAuthHeaders = response.oauth_echo_headers;
        var verifyData = {
          authHeader: oAuthHeaders['X-Verify-Credentials-Authorization'],
          apiUrl: oAuthHeaders['X-Auth-Service-Provider']
        };

        $.ajax({
            url: '/sessions',
            type: 'POST',
            data: verifyData,
            success: function(data) {
              if(data.full_name === null) {
                // this is a new user
                window.location = '/users/' + data.id + '/edit';
              } else {
                // we know about this user
                window.location = '/organizations';
              }
            },
            error: function(xhr, textStatus, errorThrown) {
              console.log('error', xhr, textStatus);
            }
        });
      })
    .fail(function(error) {
      console.log('an error occured:', error);
    });
  });
});
