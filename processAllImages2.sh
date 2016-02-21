ls -1 images2 > allImages2.txt
while IFS= read -r f <&3;
do
      #do something with "$f"
      ./runAdjusted.sh ./images2/$f | python extractToken.py | python howFrequent.py
done 3< allImages2.txt