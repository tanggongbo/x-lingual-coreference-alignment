from bs4 import BeautifulSoup
import sys
import os
from collections import OrderedDict

'''
change the sentence order in the original corpora
from random order to ascending order
'''

f_lists = ["000_779", "001_769", "002_792", "003_799", "004_767", "005_790", "006_785", "007_783", "008_824", "010_837"]
for f in f_lists:
    with open(f+'_sentence_level.xml', "r") as file_in:
        soup = BeautifulSoup(file_in, 'html.parser')
        info_dict = {}
        for mrk in soup.find_all("markable"):
            # change the format
            # original <markable id="markable_0" mmax_level="sentence" orderid="0" span="word_1..word_7"></markable>
            # new format: <markable mmax_level="sentence" orderid="0" id="markable_0" span="word_1..word_7" />
            new_str = '<markable mmax_level="sentence" orderid="'+mrk['orderid']+'" id="'+mrk['id']+ '" span="'+mrk['span']+'" />'
            info_dict[int(mrk['orderid'])] = new_str
        # reorder 
        

        info_dict_ordered = OrderedDict(sorted(info_dict.items()))

        with open('new/'+f+'_sentence_level.xml', "w") as file_out:
            file_out.write('<?xml version="1.0" encoding="UTF-8" ?>\n')
            file_out.write('<!DOCTYPE markables SYSTEM "markables.dtd">\n')
            file_out.write('<markables xmlns="www.eml.org/NameSpaces/sentence">\n')
            for idx, ele in info_dict_ordered.items():
                file_out.write(ele + "\n")
            file_out.write('</markables>\n')



        

