def split_into_words(lyrics):
    """
    Split a string into lowercase words, removing all punctuation characters,
    returning the result.
    """
    result = []
    for word in lyrics.lower().split():  # lower() convierte las palabras en minusculas #Split divide todas las palabras
        word = word.strip(',.;()"¡!')  # strip() elimina del incio y del final los caracteres que le pasemos
        result.append(word)
    return result

def words_to_frequencies(lyrics):
    """
    Convert words into frequencies. Return a dictionarky whose keys are the
    words with the frequency as the value
    """
    freqs = {}
    for word in lyrics:
        if word in freqs:
            freqs[word] += 1
        else:
            freqs[word] = 1
        # Alternativa al if anterior
        # freqs[word] = freqs.get(word, 0) + 1
        # Otra alternativa
        # freqs.setdefault(word, 0)
        # freqs[word] += 1
    return freqs

if __name__ == "__main__":
    import sys
    fib(int(sys.argv[1]))