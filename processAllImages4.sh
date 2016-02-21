ls -1 images4 > allImages4.txt
while IFS= read -r f <&3;
do
      #do something with "$f"
      ./runAdjusted.sh ./images4/$f | python extractToken.py | python howFrequent.py
done 3< allImages4.txt