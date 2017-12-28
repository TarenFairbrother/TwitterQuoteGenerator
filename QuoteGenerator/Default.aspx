<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Main.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    <title>Twitter Random Quote Generator</title>

</head>
<body class="bg-light">
    <form id="form1" runat="server">
    <div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-fixed-top">
  <h3 class="navbar-brand">Twitter Random Quote Generator</h3>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
</nav>


   <header id="top" class="bg-dark align-text-bottom">

          <div id="top-left">

              <h3 class="text-white text-center  ">Click the button to generate a random quote</h3>

          
              <button id="getquote" type="button" class="btn-primary btn-lg center-block">Random Quote</button>
              <button id="sharequote" type="button" class="btn-primary btn-lg center-block">Share Quote</button>
         
         </div>

   </header>

        <section id="middle">

            <h3 class ="text-center" id="quote"></h3>
            <h2 class="text-center" id="quoteauthor"></h2>
        
        </section>

        <section id="bottom" class="fixed-bottom bg-dark align-bottom">

            <h1 class="text-right text-light">By Taren Fairbrother</h1>


        </section>


  </div>  


    </form>


</body>
            <script>

                $(document).ready(function () {

                    var quote;
                    var author;

                    function getNewQuote() {

                        $.ajax({
                            url: 'http://api.forismatic.com/api/1.0/',
                            jsonp: 'jsonp',
                            dataType: 'jsonp',
                            data: {
                                method: 'getQuote',
                                lang: 'en',
                                format: 'jsonp'
                            },
                            success: function (response) {
                                quote = response.quoteText;
                                author = response.quoteAuthor;
                                $('#quote').text('" ' +quote + ' "');
                                if (author) {
                                    $('#quoteauthor').text('Quote by ' + author);
                                }
                                else {
                                    $('#author').text('-- unknown');
                                }
                            }
                        });
                    }
                    getNewQuote();

                    $('#getquote').on('click', function (event) {
                        event.preventDefault();
                        getNewQuote();
                    });

                    $('#sharequote').on('click', function (event) {

                        event.preventDefault();

                        window.open('https://twitter.com/intent/tweet?text=' + encodeURIComponent(quote + '--' + author));
                    });

                });

    </script>

    
</html>
