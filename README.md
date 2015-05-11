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
4. .mw-body-content .mw-headline
5. h1.firstHeading



----------------------

#### Questions templates

1. What do you think about %s -- applies to 1-3,5
2. Do you know what %s means in regards of %s ? ---|works for 1-4| only 5
3. What can you tell about %s -- applies to 1-3,5
4. Can you briefly elaborate on the topic of %s in regards of %s --|works for 1-4| only 5
5. Where would you consider as part of the following : %s => list(%s) --- |1-3|all 4's
6. What aspects of %s are you familliar with ? works for 1-5
7. What knowledge do you have regarding %s in the context of %s  -- works from 1-4|5
8. Please describe %s from your understanding in the context of %s  -- works from 1-4|5

