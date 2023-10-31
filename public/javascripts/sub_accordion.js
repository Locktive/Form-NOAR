var acc = document.getElementsByClassName("sub_accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function () {
        /* Toggle between adding and removing the "active" class,
        to highlight the button that controls the panel */
        this.classList.toggle("active");

        /* Toggle between hiding and showing the active panel */
        var painel = this.nextElementSibling;
        if (painel.style.display === "flex") {
            painel.style.display = "none";
        } else {
            painel.style.display = "flex";
        }
    });
}