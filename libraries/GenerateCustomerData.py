import random

# TODO
# Come up with a way of creating all of these
# randomly. Be creative

class GenerateCustomerData:

    def generate_firstname(self):
        firstname_list = ["Juha", "Timo", "Matti", "Kari", "Mikko", "Jari",
                          "Antti", "Jukka", "Mika", "Markku", "Pekka", "Hannu",
                          "Heikki", "Seppo", "Janne", "Ari", "Sami", "Ville", "Marko",
                          "Petri", "Tuula", "Anne", "Päivi", "Anna", "Ritva", "Leena",
                          "Pirjo", "Sari", "Minna", "Marja", "Tiina", "Riitta",
                          "Tarja", "Pirkko", "Laura", "Seija", "Aino", "Liisa", "Eeva", "Raija"]
        firstname = random.choice(firstname_list)
        generate_firstname_string = str(firstname)

        return generate_firstname_string

    def generate_lastname(self):
        lastname_list = ["Korhonen", "Virtanen", "Mäkinen", "Nieminen", "Kinnunen", "Mäkelä", "Hämäläinen",
                         "Laine", "Heikkinen", "Koskinen", "Järvinen", "Savolainen", "Räsänen"]
        lastname = random.choice(lastname_list)
        generate_lastname_string = str(lastname)
        return generate_lastname_string

    def generate_address(self):
        address_list1 = ["Puolar", "Friisinkallion", "Ilma", "Avaruus", "Auto", "Koira", "Vuori", "Koivu",
                         "Kuusi", "Peruna", "Laiva", "Hauki", "Lahna", "Lohi", "Aamu", "Kuitinmäen", "Keskiyön"]
        address_list2 = ["tie", "katu", "kuja"]
        letter_list = ["A","B","C","D","E","F","G"]

        address1 = random.choice(address_list1)
        address2 = random.choice(address_list2)
        letter = random.choice(letter_list)

        generate_address_string = str(address1) + str(address2) + " " + str(random.randint(1, 15)) + " " + str(letter)
        return generate_address_string

    def generate_city(self):
        city_list = ["Espoo", "Helsinki", "Vantaa", "Oulu", "Tampere", "Rovaniemi", "Lappeenranta",
                     "Turku", "Seinäjoki", "Kajaani", "Hämeenlinna", "Joensuu", "Jyväskylä",
                     "Kalajoki", "Lahti", "Lohja", "Pori"]
        city = random.choice(city_list)
        generate_city_string = str(city)
        return generate_city_string

    def generate_state(self):
        state_list = ["Uusimaa", "Varsinais-Suomi", "Keski-Suomi", "Etelä-Savo", "Pohjois-Savo",
                      "Kainuu", "Lappi", "Pohjois-Pohjanmaa", "Satakunta", "Pohjanmaa"]
        state = random.choice(state_list)
        generate_state_string = str(state)
        return generate_state_string

    def generate_zipcode(self):
        generate_zipcode_string = str(random.randint(10000, 99999))
        return generate_zipcode_string

    def generate_phonenumber(self):
        generate_phonenumber_string = str(random.randint(100, 999)) + "-" + str(random.randint(1000000, 9999999))
        return generate_phonenumber_string

    def generate_ssn(self):
        letter_list = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]
        letter = random.choice(letter_list)
        generate_snn_string = str(random.randint(100000, 999999)) + "+" + str(random.randint(100,999)) + str(letter)
        return generate_snn_string

    def generate_username(self):
        generate_username_string = "user " + str(random.randint(0, 999))
        return generate_username_string

    def generate_password(self):
        generate_password_string = str(random.randint(0, 9999999999))
        return generate_password_string

    def generate_payee_account(self):
        generate_payee_account_string = str(random.randint(10000, 99999))
        return generate_payee_account_string