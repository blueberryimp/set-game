//hide image objects
$('.cards').hide();

//returns card images in an array called deck
var deck = $('.cards').map(function(card) {
    var src = this.src;
    return this;
}).get();

//fisher-yates shuffle algorithm 
function shuffle(deck) {
    var i,
        j,
        temp;
    for (i = deck.length - 1; i > 0; i--) {
      //pick a remaining element
        j = Math.floor(Math.random() * (i + 1));
      //swap element with the current element
        temp = deck[i];
        deck[i] = deck[j];
        deck[j] = temp;
    }
    return deck;    
};


var setsFound = 0;
var wins = 0;





//second timer
    var sec = 0;
    var min = 0;
    function clock() {
      sec++;
     $('.timer').html(min + ":" + sec); 
      if (sec == 60) {
        sec = 0;
        min++;
      }
      if (min === 5) {
        min = 0;
        $('.timer').html('you lose!'); 
      }
    };
    window.setInterval(clock,1000);


var $grid = $('.grid').isotope({
  itemSelector: '.cards',
   masonry: {
    columnWidth: 250,
  }
});

$('.shuffle-btn').on( 'click', function() {
  $grid.isotope('shuffle');
});

$(window).on('load', function() {
  var $cardsOnBoard = shuffle(deck).splice(0, 16);
  $grid.isotope( 'appended', $cardsOnBoard );
});

$('.append-btn').on( 'click', function() {
  var $threeCards = shuffle(deck).splice(0, 3);
  $grid.isotope( 'appended', $threeCards );
});


 var numCardsSelected = 0;

        $('.grid').on('click', '.cards', function() {
          var card = $('.cards').index(this);
          var color = $(this).attr('data-color');
          var shape = $(this).attr('data-shape');
          var pattern = $(this).attr('data-pattern');
          var number = $(this).attr('data-number');
   
          
            if ($(this).attr("isSelected") === "true") {
                $(this).removeClass('selected');
                $(this).attr("isSelected", "false");
                numCardsSelected--;
           }  else {
             if (numCardsSelected < 3){
                $(this).addClass('selected');
                $(this).attr("isSelected", "true");
                numCardsSelected++; 
                console.log(card, color, shape, pattern, number, numCardsSelected);
                if(numCardsSelected === 3){
                  var cards = [];
                  var selected = $('[isSelected="true"]');
                  for (var i = 0; i < selected.length; i++) {
                    cards.push($(selected[i]));
                }
                  checkAttribute(cards);
                  numCardsSelected = 0;
            }
        }
    }
})

function isAttrSame(attrs){
  var i = null;
  for (i in attrs){
    if(attrs[0] !== attrs[i]){
      return false;
    }
  }
  return true;
}

function isAttrDiff(attrs){
    if(attrs[0] !== attrs[1] && attrs[0] !== attrs[2] && attrs[1] !== attrs[2]) {
       return true; 
       }
   return false; 
}

function checkAttribute(cards) {
  var colors = []; var shapes = []; var patterns = []; var quantity = [];
  var attrScore = 0;

      cards.forEach(function (card) {
        colors.push(card.attr('data-color'));
        shapes.push(card.attr('data-shape'));
        patterns.push(card.attr('data-pattern'));
        quantity.push(parseInt(card.attr('data-number')));
    });
  
    console.log("Colors: " + JSON.stringify(colors, null, 2));
    console.log("Shapes: " + JSON.stringify(shapes, null, 2));
    console.log("Patterns: " + JSON.stringify(patterns, null, 2));
    console.log("Quantities: " + JSON.stringify(quantity, null, 2));

  
  var attrs = [colors,shapes,patterns,quantity];
  console.log(attrs);
  attrs.forEach(function(attr){
    attrScore += isAttrSame(attr) ? 1 : 0;
    attrScore += isAttrDiff(attr) ? 1 : 0;
  })

  if (attrScore === 4 ) {
    var setsFound = 0;
    console.log("You found a Set");
    cards.forEach(function (card) {
         card.toggle("highlight");
         card.attr("isSelected", false);
      //why is it adding 3?
         setsFound ++;
    });
     $('.message').html(setsFound);

  }else{
    console.log("You have not found a Set");
         cards.forEach(function (card) {
            card.removeClass('selected');
            card.attr("isSelected", false);
        });
    }
}
