### wikiGQextract


> command is going to be wkgqex \<url\> \<output_file_name\>

----------------------


#### Possible issues 

* There are some span tags inside links inside the \<i\> tag which are there to reffer problems to a part of the article
* There some links used for CRUD operations
* There are personalities as well as common words, which make the uppercase/lowercase issue complicated. There is no viable solution, so keywords collected will be implemented as is, or we could drop any words preceeded by a point. In that way no keywords would be mistaken. 
* Given the fact that a lot of words work in different areas there may be a lot of ambiguity. To avoid that, we also use the title.


----------------------------------------

#### Css Tags used to gather needed keywords

1. .mw-body-content p>b
2. .mw-body-content p>i
3. .mw-body-content p>a 
4. h1.firstHeading



----------------------

#### Questions templates

1. Do you know what %s means in regards of %s ? ---|works for 1-3| only 4
2. What can you tell about %s -- applies to 1-3,4
3. Can you briefly elaborate on the topic of %s in regards of %s --|works for 1-3| only 4
4. What aspects of %s are you familliar with ? works for 1-4
5. What knowledge do you have regarding %s in the context of %s  -- works from 1-3|4
6. Please describe %s from your understanding in the context of %s  -- works from 1-3|4

