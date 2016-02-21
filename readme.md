# Summary

A short analysis of objects found by Inception3 (a deep convolutional neural network by Google) in a sample of around ~10k pictures of mine.

I specifically look for "unusual" objects, focusing on the labels that score a low count in the Natural Language Corpus Data.

# High-level process description

## Setup

I first prepared the setup for having Inception3 working. Inception3 is a deep convolutional neural network by Google, which is *already* trained on the ImageNet Large Visual Recognition corpus.

Inception3 works on the TensorFlow framework by Google. Setting up the framework as of Feb 2016 is moderately complicated; the installation is simple but the actual running of the real examples requires some heavy stackoverflow and github digging.

Luckily, there is a docker container that works pretty much out of the bos, here: https://hub.docker.com/r/atong01/imagenet-tensorflow/ . So after some half a day of trouble getting TensorFlow to work, I finally used the container and got the process to work in an hour.

After that, I made an export of around 10k of my pictures.

Finally, I downloaded a file with the 1/3 million most frequent words, all lowercase, with counts, from Peter Norvig's page here http://norvig.com/ngrams/ . This file would allow me to score the "strangeness" of the labels.

## The coding part

I made three scripts:
1) runAdjusted.py which runs the object recognition. This script emits in output a text blurb listing the objects found in the picture, with the confidence level. See an example here https://www.tensorflow.org/versions/r0.7/tutorials/image_recognition/index.html

2) extractToken.py which filter just *one label* (made of one word only) out of the objects recognition text.

3) howFrequent.py which takes the word of the previous point and looks it up in the "corpus word count" file.

The three commands piped together give the filename, the object detected with the highest confidence, and the "corpus count" of the found object.

## The running part

I've put the images in three separate directories and run 3 processes in parallel, outputting the results in .csv files.

After a night of processing, I collected the results.

### How to actually run this:

After having the container installed, download this project. From the directory of the project, run:

```docker run -it -v $PWD:/root/tmp -v $PWD/images1:/root/tmp/images1 -v $PWD/images2:/root/tmp/images2 -v $PWD/images3:/root/tmp/images3 -v $PWD/images4:/root/tmp/images4 atong01/imagenet-tensorflow```

Then, form "inside" the container:

```cd /root/tmp/```
```sh ./processAllImages1.sh > resultsImages1.csv```

(you can run multiple processes, "processAllImages2" operates on the "images2" directory and so on up to "processAllImages4")

This will process all the images in the ```./images1/``` directory. You might want to redirect that to a .csv file.

# More about ImageNet and convolutional neural networks

The ImageNet Large Visual Recognition is a big dataset [Deng et al. 2009] which has been used since 2010 as a benchmark for object recognitions in images. Since 2012, the benchmark has been dominated by convolutional neural networks. Although convolutional neural networks have been around for a long time, there as been incredible progress in the past five years or so in terms of speed of their training, mostly due to the advent of "big data" (which readied the whole IT industry for workflows based on transfer and analysis of huge quantities of data) and the availability of server farms enabled with graphic cards (where both training and operation of these networks could be done fast and cheap).

For a great overview, see any of Yann LeCun's (a key player in the field) videos on the matter e.g. https://www.youtube.com/watch?v=M7smwHwdOIA

# Results

## The strangest objects in my pics:

The objects are ordered in decreasing strangeness (an object is more strange if it has a lower count in the Natural Language Corpus Data).

 ashcan  (corpus count: 17521 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-1188.jpg  "> <br>
 consomme  (corpus count: 24689 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-1021.jpg  "> <br>
 chainlink  (corpus count: 28909 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-3035.jpg  "> <br>
 toyshop  (corpus count: 35622 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1723.jpg  "> <br>
 toyshop  (corpus count: 35622 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-10786.jpg  "> <br>
 toyshop  (corpus count: 35622 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-10799.jpg  "> <br>
 toyshop  (corpus count: 35622 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-1184.jpg  "> <br>
 jackfruit  (corpus count: 41792 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2659.jpg  "> <br>
 jackfruit  (corpus count: 41792 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2661.jpg  "> <br>
 trolleybus  (corpus count: 48586 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-11252.jpg  "> <br>
 axolotl  (corpus count: 57021 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-2607.jpg  "> <br>
 komondor  (corpus count: 67610 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-11200.jpg  "> <br>
 kuvasz  (corpus count: 72446 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-12062.jpg  "> <br>
 drumstick  (corpus count: 89753 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-10005.jpg  "> <br>
 snowplow  (corpus count: 96186 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-1878.jpg  "> <br>
 dugong  (corpus count: 103769 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-1256.jpg  "> <br>
 maillot  (corpus count: 111683 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2307.jpg  "> <br>
 meerkat  (corpus count: 113040 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-11993.jpg  "> <br>
 washbasin  (corpus count: 114082 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1094.jpg  "> <br>
 stupa  (corpus count: 117550 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-10084.jpg  "> <br>
 sandbar  (corpus count: 136849 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-2472.jpg  "> <br>
 speedboat  (corpus count: 141990 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-119.jpg  "> <br>
 breastplate  (corpus count: 154648 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-257.jpg  "> <br>
 triumphal  (corpus count: 155633 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2081.jpg  "> <br>
 megalith  (corpus count: 163808 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2219.jpg  "> <br>
 loupe  (corpus count: 168244 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-11428.jpg  "> <br>
 shoji  (corpus count: 231018 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1307.jpg  "> <br>
 flagpole  (corpus count: 270789 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1429.jpg  "> <br>
 airship  (corpus count: 296641 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-10008.jpg  "> <br>
 airship  (corpus count: 296641 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-1089.jpg  "> <br>
 breakwater  (corpus count: 307474 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-10258.jpg  "> <br>
 geyser  (corpus count: 313513 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-11273.jpg  "> <br>
 boathouse  (corpus count: 324233 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1854.jpg  "> <br>
 photocopier  (corpus count: 341379 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-11471.jpg  "> <br>
 trifle  (corpus count: 349545 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-10381.jpg  "> <br>
 ladle  (corpus count: 372653 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-4132.jpg  "> <br>
 bannister  (corpus count: 399566 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-10461.jpg  "> <br>
 tricycle  (corpus count: 400029 ) Not quite a tricycle but giving it a pass since it did find a curious object indeed. <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-117.jpg  "> <br>
 rotisserie  (corpus count: 459806 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-11740.jpg  "> <br>
 streetcar  (corpus count: 471936 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-3056.jpg  "> <br>
 odometer  (corpus count: 482886 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2862.jpg  "> <br>
 oscilloscope  (corpus count: 535361 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-1042.jpg  "> <br>
 albatross  (corpus count: 553191 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-12090.jpg  "> <br>
 kimono  (corpus count: 586714 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2127.jpg  "> <br>
 grasshopper  (corpus count: 595548 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-10221.jpg  "> <br>
 hermit  (corpus count: 828204 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2671.jpg  "> <br>
 eel  (corpus count: 956144 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-10588.jpg  "> <br>
 forklift  (corpus count: 1006085 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1870.jpg  "> <br>
 confectionery  (corpus count: 1138693 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-36.jpg  "> <br>
 parachute  (corpus count: 1311422 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1269.jpg  "> <br>
 carousel  (corpus count: 1369112 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2090.jpg  "> <br>
 hamster  (corpus count: 1444712 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1033.jpg  "> <br>
 cloak  (corpus count: 1450056 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-10202.jpg  "> <br>
 broccoli  (corpus count: 1625392 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-11619.jpg  "> <br>
 flamingo  (corpus count: 1638181 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2785.jpg  "> <br>
 joystick  (corpus count: 1687753 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-1028.jpg  "> <br>
 gong  (corpus count: 2128445 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-1100.jpg  "> <br>
 gong  (corpus count: 2128445 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-2085.jpg  "> <br>
 wig  (corpus count: 2151939 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1433.jpg  "> <br>
 wig  (corpus count: 2151939 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1713.jpg  "> <br>
 wig  (corpus count: 2151939 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2100.jpg  "> <br>
 wig  (corpus count: 2151939 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2399.jpg  "> <br>
 wig  (corpus count: 2151939 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-11899.jpg  "> <br>
 wig  (corpus count: 2151939 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-1194.jpg  "> <br>
 pelican  (corpus count: 2199254 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-11610.jpg  "> <br>
 ox  (corpus count: 2258722 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-10854.jpg  "> <br>
 maze  (corpus count: 2404306 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-10172.jpg  "> <br>
 wreck  (corpus count: 2447935 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-11908.jpg  "> <br>
 altar  (corpus count: 2627835 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-1111.jpg  "> <br>
 radiator  (corpus count: 2850529 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1462.jpg  "> <br>
 knot  (corpus count: 2980542 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-11197.jpg  "> <br>
 jigsaw  (corpus count: 3237104 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2621.jpg  "> <br>
 jigsaw  (corpus count: 3237104 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-3193.jpg  "> <br>
 feather  (corpus count: 3331460 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-2263.jpg  "> <br>
 throne  (corpus count: 3392423 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-10387.jpg  "> <br>
 boxer  (corpus count: 3592432 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1767.jpg  "> <br>
 goose  (corpus count: 3739382 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-11584.jpg  "> <br>
 sock  (corpus count: 3748769 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-1240.jpg  "> <br>
 sock  (corpus count: 3748769 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-1898.jpg  "> <br>
 binoculars  (corpus count: 4487365 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-12287.jpg  "> <br>
 
## Funny miscallisifications 
 
 warplane  (corpus count: 43421 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1788.jpg  "> <br>
 colobus  (corpus count: 54191 ). Although there is no primate in the picture, the tree looks like the one where a colobus might be. <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1573.jpg  "> <br>
 brassiere  (corpus count: 70860 ). Probably not a brasserie. <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-3287.jpg  "> <br>
 mousetrap  (corpus count: 204797 ). Many small mechanical things are classified as mousetraps. <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-10318.jpg  "> <br>
 hippopotamus  (corpus count: 223453 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-11588.jpg  "> <br>
 miniskirt  (corpus count: 254335 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2130.jpg  "> <br>
 guillotine  (corpus count: 307824 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-12112.jpg  "> <br>
 baboon  (corpus count: 359080 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-11597.jpg  "> <br>
 crayfish  (corpus count: 419647 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-10329.jpg  "> <br>
 rotisserie  (corpus count: 459806 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-11318.jpg  "> <br>
 barbershop  (corpus count: 481271 ). How would have you classified this one? <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-1424.jpg  "> <br>
 strainer  (corpus count: 503244 ). (it's the core of an induction coil). <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-12271.jpg  "> <br>
 croquet  (corpus count: 571392 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-11808.jpg  "> <br>
 corkscrew  (corpus count: 581475 ) (robotic surgeon, pic I took from a book) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-254.jpg  "> <br>
 clog  (corpus count: 787644 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1136.jpg  "> <br>
 barbell  (corpus count: 819496 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-10348.jpg  "> <br>
 <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-10352.jpg  "> <br>
 punching  (corpus count: 1000845 ) (somewhat similar to a punching bag?) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-1017.jpg  "> <br>
 teapot  (corpus count: 1069708 ) (don't ask what this is) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-1828.jpg  "> <br>
 parachute  (corpus count: 1311422 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2610.jpg  "> <br>
 joystick  (corpus count: 1687753 ) (again, don't ask why we did this in our work time) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-11467.jpg  "> <br>
 toaster  (corpus count: 2092936 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-1418.jpg  "> <br>
 cello  (corpus count: 2358848 ) hmmm no<br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-1043.jpg  "> <br>
 bathing  (corpus count: 2738196 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-2521.jpg  "> <br>
 submarine  (corpus count: 2766790 ) hmmmm quite <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-2944.jpg  "> <br>
 kite  (corpus count: 2808067 ) <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/2-12085.jpg  "> <br>
 racer  (corpus count: 3625077 ) (yes but slow)<br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/3-1315.jpg  "> <br>
 limousine  (corpus count: 4007578 ). Many "group pictures" are classified as limousine <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/1-1193.jpg  "> <br>
 violin  (corpus count: 5327802 ) no no no! <br> <img src="https://raw.githubusercontent.com/davidedc/The-strangest-things-in-your-pics/master/selectedImages/4-1044.jpg  "> <br>

## More on labels

Inception3 processed 9726 images. The most found objects and the least found objects are:

*Most found:*
pier	390
window	178
lakeside	177
spotlight	150
seashore	147
web	139
...

*Least found:*
...
vulture	1
walking	1
warthog	1
whippet	1
whiptail	1
whiskey	1
yellow	1
zebra	1
zucchini	1

The ```objects-occurrences.csv``` file lists them all.