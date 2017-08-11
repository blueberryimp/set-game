var cards = {
color:['red', 'purple', 'green'], 
shape:['♣','♦','♥']
pattern:['filled', 'empty', 'stripes']
//var shapes = ['squiggle', 'oval', 'triangle'];
number:[0,1,2], 
deck = [], 
generate_deck: function() {
    for (c = this.color.length; i-- > 0;) {
        for (s = this.shape.length; i-- > 0;) {
            for (p = this.pattern.length; i-- > 0;) {
                for (n = this.number.length; i-- > 0;) {
                    this.deck.push(this.color[c] + this.shape[s]
                        + this.pattern[p] + this.number[n])
    }
}
    return this.deck;
}, 


    */
  var i = deck.length;
  if ( i == 0 ) return false;
  while ( --i ) {
     var j = Math.floor( Math.random() * ( i + 1 ) );
     var tempi = deck[i];
     var tempj = deck[j];
     deck[i] = tempj;
     deck[j] = tempi;
   }
    return deck;
},
    cut: function(deck){
         var mid = Math.floor(Math.random()*81), top, bot;
         /* split array into top & bottom */
        
        
         this.deck = concat(bottom,top);        
 
        
    },
    init: function(){
        this.generate_deck();
        this.shuffle(this.deck);
    }