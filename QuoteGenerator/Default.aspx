<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="main.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <title>Twitter Random Quote Generator</title>


</head>
<body>
    <form id="form1" runat="server">
    <div>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-fixed-top">
  <h3 class="navbar-brand">Twitter Random Quote Generator</h3>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
</nav>
</div>

   <header>
        <div id="top" class="row">

          <div class="col-6">

              <h1>Click the button to generate a random quote</h1>

          </div>

          <div class="col-6">
              <button type="button" class="btn-primary">Random Quote</button>
          </div>



      </div>
   </header>


    

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    </form>
</body>

    <script>

        $('#get-another-quote-button').on('click', function (e) {
            e.preventDefault();
            $.ajax({
                url: '/wp-json/posts?filter[orderby]=rand&filter[posts_per_page]=1',
                success: function (data) {
                    var post = data.shift(); // The data is an array of posts. Grab the first one.
                    $('#quote-title').text(post.title);
                    $('#quote-content').html(post.content);

                    // If the Source is available, use it. Otherwise hide it.
                    if (typeof post.custom_meta !== 'undefined' && typeof post.custom_meta.Source !== 'undefined') {
                        $('#quote-source').html('Source:' + post.custom_meta.Source);
                    } else {
                        $('#quote-source').text('');
                    }
                },
                cache: false
            });
        });
});

    </script>
    
</html>
