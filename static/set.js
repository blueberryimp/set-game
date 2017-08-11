var c = color; 
var p = pattern; 
var s = shape;
var n = int number;
var dir = 'static/images';
var fileExtension = '.gif';
//instance variables 
//each card needs its own set of these variables 

function makeCards() {
    this.colors = colors;
    this.patterns = patterns;
    this.shapes = shapes;
    this.numbers = numbers); 
  }

function displayCard() {
  return color, pattern, shape, number;
    
function getCardImage() { 
  var cardImage =  dir + color + shape + pattern + number + fileExtension;
  return cardImage;
}


//create a deck of set card objects 
function createDeck() {
  var deck = cardImage[]; //construct array empty deck reference
  var colors = ['red', 'purple', 'green'];
  var patterns = ['filled', 'empty', 'stripes'];
  var shapes = ['squiggle', 'oval', 'triangle'];
  var numbers = [0,1,2];


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

    return deck; 




