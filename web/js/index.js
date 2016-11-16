/* Simple VanillaJS to toggle class */

document.getElementById('toggleProfile').addEventListener('click', function () {
    [].map.call(document.querySelectorAll('.profile'), function (el) {
        el.classList.toggle('profile--open');
    });
});

function NumChk() {
         document.getElementById("alert").style.visibility = "hidden";
                
    }