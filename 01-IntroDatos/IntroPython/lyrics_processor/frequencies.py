def most_common_words(frequencies):
    """
    Return a tuple containing:
    * The number of occurences of a word in the first tuple element
    * A list containing the words with that frequency
    """
    values = frequencies.values()
    best = max(values)
    
    words = []
    for word, score in frequencies.items():
        if score == best:
            words.append(word)
    return (best, words)

def get_more_often_user_words(frequencies, threshold=10):
    """
    Return a list of the words that are used more often, above
    the *optional* threshold. If no threshold is passed, use 10.
    """
    
    result = []
    freq=frequencies.copy() #AQUÍ ESTABA EL ERROR: Al no usar una copia del diccionario, borraba los valores más grandes con el del
    while True:
        score = most_common_words(freq)
        if score[0] < threshold:
            break
        for w in score[1]:
            del freq[w]
        result.append(score)
        
    return result

if __name__ == "__main__":
    import sys
    fib(int(sys.argv[1]))