from random import choice
from pprint import pprint

def make_cards(): 
    colors = ['green', 'red', 'purple']
    patterns = ['stripe', 'filled', 'empty']
    shapes = ['triangle', 'oval', 'squiggle']
    numbers = [1, 2, 3]
    set_cards = [[[[(a, b, c, d) for a in colors]
                for b in patterns] for c in shapes] for d in numbers]
                    return set_cards #return the set cards


#convert to a single array of tuples
def deck():
    #instantiate an empty array 'cards'
    deck = []
    for a in range(3): 
        for b in range(3):
            for c in range(3):
                for d in range(3):
                    deck += [make_cards()[a][b][c][d]]
    return deck


def select_three_cards(card):
    cards = deck()
    selection = []
    for i in range(4):
        card1 = choice(cards)
        card2 = choice(cards)
        card3 = choice(cards)
        selection += [card1] + [card2] + [card3]
        return selection


def is_set(i):
    for attr in range(4): #attributes of cards in range 0-3
        all_same = (i[0][attr] == i[1][attr] == i[2][attr])
        #all_same = (i[0][attr] == i[1][attr] and i[1][attr] == i[2][attr])
        all_diff = (i[0][attr] != i[1][attr] and i[1][attr] != i[2][attr] and i[2][attr] != i[0][attr])
        if (all_same != True and all_diff != True):
            return False
    return True

cards = deck()

pprint(select_three_cards(deck()))
print is_set(select_three_cards(deck()))#prove sets from make_sets is a set

print is_set([('red', 'empty', 'oval', 3), ('red', 'stripe', 'oval', 3), ('red', 'filled', 'oval', 3)]) #prove sets from make_sets is a set

print is_set([('green', 'empty', 'oval', 3), ('red', 'stripe', 'oval', 3), ('red', 'filled', 'oval', 3)]) #prove sets from make_sets is a set

print is_set([('green', 'empty', 'oval', 3), ('red', 'stripe', 'oval', 3), ('red', 'filled', 'oval', 3)]) #prove sets from make_sets is a set