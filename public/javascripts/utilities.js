$(function () {
    $("[rel='tooltip']").tooltip();
});

function display_search() {
    index = document.getElementById("search-container");
    if (index.style.display == "none") {
        index.style.display = "block";
        img = document.getElementById("search-display-icon");
        img.setAttribute("src", "images/minusM.png");
    }
    else {
        index.style.display = "none";
        img = document.getElementById("search-display-icon");
        img.setAttribute("src", "images/plusM.png");
    }
}