from random import randint, choice
from datetime import datetime, timedelta

member_id = [i+1000 for i in range(150)]
purchase_date = [
    (datetime.now() + timedelta(days=randint(-350,-5))).strftime('%Y-%m-%d') for i in range(150)
]
employee_id = [100,110,120,130,150,220,230,240]
tax = .0775
menu_items = {
    'Regular Coffee' : 2.50,
    'Regular Espresso' : 3.00,
    'Regular Macchiato' : 3.00,
    'Hazelnut Soy Milk Latte' : 3.50,
    'Peppermint Macchiato' : 3.50,
    'Irish Cream Espresso' : 3.50,
    'Caramel Almond Milk Steamer' : 3.50,
    'Apple Juice' : 2.50,
    'Orange Juice' : 2.50,
    'Iced White Chocolate Frappucinno' : 3.50,
    'Dark Chocolate Macchiato' : 3.50,
    'Chocolate Hazelnut Iced Coffee' : 3.50,
    'Parfait' : 5.00,
    'Breakfast Smoothie' : 5.00,
    'Sausage Kale Egg Scramble' : 6.00,
    'Bacon Cheese Bagel Sandwhich' : 6.00,
    'Cream Cheese and Strawberry Bagel' : 3.00,
    'Whipped Brown Sugar Cream Fruit Dip' : 4.50,
    'Candied Bacon' : 3.00,
    'Spinach Salad' : 3.00,
}

with open("purchases.txt", 'w') as purchase:
    for i in range(1, 401):
        key, val = choice(list(menu_items.items()))
        args = [
            i, f"'{key}'", choice(member_id), 
            choice(employee_id), choice(purchase_date),
            tax, round(val+(val*tax),2)
            ]
        purchase.write(f"INSERT INTO catcafe.dbo.CafePurchases VALUES({[*args]})\n")
