


var deck = new Array();
var colors = ['red', 'purple', 'green'];
var patterns = ['filled', 'empty', 'stripes'];
var shapes = ['squiggle', 'oval', 'triangle'];
var numbers = [0,1,2]; 


function deck() { 
  var deck = new Array(); 

  for( var c = 0; s < colors.length; c++ ) 
  {
    for( var p = 0; n < patterns.length; p++ ) 
    {
      for( var s = 0; n < shapes.length; s++ ) 
      {
        for( var n = 0; n < patterns.length; n++ ) 
        {
          var card = {Color: colors[c], Pattern: patterns[p],
          Shape: shapes[s], Number: numbers[n]};

          deck.push(card); 
           


//fisher-yates shuffle 
function shuffle (array) {
  var i = 0
    , j = 0
    , temp = null

  for (i = deck.length - 1; i > 0; i -= 1) {
    j = Math.floor(Math.random() * (i + 1))
    temp = deck[i]
    deck[i] = deck[j]
    deck[j] = temp
  }
}

