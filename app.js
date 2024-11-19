// Fonction pour ajouter un GIF mignon au hasard à l'écran
function generateCuteGif() {
    // Créer un nouvel élément image
    const gif = document.createElement('img');
    gif.src = "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExd3B0Z2J1ZDN5bzVubDM3YjIzNWZsNXI3ZjBpdWRwMjh3NWZhY3NmNiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/kZqbBT64ECtjy/giphy.gif"; // GIF mignon
    gif.alt = "Cute Animation";
    gif.classList.add('cute-gif'); // Ajout de la classe 'cute-gif' pour l'animation

    // Position aléatoire pour l'apparition du GIF
    const xPos = Math.floor(Math.random() * window.innerWidth);
    const yPos = Math.floor(Math.random() * window.innerHeight);

    // Appliquer la position initiale du GIF
    gif.style.left = `${xPos}px`;
    gif.style.top = `${yPos}px`;

    // Ajouter le GIF au conteneur
    document.getElementById('gif-container').appendChild(gif);

    // Animation: Après 5 secondes, le GIF disparaît
    setTimeout(() => {
        gif.style.opacity = '0';
        gif.remove(); // Enlève le GIF après l'animation
    }, 5000);
}

// Générer des GIFs toutes les 2 secondes
setInterval(generateCuteGif, 2000);
// Function to create a heart and animate it
function createHeart() {
    // Create the heart element
    const heart = document.createElement('div');
    heart.classList.add('heart');

    // Randomize the starting position
    const xPos = Math.floor(Math.random() * window.innerWidth);
    heart.style.left = `${xPos}px`;

    // Add the heart to the container
    document.getElementById('heart-container').appendChild(heart);

    // Remove the heart after the animation completes (6s)
    setTimeout(() => {
        heart.remove();
    }, 6000);
}

// Generate hearts every 1 second
setInterval(createHeart, 1000);
