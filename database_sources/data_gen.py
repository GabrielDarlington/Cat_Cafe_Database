import pandas as pd
from random import randint, randrange, choice

def names():
    first = open("./data_files/first_name.txt").read().split()
    last = open("./data_files/last_name.txt").read().split()
    return [choice(first), choice(last)]

def phone_number():
    first_three = randrange(100,999)
    last_four = randrange(1000,9999)
    area_code = choice([385,435,801])
    phone = f"{area_code}{first_three}{last_four}"
    
    return phone

def email(first: str, last: str) -> str:
    domains = ["gmail.com", "outlook.com", "yahoo.com", "godaddy.com", "comcast.net",
               "apple.com", "notafakeemail.net", "iloveanimals.org"]
    email_format = randint(0,20)

    if email_format < 5:
        return f"{first}.{last}@{choice(domains)}"
    elif email_format >= 5 and email_format <= 10:
        return f"{first[1]}.{last}@{choice(domains)}"
    elif email_format >= 11 and email_format <=20:
        return f"{first}.{last}{randint(0,9999)}@{choice(domains)}"
    elif email_format > 20:
        return f"{first}{last[3]}@{choice(domains)}"

def address():
    compass = ["N","E","S","W"]
    street_suff = ["Dr", "Ave", "Cir", "Blvd", "Way", "St"]
    df = pd.read_csv("./data_files/utah_cities.csv")
    street1 = open("./data_files/trees.txt").read().split()
    street2 = open("./data_files/Utah_specific_streets.txt").read().split()
    zip, city, state = df.iloc[randint(1,len(df)-1)]
    street_choice = randint(1,4)

    match street_choice:
        case 1:
            return [f"{randint(0,9000)} {choice(compass)} {choice(street2)}", city, state, zip]
        case 2:
            return [f"{randint(0,9000)} {choice(compass)} {choice(street2)} {choice(street_suff)}" , city, state, zip]
        case 3:
            return [f"{randint(0,9000)} {choice(compass)} {choice(street1).capitalize()}",city, state, zip]
        case 4:
            return [f"{randint(0,9000)} {choice(compass)} {choice(street1).capitalize()} {choice(street_suff)}"  , city, state, zip]
        

def emp_and_pers():
     manager_count = 0
     with open("./data_files/members.txt", "w") as mem, open("./data_files/employees.txt", "w") as emp:
        for i in range(150):
            first, last = names()
            street, city, state, zip = address()
            phone = phone_number()
            member_email = email(first, last)
                
            
            mem.write(
                f"INSERT INTO catcafe.dbo.MemberSignup VALUES('{first}','{last}','{phone}','{street}','{city}','{state}','{zip}')\n"
                )
        
        for i in range(15):
            first, last = names()
            street, city, state, zip = address()
            phone = phone_number()
            is_manager = randint(0,1)
            sick_days = randint(0,15)
            vacation_days = randint(0,30)

            if is_manager and manager_count < 2:
                manager_count += 1
                emp.write(
                f"""INSERT INTO catcafe.dbo.Employee VALUES('{first}','{last}','{phone}','{street}','{city}','{state}','{zip}',1,0,{sick_days},{vacation_days})\n"""
                )
            else:
                is_volunteer = randint(0,1)
                
                if is_volunteer:
                    emp.write(
                        f"""INSERT INTO catcafe.dbo.Employee VALUES('{first}','{last}','{phone}','{street}','{city}','{state}','{zip}',0,1,0,0)\n"""
                        )
                else:
                    emp.write(
                    f"""INSERT INTO catcafe.dbo.Employee VALUES('{first}','{last}','{phone}','{street}','{city}','{state}','{zip}',0,0,{sick_days},{vacation_days})\n"""
                    )


def vet():
    with open("./output_files/vets.txt", "w") as vet:
        for i in range(1,11):
            phone = phone_number()
            first, last = names()
            vet.write(f"INSERT INTO catcafe.dbo.Veterenarians VALUES({i},'{first}','{last}','{phone}')\n")

def cat():
    cats = open('./data_files/first_name.txt/breeds.txt').read().split()
    with open("./output_files/cats.txt", "w") as cat:
        for i in range(30):
            cat.write(f"INSERT INTO catcafe.dbo.Cats VALUES({randint(0,9999)}, NAME, {choice(cats)}, HEALTH, {randint(1,10)})\n")


if __name__ == "__main__":
    emp_and_pers()
    vet()
    cat()