$(function () {
    $("[rel='tooltip']").tooltip();
});

function display_search() {
    index = document.getElementById("search-container");
    if (index.style.display == "none") {
        img = document.getElementById("search-display-icon");
        img.setAttribute("src", "images/minusM.png");

        $( "#search-container" ).slideDown( "500", function() {
        });
    }
    else {
        img = document.getElementById("search-display-icon");
        img.setAttribute("src", "images/plusM.png");

        $( "#search-container" ).slideUp( "500", function() {
        });
    }
}