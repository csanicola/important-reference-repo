# Learn String Manipulation by Building a Cipher
# cipher - a program that encrypts and decrypts messages
# from the scientific computing with python course on freecodecamp

text = 'Hello Zaira!'
custom_key = 'python'


# some functions can have default arguments in them so for this we will have the default of direction be 1
def vigenere(message, key, direction=1):
    key_index = 0
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    final_message = ''

    for char in message.lower():
        # Append any non-letter character to the message
        if not char.isalpha():  # adding the not operator at the beginning of the if condition checks if the character is not alphabetic
            final_message += char
        else:
            # Find the right key character to encode/decode
            # assigns the value of key at the index key_index mod the length of key
            key_char = key[key_index % len(key)]
            key_index += 1

            # Define the offset and the encrypted/decryption letter
            offset = alphabet.index(key_char)
            index = alphabet.find(char)
            # adding the direction to the offset
            new_index = (index + offset * direction) % len(alphabet)
            final_message += alphabet[new_index]

    return final_message


def encrypt(message, key):
    return vigenere(message, key)


def decrypt(message, key):
    return vigenere(message, key, -1)


encryption = encrypt(text, custom_key)
print(encryption)
decryption = decrypt(encryption, custom_key)
print(decryption)
