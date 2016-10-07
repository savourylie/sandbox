def count_words(s, n):
    """ (string, int) -> tuple

    Return the n most frequent-occuring words in s.

    >>> print count_words("betty bought a bit of butter but the butter was bitter", 3)
    [('butter', 2), ('a', 1), ('betty', 1)]
    """

    punc = set('.,<>!@#$%^&*()-_+=]}{[\\|')
    words = [''.join(char for char in word if char not in punc) for word in s.split()]

    #1. Get word tuples
    tuple_list = []

    for word in words:
        tuple_list.append((word, words.count(word)))

    tuple_list = list(set(tuple_list))

##    print("Original list: ")
##    print(tuple_list)
##    print(" ")
    
    #2. Sort the word tuples
    tuple_list_num_ordered = sorted(tuple_list, key=lambda pair: pair[1], reverse=True)

##    print("Number-sorted: ")
##    print(tuple_list_num_ordered)
##    print(" ")
    
    group_holder = [[tuple_list_num_ordered[0]]]
    
    for i in range(1, len(tuple_list_num_ordered)):
        if tuple_list_num_ordered[i][1] == tuple_list_num_ordered[i - 1][1]:
            group_holder[len(group_holder)-1].append(tuple_list_num_ordered[i])
        else:
            group_holder.append([tuple_list_num_ordered[i]])

##    print("Group holder: ")
##    print(group_holder)
##    print(" ")

    # Sort groups by string order
    for j in range(len(group_holder)):
        group_holder[j] = sorted(group_holder[j], key=lambda pair: pair[0].lower(), reverse=False)
        print(group_holder[j])

##    print("String-sorted: ")
##    print(group_holder)
##    print(" ")
    
    tuple_list_ordered = []

    for k in range(len(group_holder)):
        for l in range(len(group_holder[k])):
            tuple_list_ordered.append(group_holder[k][l])            

    tuple_list_ordered = tuple_list_ordered[:n]

##    print tuple_list_ordered    
    
    return tuple_list_ordered

##count_words('cat bat mat cat bat cat', 3)
##count_words('betty bought a bit of butter but the butter was bitter', 3)
count_words('london bridge is falling down falling down falling down london bridge is falling down my fair lady', 5)

