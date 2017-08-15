//js card sample to see if it works

$('#get-deck-button').on('click', function (evt) {
    $("#special-border").load('/deck');
});




// //get random card 
// function getRandomCard() { 
//     var deck = ['ged1.gif', 'ged2.gif', 'ged3.gif', 'gds2.gif', 'goes2.gif'];
    
//     return deck(Math.floor(Math.random() * deck.length)]; 
// }
// //show card
// //gets image1 from index.html
// function showCard() { 
//     document.getElementById('image1').style.visbility = 'visible'; 
// }

// //change card
// //changes cards attribute from card image1 on index.html
// function changeCard() {
//     document.getElementById('image1').src = "static/images/" + getRandomCard();
// }

// function addCard() { 
// $('#image1').attr('src', getRandomCard());
// });

// function removeCard() { 
// }

// function showRedBorderOnCard(evt) { 
//     $('img#image1').toggleClass('red-border');
// } 
// $('#image1').on('click', showRedBorderOnCard);




// //changing image for image1 test
// $(document).ready(function(){
//     $('#image1').attr('src', getRandomCard()); 
// }); 
