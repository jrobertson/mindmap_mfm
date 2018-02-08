# Introducing the mindmap_mfm gem


    require 'mindmap_mfm'

    s =<<EOF
    # Daily food programme

    Find out what I typically have to eat in a day.

    ## SVG Output

    !s[](#mindmap)

    What I eat for that day depends upon how hungry I am, how much food I have in the house, and how much time I have to prepare it.  

    ## Breakfast

    I have breakfast after I get out of bed.

    ### Porridge

    To make the porridge I pour about half a cup of porridge into a bowl and then transfer it into a saucepan. Then heat it until the liquid has almost evaportated at which point the porridge is transferred to the bowl and allowed to cool for 5 minutes. Then a pinch of salt or a sprinkling of sugar is added.

    ### Coffee

    I almost always have coffee as it helps waken me up. 


    ## Lunch

    Lunch is typically are 12:30pm . 

    ### Pizza

    I don&apos;t always have pizza but when I do I like to add slices of fresh garlic and when the pizza is done I will add seasoning including a sprinkling of olive oil.

    ## Dinner

    At mealtime which is around 5:10pm I don't have that much to eat.

    ### Cheese burgers

    Ingredients used:

    * ham burgers
    * slices of cheese
    * sliced tomato
    * cucumber
    * lettuce
    * mayonaise or tomato sauce

    --------------

    Possible options for lunch include:

    * chicken soup
    * tuna sandwiches
    * cheese and tomato sandwiches
    * beans on toast


    __DATA__

    <?mindmapviz root='today' fields='label, url' delimiter=' # ' id='mindmap'?>

    breakfast # #breakfast
      porridge # #porridge
      coffee # #coffee
    lunch # #lunch
      pizza # #pizza
    dinner # #dinner
      cheese burgers # #cheese-burgers
    EOF


    m3 = MindmapMFM.new(s)
    m3.to_html

    File.write '/tmp/foo2.html', m3.to_html
    `firefox /tmp/foo2.html`

The above code will generate and HTML file containing an SVG mind map and the associate heading which can be individually visited from each hyperlinked node on the map.

## Screenshot

Here's a screenshot of the output as shown in Firefox.

![Screenshot of the mindmap in a web page](http://a0.jamesrobertson.eu/r/images/2018/feb/08/mindmap.jpg)

## Resources

* mindmap_mfm https://rubygems.org/gems/mindmap_mfm

mindmap mindmap_mfm martile kramdown gem mindmapmfm
