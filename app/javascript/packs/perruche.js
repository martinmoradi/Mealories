window.onload = function() {
    document.getElementById("perruche").addEventListener('dblclick', function() {
        let sound = document.querySelector(`#perruche-sound`);
        sound.play();
    })
};