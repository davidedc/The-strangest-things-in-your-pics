ls -1 images1 > allImages1.txt
while IFS= read -r f <&3;
do
      #do something with "$f"
      ./runAdjusted.sh ./images1/$f | python extractToken.py | python howFrequent.py
done 3< allImages1.txt