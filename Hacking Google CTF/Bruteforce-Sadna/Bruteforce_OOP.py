'''
Author: Naor Or-Zion
Team: Nitzanim -> Basmach
Date: 02/10/2022
'''

import time

EMAIL_HAMMAS = 'hammas784@gmail.com'
TRUE_ANSWER = 'moabusanan'


class hack_email:
    def __init__(self, emails, box):
        self.emails = emails
        self.box = box
        
    def bruteforce_emails(self):
        for email in self.emails:
            self.box.send_keys(email)
            self.box.clear()

            if email == EMAIL_HAMMAS:
                self.box.send_keys(email)
                time.sleep(5)
                return True

        return False

class rot_x:
    def __index__(self):
        pass

    def caesar(self, plain_Text, shift):
        for char in plain_Text:
            if char.isalpha():
                stayInAlphabet = ord(char) - shift

                if stayInAlphabet < ord('a'):
                    stayInAlphabet += 26

                finalLetter = chr(stayInAlphabet)

            cipherText = ""
            cipherText += finalLetter

        print("Your ciphertext is:", cipherText)
        return cipherText

    def check_answer(self, answer):
        if answer == TRUE_ANSWER:
            return True
        return False