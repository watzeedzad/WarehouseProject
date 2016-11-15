<%-- 
    Document   : nav
    Created on : Nov 6, 2016, 10:55:46 PM
    Author     : 000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <title>Page Loading Effects | Demo 11</title>
        <meta name="description" content="Page Loading Effects: Modern ways of revealing new content" />
        <meta name="keywords" content="page loading, svg animation, loading effect, fullscreen svg" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico">
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <script src="js/snap.svg-min.js"></script>
    </head>
    <body>
        <div id="pagewrap" class="pagewrap">
            <div class="container show" id="page-1">
                <header class="codrops-header">
                    <h1>Page Loading Effects <span>Modern ways of revealing new content</span></h1>
                </header>
                <section class="columns clearfix">
                    <div class="column">
                        <p>To start the page loading animation, click the following link:</p>
                        <p><a class="pageload-link" href="www.google.com">Show Page Loader</a></p>
                    </div>
                </section>
            </div><!-- /container -->

            <!-- The new page dummy; this would be dynamically loaded content -->
            <div class="container" id="page-2">
                <!-- Top Navigation -->
                <section>
                    <h2>This is an example for a new page.</h2>
                    <p><a class="pageload-link" href="#page-2">Go back</a></p>
                </section>
            </div><!-- /container -->

            <div id="loader" class="pageload-overlay" data-opening="m -5,-5 0,70 90,0 0,-70 z m 5,35 c 0,0 15,20 40,0 25,-20 40,0 40,0 l 0,0 C 80,30 65,10 40,30 15,50 0,30 0,30 z">
                <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 80 60" preserveAspectRatio="none" >
                <path d="m -5,-5 0,70 90,0 0,-70 z m 5,5 c 0,0 7.9843788,0 40,0 35,0 40,0 40,0 l 0,60 c 0,0 -3.944487,0 -40,0 -30,0 -40,0 -40,0 z"/>
                </svg>
            </div><!-- /pageload-overlay -->

        </div><!-- /pagewrap -->
        <script src="js/classie.js"></script>
        <script src="js/svgLoader.js"></script>
        <script>
            (function () {
                var pageWrap = document.getElementById('pagewrap'),
                        pages = [].slice.call(pageWrap.querySelectorAll('div.container')),
                        currentPage = 0,
                        triggerLoading = [].slice.call(pageWrap.querySelectorAll('a.pageload-link')),
                        loader = new SVGLoader(document.getElementById('loader'), {speedIn: 400, easingIn: mina.easeinout});

                function init() {
                    triggerLoading.forEach(function (trigger) {
                        trigger.addEventListener('click', function (ev) {
                            ev.preventDefault();
                            loader.show();
                            // after some time hide loader
                            setTimeout(function () {
                                loader.hide();

                                classie.removeClass(pages[ currentPage ], 'show');
                                // update..
                                currentPage = currentPage ? 0 : 1;
                                classie.addClass(pages[ currentPage ], 'show');

                            }, 2000);
                        });
                    });
                }

                init();
            })();
        </script>
    </body>
</html>